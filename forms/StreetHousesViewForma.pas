unit StreetHousesViewForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, CnErrorProvider, Vcl.Menus,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, MemTableDataEh, MemTableEh, DataDriverEh,
  pFIBDataDriverEh, DBGridEhImpExp, PrnDbgeh;

type
  TStreetHouseViewForm = class(TForm)
    dbgView: TDBGridEh;
    srcView: TDataSource;
    drvFIBView: TpFIBDataDriverEh;
    mtView: TMemTableEh;
    pmPopUp: TPopupMenu;
    mniFilterFLD: TMenuItem;
    mniN1: TMenuItem;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep2: TMenuItem;
    pmgSaveSelection: TMenuItem;
    prntdbgrdh: TPrintDBGridEh;
    miN1: TMenuItem;
    miN2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mniFilterFLDClick(Sender: TObject);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure pmgSaveSelectionClick(Sender: TObject);
    procedure miN2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StreetHouseViewForm: TStreetHouseViewForm;

implementation

uses DM, MAIN, AtrStrUtils, PrjConst;

{$R *.dfm}

procedure TStreetHouseViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if (dbgView.DataGrouping.ActiveGroupLevelsCount = 0) then
  begin
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGridEh then
        (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
          Self.Name + '.' + Components[i].Name, True);
  end;
  Action := caFree;

  mtView.Active := False;
  StreetHouseViewForm := nil;
end;

procedure TStreetHouseViewForm.FormShow(Sender: TObject);
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
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end;
  end;

  mtView.Active := True;
end;

procedure TStreetHouseViewForm.miN2Click(Sender: TObject);
begin
  prntdbgrdh.Preview;
end;

procedure TStreetHouseViewForm.mniFilterFLDClick(Sender: TObject);
begin
  try
    dbgView.SearchPanel.Visible := True;
    dbgView.SearchPanel.SearchingText := dbgView.SelectedField.AsString;
    dbgView.SearchPanel.ApplySearchFilter;
    dbgView.SearchPanel.Active := True;
  except
    dbgView.SearchPanel.CancelSearchFilter;
    dbgView.SearchPanel.Visible := False;
  end;
end;

procedure TStreetHouseViewForm.pmgCopyClick(Sender: TObject);
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

procedure TStreetHouseViewForm.pmgSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;
begin
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

procedure TStreetHouseViewForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

end.
