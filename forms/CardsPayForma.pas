﻿unit CardsPayForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, FIBDataSet, pFIBDataSet, Menus, ComCtrls, ToolWin,
  GridsEh, DBGridEh, EhLibFIB, frxDBSet, StdCtrls, Buttons, System.UITypes,
  ExtCtrls, ToolCtrlsEh, DBGridEhToolCtrls, frxClass,
  DBAxisGridsEh, PrjConst, System.Actions, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TfmCardsPay = class(TForm)
    dbgrdhCardPay: TDBGridEh;
    tlb1: TToolBar;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    edSearch: TEdit;
    ToolButton14: TToolButton;
    btn1: TToolButton;
    btnNew: TToolButton;
    btn3: TToolButton;
    btnEdit: TToolButton;
    btn5: TToolButton;
    btnDelete: TToolButton;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actPaymentEdit1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    srcCardPay: TDataSource;
    dsCardPay: TpFIBDataSet;
    actlstactions: TActionList;
    actNew: TAction;
    actDelete: TAction;
    actActivateCard: TAction;
    pmGrid: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    btn2: TToolButton;
    btnQuickFiltr: TToolButton;
    actQuickFiltr: TAction;
    btn4: TToolButton;
    btnPrintCARDS: TToolButton;
    actPrintCARDS: TAction;
    frxCards: TfrxDBDataset;
    actCardPaySettings: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure dbgrdhCardPaySortMarkingChanged(Sender: TObject);
    procedure actQuickFiltrExecute(Sender: TObject);
    procedure frxCardsCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxCardsFirst(Sender: TObject);
    procedure frxCardsNext(Sender: TObject);
    procedure frxCardsPrior(Sender: TObject);
    procedure actPrintCARDSExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actActivateCardExecute(Sender: TObject);
    procedure actCardPaySettingsExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSearchChange(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
  private
    { Private declarations }
    fSelectedRow : Integer;
  public
    { Public declarations }
  end;

var
  fmCardsPay: TfmCardsPay;

implementation

uses MAIN, DBGridEhImpExp, AtrCommon, CardPayGenerateForma, CardPayActivateForma, 
  CardsPaySettingsForma, DBGridEhFindDlgs, DM, AtrStrUtils, ReportPreview;

{$R *.dfm}

procedure TfmCardsPay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsCardPay.Close;
  fmCardsPay := nil;
  dbgrdhCardPay.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'CardPay', false);
  Action := caFree;
end;

procedure TfmCardsPay.N5Click(Sender: TObject);
var
  dbg : TDBGridEh;
begin
  if (ActiveControl is TDBGridEh)
  then begin
    dbg :=  (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions)
    then
      if dbg.CheckCopyAction
      then DBGridEh_DoCopyAction(dbg,False)
      else StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TfmCardsPay.N6Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TfmCardsPay.N7Click(Sender: TObject);
var ExpClass:TDBGridEhExportClass;
    Ext:String;
begin
  A4MainForm.SaveDialog.FileName := rsCustomers;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then
    begin
      case A4MainForm.SaveDialog.FilterIndex of
        1: begin ExpClass := TDBGridEhExportAsUnicodeText; Ext := 'txt'; end;
        2: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
        3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
        4: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
        5: begin ExpClass := TDBGridEhExportAsOLEXLS; Ext := 'xls'; end;
      else
        ExpClass := nil; Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName,Length(A4MainForm.SaveDialog.FileName)-2,3)) <>
           AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass,TDBGridEh(ActiveControl),
             A4MainForm.SaveDialog.FileName,False);
      end;
    end;
end;

procedure TfmCardsPay.SpeedButton2Click(Sender: TObject);
begin
  edSearchChange(sender);
  edSearch.SetFocus;
end;

procedure TfmCardsPay.ToolButton14Click(Sender: TObject);
begin
  ExecuteDBGridEhFindDialogProc(dbgrdhCardPay, edSearch.Text, '', nil, False);
end;

procedure TfmCardsPay.FormShow(Sender: TObject);
var
 FullAcces: boolean;

