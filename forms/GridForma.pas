unit GridForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.UITypes, System.Classes, System.SysUtils, System.Actions,
  Data.DB,
  Vcl.Menus, Vcl.ActnList, Vcl.Controls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Forms, Vcl.Graphics, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,
  DBGridEhGrouping, DynVarsEh, DBGridEh, FIBDataSet, GridsEh, EhLibFIB, DBGridEhFindDlgs, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider, DBLookupEh, EhLibVCL, DBCtrlsEh, PrjConst, amSplitter,
  PrnDbgeh;

type
  TGridForm = class(TForm)
    dbGrid: TDBGridEh;
    srcDataSource: TDataSource;
    tlbMain: TToolBar;
    Actions: TActionList;
    actNew: TAction;
    actDelete: TAction;
    actEdit: TAction;
    btnNew: TToolButton;
    btnDelete: TToolButton;
    btnEdit: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    tbOk: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    tbCancel: TToolButton;
    actQuickFilter: TAction;
    btnQuickFilter: TToolButton;
    ToolButton20: TToolButton;
    pmPopUp: TPopupMenu;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep1: TMenuItem;
    pmgSaveSelection: TMenuItem;
    pnlEdit: TPanel;
    btnSaveLink: TBitBtn;
    btnCancelLink: TBitBtn;
    CnErrors: TCnErrorProvider;
    actFilterFLD: TAction;
    mniFilterFLD: TMenuItem;
    mniN1: TMenuItem;
    pmgSep2: TMenuItem;
    miRefresh: TMenuItem;
    splPG: TSplitter;
    printGridEh: TPrintDBGridEh;
    actPrintGrid: TAction;
    miPrintGrid: TMenuItem;
    procedure actQuickFilterExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure pmgSaveSelectionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actFilterFLDExecute(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure FormCreate(Sender: TObject);
    procedure dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure SetGridsPopUpMenu(pmGrid: TPopupMenu);
    procedure actPrintGridExecute(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
  protected
    { Private declarations }
    FCanEdit: Boolean;
    FCanCreate: Boolean;
    FinEditMode: Boolean;
    FEnterSecondPress: Boolean;
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit(const Cancel: Boolean);
    procedure ResizeButtonImagesforHighDPI(const container: TWinControl);
    procedure CloseDatasets;
  public
    function GetGridSortOrder(Grid: TDBGridEh): String;
  end;

implementation

uses
  DM, MAIN, AtrStrUtils, fs_iinterpreter;

{$R *.dfm}

// http://zarko-gajic.iz.hr/making-the-glyph-property-high-dpi-aware-for-tbitbtn-and-tspeedbutton/
procedure TGridForm.ResizeButtonImagesforHighDPI(const container: TWinControl);
var
  b: Vcl.Graphics.TBitmap;
  i: Integer;

  procedure ResizeGlyph(const sb: TSpeedButton; const bb: TBitBtn);
  var
    ng: Integer;
  begin
    ng := 1;
    if Assigned(sb) then
      ng := sb.NumGlyphs;
    if Assigned(bb) then
      ng := bb.NumGlyphs;

    b := Vcl.Graphics.TBitmap.Create;
    try
      b.Width := ng * MulDiv(16, Screen.PixelsPerInch, 96);
      b.Height := MulDiv(16, Screen.PixelsPerInch, 96);
      b.Canvas.FillRect(b.Canvas.ClipRect);

      if Assigned(sb) AND (NOT sb.Glyph.Empty) then
      begin
        b.Canvas.StretchDraw(Rect(0, 0, b.Width, b.Height), sb.Glyph);
        sb.Glyph.Assign(b);
      end;

      if Assigned(bb) AND (NOT bb.Glyph.Empty) then
      begin
        b.Canvas.StretchDraw(Rect(0, 0, b.Width, b.Height), bb.Glyph);
        bb.Glyph.Assign(b);
      end;
    finally
      b.Free;
    end;
  end; (* ResizeGlyph *)

begin
  if Screen.PixelsPerInch = 96 then
    Exit;
  if Screen.PixelsPerInch * 100 / 96 <= 150 then
    Exit;

  for i := 0 to -1 + container.ControlCount do
  begin
    if container.Controls[i] IS TBitBtn then
      ResizeGlyph(nil, TBitBtn(container.Controls[i]));
    if container.Controls[i] IS TSpeedButton then
      ResizeGlyph(TSpeedButton(container.Controls[i]), nil);

    if container.Controls[i] is TWinControl then
      ResizeButtonImagesforHighDPI(TWinControl(container.Controls[i]));
  end;

end;

procedure TGridForm.actFilterFLDExecute(Sender: TObject);
begin
  try
    dbGrid.SearchPanel.Visible := True;
    dbGrid.SearchPanel.SearchingText := dbGrid.SelectedField.AsString;
    dbGrid.SearchPanel.ApplySearchFilter;
    dbGrid.SearchPanel.Active := True;
  except
    dbGrid.SearchPanel.CancelSearchFilter;
    dbGrid.SearchPanel.Visible := False;
  end;
end;

procedure TGridForm.actPrintGridExecute(Sender: TObject);
var
  dbg: TDBGridEh;
begin
  if (ActiveControl is TDBGridEh) then
  begin
    printGridEh.DBGridEh := (ActiveControl as TDBGridEh);
    printGridEh.Preview;
  end;
end;

procedure TGridForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbGrid.STFilter.Visible := actQuickFilter.Checked;
  if not actQuickFilter.Checked then
    dbGrid.DataSource.DataSet.Filtered := False;
end;

procedure TGridForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdit(True);
end;

procedure TGridForm.btnSaveLinkClick(Sender: TObject);
begin
  StopEdit(False);
end;

procedure TGridForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  v: TfsCustomVariable;
begin
  if fsGlobalUnit <> nil then
  begin
    v := fsGlobalUnit.Find(Self.Name);
    if v <> nil then
      fsGlobalUnit.RemoveItems(Self);
  end;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, False);

  CloseDatasets;

  Action := caFree;
end;

procedure TGridForm.CloseDatasets;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDataSet then
    begin
      if (Components[i] as TDataSet).Active then
        (Components[i] as TDataSet).Close;
    end;
  end;
end;

procedure TGridForm.FormCreate(Sender: TObject);
begin
  // http://zarko-gajic.iz.hr/making-the-glyph-property-high-dpi-aware-for-tbitbtn-and-tspeedbutton/
  if Screen.PixelsPerInch <> 96 then
  begin
    ResizeButtonImagesforHighDPI(Self);
  end;

  with fsGlobalUnit do
  begin
    AddedBy := Self;
    AddForm(Self);
    AddedBy := nil;
  end;
end;

procedure TGridForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (pnlEdit.Visible) then
    StopEdit(False);
  if (Ord(Key) = VK_ESCAPE) and (pnlEdit.Visible) then
    StopEdit(True);
end;

procedure TGridForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if not pnlEdit.Visible then
    Exit;

  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := False	  
    else
    begin
      if (ActiveControl is TDBMemoEh) and (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure TGridForm.FormShow(Sender: TObject);
var
  i, c: Integer;
  Font_size: Integer;
  Font_name, s: string;
  Row_height: Integer;
begin
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if ((Components[i] as TDBGridEh).DataSource <> nil) and ((Components[i] as TDBGridEh).DataSource.DataSet.Active)
      then
        (Components[i] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
      for c := 0 to (Components[i] as TDBGridEh).Columns.Count - 1 do
      begin
        s := (Components[i] as TDBGridEh).Columns[c].FieldName.toUpper;
        if (s.Contains('NOTICE') or s.Contains('DESCRIPTION')) and
          (not Assigned((Components[i] as TDBGridEh).Columns[c].OnGetCellParams)) then
          (Components[i] as TDBGridEh).Columns[c].OnGetCellParams := dbGridColumnsGetCellParams
      end;
    end;
  end;
  FinEditMode := False;
  SetGridsPopUpMenu(pmPopUp);
end;

procedure TGridForm.pmgCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;
begin
  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
         A4MainForm.CopyDBGrid(dbg)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TGridForm.pmgSaveSelectionClick(Sender: TObject);
begin
  inherited;
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TGridForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TGridForm.StartEdit(const New: Boolean = False);
begin
  if not FCanEdit then
    Exit;

  if (not New) then
  begin
    if (srcDataSource.DataSet.RecordCount = 0) then
      Exit
    else
      srcDataSource.DataSet.Refresh;
  end;

  pnlEdit.Visible := True;
  splPG.Visible := True;
  dbGrid.Enabled := False;
  tlbMain.Enabled := False;

  pnlEdit.SetFocus;
  PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);

  if New then
    srcDataSource.DataSet.Append;
//  else
//    srcDataSource.DataSet.Edit;

  btnSaveLink.Enabled := False;
  srcDataSource.AutoEdit := True;
  FinEditMode := True;
end;

procedure TGridForm.StopEdit(const Cancel: Boolean);
begin
  splPG.Visible := False;
  pnlEdit.Visible := False;
  dbGrid.Enabled := True;
  tlbMain.Enabled := True;
  if (Cancel) or (not FCanEdit) then
  begin
    if (srcDataSource.DataSet.State in [dsEdit, dsInsert]) then
      srcDataSource.DataSet.Cancel
  end
  else
  begin
    if FCanEdit then
      srcDataSource.DataSet.Post
    else
      srcDataSource.DataSet.Cancel;
  end;
  dbGrid.SetFocus;

  srcDataSource.AutoEdit := False;
  FinEditMode := False;
end;

procedure TGridForm.miRefreshClick(Sender: TObject);
var
  bm: TbookMark;
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    bm := srcDataSource.DataSet.GetBookMark;
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.Open;
    srcDataSource.DataSet.GotoBookmark(bm);
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TGridForm.dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, ' ', [rfReplaceAll]);
end;

procedure TGridForm.dbGridDblClick(Sender: TObject);
begin
  if srcDataSource.DataSet.RecordCount > 0 then
  begin
    if not(actEdit.Enabled or actEdit.Visible) then
      Exit;
    actEdit.Execute;
  end
  else
  begin
    if not(actNew.Enabled or actNew.Visible) then
      Exit;
    actNew.Execute;
  end;
end;

procedure TGridForm.dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
var
  i: Integer;
begin
  if (DataCol = 1) and (Row = 0) then
  begin
    i := (Sender as TDBGridEh).SelectedRows.Count;
    if i > 1 then
      Text := IntToStr(i);
  end;
end;

function TGridForm.GetGridSortOrder(Grid: TDBGridEh): String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to pred(Grid.SortMarkedColumns.Count) do
  begin
    Result := Result + Grid.SortMarkedColumns[i].FieldName;
    if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      Result := Result + ' desc';
    Result := Result + ','
  end;
  Result := Result.TrimRight([',']);
end;

procedure TGridForm.SetGridsPopUpMenu(pmGrid: TPopupMenu);
var
  rghtExport: Boolean;
var
  i: Integer;
begin
  actPrintGrid.Visible := dmMain.AllowedAction(rght_Reports_view);
  rghtExport := dmMain.AllowedAction(rght_Export);
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).EditActions := (Components[i] as TDBGridEh).EditActions + [geaCopyEh];
      (Components[i] as TDBGridEh).Options := (Components[i] as TDBGridEh).Options - [dgRowSelect];
      (Components[i] as TDBGridEh).OptionsEh := (Components[i] as TDBGridEh).OptionsEh + [dghRowHighlight];

      if rghtExport then begin
        (Components[i] as TDBGridEh).AllowedSelections := [gstRecordBookmarks,gstRectangle,gstColumns,gstAll];
        (Components[i] as TDBGridEh).Options := (Components[i] as TDBGridEh).Options + [dgMultiSelect];
      end
      else begin
        (Components[i] as TDBGridEh).AllowedSelections := [];
        (Components[i] as TDBGridEh).Options := (Components[i] as TDBGridEh).Options - [dgMultiSelect];
      end;

      if ((Components[i] as TDBGridEh).PopUpMenu = nil) then
        (Components[i] as TDBGridEh).PopUpMenu := pmGrid;
    end;
  end;
end;

procedure TGridForm.srcDataSourceStateChange(Sender: TObject);
begin
  btnSaveLink.Enabled := (srcDataSource.State in [dsEdit, dsInsert]);
end;

end.
