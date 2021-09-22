﻿unit GridForma;

interface

uses
  System.UITypes, Vcl.Menus, System.Classes, Vcl.ActnList,
  Data.DB, Vcl.Controls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Forms,
  Vcl.Graphics, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Actions, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DBGridEhGrouping, DynVarsEh, DBGridEh, FIBDataSet, GridsEh,
  EhLibFIB, DBGridEhImpExp, DBGridEhFindDlgs, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, CnErrorProvider, DBLookupEh, EhLibVCL, DBCtrlsEh, PrjConst;

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
  protected
    { Private declarations }
    FCanEdit: Boolean;
    FCanCreate: Boolean;
    FinEditMode: Boolean;
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit(const Cancel: Boolean);
  public
    function GetGridSortOrder(Grid: TDBGridEh): String;
  end;

implementation

uses DM, MAIN, AtrStrUtils;

{$R *.dfm}

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
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, True);
  Action := caFree;
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

  if (Key = #13) then
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible;
    if (ActiveControl is TDBGridEh) then
      go := False;
    if (ActiveControl is TDBMemoEh) then
      go := False;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TGridForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
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
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end;
  end;
  FinEditMode := False;
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
      begin
        // Экспорт информации
        if (dmMain.AllowedAction(rght_Export)) then
          DBGridEh_DoCopyAction(dbg, False);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TGridForm.pmgSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin
  inherited;
  // Экспорт информации
  if (not dmMain.AllowedAction(rght_Export)) then
    Exit;

  A4MainForm.SaveDialog.FileName := rsTable;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then
    begin
      case A4MainForm.SaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5:
          begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;
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
    srcDataSource.DataSet.Append
  else
    srcDataSource.DataSet.Edit;

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
    Result := Result + Grid.SortMarkedColumns[i].fieldname;
    if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      Result := Result + ' desc';
    Result := Result + ','
  end;
  Result := Result.TrimRight([',']);
end;

end.