begin
  dsCardPay.Open;
  FullAcces                  := dmMain.AllowedAction(rght_Pays_full); //полный доступ к платежам
  actNew.Visible             := (dmMain.AllowedAction(rght_Pays_CardsGen)) or FullAcces; // Генерация карт оплат
  actDelete.Visible          := (dmMain.AllowedAction(rght_Pays_del)) or FullAcces; // Удаление платежа
  actActivateCard.Visible    := (dmMain.AllowedAction(rght_Pays_add)) or FullAcces; // Добавление платежа
  actCardPaySettings.Visible := dmMain.AllowedAction(rght_Programm_Settings); // Настройка программы

  actPrintCARDS.Visible := (dmMain.GET_ID_REPORT_BY_PATH(rsPayCardReport)>=0);
  dbgrdhCardPay.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'CardPay', [crpColIndexEh,crpColWidthsEh,crpColVisibleEh]);
end;

procedure TfmCardsPay.actNewExecute(Sender: TObject);
begin
  if GenerateCardPay()
  then dsCardPay.CloseOpen(true);
end;

procedure TfmCardsPay.dbgrdhCardPaySortMarkingChanged(Sender: TObject);
var
  cr:TCursor;
  s : string;
  I,J  : integer;
  Grid : TCustomDBGridEh;
  id : Integer;
  FIBDS : TpFibDataset;

begin
  cr:= Screen.Cursor;
  Screen.Cursor := crSqlWait;
  Grid:=TCustomDBGridEh(Sender);
  FIBDS :=  TpFibDataset(Grid.DataSource.DataSet);
  if Sender is TCustomDBGridEh
  then begin
    if not FIBDS.FieldByName('CARD_ID').IsNull
    then id := FIBDS['CARD_ID']
    else id := -1;

    FIBDS.Close;

    J:=Grid.SortMarkedColumns.Count;
    s := ' ';
    for i:=0 to pred(j) do begin
      if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='ACCOUNT_NO')
      then s := s + 'C.account_no'
      else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='FIO')
       then S := s + 'C.Surname||C.Initials'
       else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='PAY_DATE')
            then s := s + 'P.Pay_Date'
            else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='EXPIRATION_DATE')
                 then s := s + 'Cp.Expiration_Date'
            else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='CARD_PIN')
                 then s := s + 'Cp.Card_Pin'
            else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='CARD_NOMINAL')
                 then s := s + 'Cp.Card_Nominal'
            else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='CARD_NUMBER')
                 then s := s + 'Cp.Card_Number'
            else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='CS_SERIAL')
                 then s := s + 'Cs.Cs_Serial'
            else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='ADDED_ON')
                 then s := s + 'CP.ADDED_ON'

                 else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='DEBT_SUM')
                   then s := s + 'C.Debt_Sum'
                   else if (AnsiUpperCase(Grid.SortMarkedColumns[i].fieldname)='CUST_CODE')
                     //then s := s + 'FOR_ADRES_SORT'
                     then s := s + 'C.CUST_CODE'
                     else S := s + Grid.SortMarkedColumns[i].fieldname;
      //s := s + ' COLLATE UNICODE_CI_AI ';
      if Grid.SortMarkedColumns[i].Title.SortMarker=smDownEh
      then s := S + ' desc';
      if i <> pred(j) then s := s + ', ';
    end;
    FIBDS.OrderClause := s;
    FIBDS.Open;
    if (id = -1)
    then FIBDS.Locate('CARD_ID',ID,[]);
  end;
  Screen.Cursor := cr;
end;

procedure TfmCardsPay.edSearchChange(Sender: TObject);
var
  NesSs : string;
  f : string;
  bm: TBookMark;
begin
  NesSs := edSearch.Text;
  dbgrdhCardPay.DataSource.DataSet.DisableControls;
  bm := dbgrdhCardPay.DataSource.DataSet.GetBookmark;
  dbgrdhCardPay.DataSource.DataSet.First;
  if not dsCardPay.Locate(dbgrdhCardPay.Columns[dbgrdhCardPay.SelectedIndex].FieldName,VarArrayOf([NesSs]),[loPartialKey,loCaseInsensitive])
  then dbgrdhCardPay.DataSource.DataSet.GotoBookmark(bm);
  dbgrdhCardPay.DataSource.DataSet.EnableControls;

  f := Copy(dbgrdhCardPay.Columns[dbgrdhCardPay.SelectedIndex].DisplayText, 1, Length(edSearch.Text));
  if (ANSIUPPERCASE(f) <> ANSIUPPERCASE(nesss))
  then edSearch.Font.Color := clRed
  else edSearch.Font.Color := clWindowText;
end;

procedure TfmCardsPay.edSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN
  then  begin
    dbgrdhCardPay.StopInplaceSearch;
    dbgrdhCardPay.SetFocus;
  end
  else if key = vk_ESCAPE then  begin
    dbgrdhCardPay.StopInplaceSearch;
    edSearch.Text:='';
  end;
end;

procedure TfmCardsPay.actQuickFiltrExecute(Sender: TObject);
begin
  actQuickFiltr.Checked := not actQuickFiltr.Checked;
  dbgrdhCardPay.STFilter.Visible := actQuickFiltr.Checked;
  if not actQuickFiltr.Checked
  then dbgrdhCardPay.DataSource.DataSet.Filtered := False;
end;

procedure TfmCardsPay.frxCardsCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgrdhCardPay.SelectedRows.Count>0
  then Eof := (fSelectedRow > dbgrdhCardPay.SelectedRows.Count)
end;

procedure TfmCardsPay.frxCardsFirst(Sender: TObject);
begin
  if dbgrdhCardPay.SelectedRows.Count>0
  then begin
    fSelectedRow := 1;
    dbgrdhCardPay.DataSource.DataSet.Bookmark := dbgrdhCardPay.SelectedRows[0];
  end
end;

procedure TfmCardsPay.frxCardsNext(Sender: TObject);
begin
  if (dbgrdhCardPay.SelectedRows.Count>0)
  then begin
      if fSelectedRow< dbgrdhCardPay.SelectedRows.Count
      then dbgrdhCardPay.DataSource.DataSet.Bookmark := dbgrdhCardPay.SelectedRows[fSelectedRow];
      inc(fSelectedRow);
  end
end;

procedure TfmCardsPay.frxCardsPrior(Sender: TObject);
begin
  if dbgrdhCardPay.SelectedRows.Count>0
  then begin
    dec(fSelectedRow);
    dbgrdhCardPay.DataSource.DataSet.Bookmark := dbgrdhCardPay.SelectedRows[fSelectedRow-1];
  end;
end;

procedure TfmCardsPay.actPrintCARDSExecute(Sender: TObject);
var
 bm: TBookMark;
begin
  dsCardPay.DisableControls;
  bm:=dsCardPay.GetBookmark;
  dsCardPay.First;
  ShowReport(rsPayCardReport);
  dsCardPay.GotoBookmark(bm);
  dsCardPay.EnableControls;
end;

procedure TfmCardsPay.actDeleteExecute(Sender: TObject);
var
  i:integer;
  AR, FullAccess: boolean;
  Ds :TpFIBDataSet;
begin
  ds := dbgrdhCardPay.DataSource.DataSet as TpFIBDataSet;
  if ds.RecordCount = 0 then exit;

  FullAccess := dmMain.AllowedAction(rght_Pays_full); // полный доступ
  ar:=dmMain.AllowedAction(rght_Pays_del);  //Удаление
  ar:=ar or FullAccess; //полный доступ
  if (not ar) then exit;

  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrNo)
  then exit;

  if (dbgrdhCardPay.SelectedRows.Count>1)
  then begin
    try
      Screen.Cursor := crHourGlass;
      for i:=0 to (dbgrdhCardPay.SelectedRows.Count-1) do
        begin
          ds.GotoBookmark(pointer(dbgrdhCardPay.SelectedRows.Items[i]));
          ds.Delete;
        end;
    finally
      Screen.Cursor := crDefault;
    end
  end
  else ds.Delete;

  ds.CloseOpen(true);
end;

procedure TfmCardsPay.actActivateCardExecute(Sender: TObject);
begin
  if not dsCardPay.FieldByName('CARD_ID').IsNull
  then
    if CardPayActivate(dsCardPay['CARD_ID'], -1) then dsCardPay.Refresh;
end;

procedure TfmCardsPay.actCardPaySettingsExecute(Sender: TObject);
begin
  With TCardsPaySettingsForm.Create(application) do begin
    showmodal;
  end;
end;

end.
