unit fmuCustomerInternet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, ComCtrls, ToolWin,
  DBCtrlsEh, StdCtrls, Mask, ExtCtrls, GridsEh, DBGridEh, DB, FIBDataSet,
  pFIBDataSet, ActnList, ibase, DBGridEhToolCtrls, DBAxisGridsEh,
  System.Actions, PrjConst, EhLibVCL, System.UITypes, DBGridEhGrouping,
  DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TDllForm = procedure(AppHandle: THandle; DBHandle: TISC_DB_HANDLE; ID: Integer; UserName: PWChar;
    Password: PWChar); StdCall;
  TDisconnectInDLL = procedure; stdcall;
  EDLLLoadError = class(Exception);

  TapgCustomerInternet = class(TA4onPage)
    srcInternet: TDataSource;
    dsInternet: TpFIBDataSet;
    dbgrdBill: TDBGridEh;
    tlbButtons: TToolBar;
    btnInfo: TToolButton;
    btnBillEdit: TToolButton;
    btnUnblock: TToolButton;
    btnBillDelete: TToolButton;
    ActListCustomers: TActionList;
    actEdit: TAction;
    actAdd: TAction;
    actDelete: TAction;
    actUnblock: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure actUnblockExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure srcInternetStateChange(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure dbgrdBillDblClick(Sender: TObject);
  private
    { Private declarations }
    bView: Boolean;
    bEdit: Boolean;
    bFull: Boolean;
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses MAIN, AtrCommon, DM, BillEditForma;

class function TapgCustomerInternet.GetPageName: string;
begin
  Result := rsInternet;
end;

procedure TapgCustomerInternet.InitForm;
begin
  dsInternet.DataSource := FDataSource;

  bEdit := dmMain.AllowedAction(rght_Billing_edit);
  bView := dmMain.AllowedAction(rght_Billing_view);
  bFull := dmMain.AllowedAction(rght_Customer_full);
end;

procedure TapgCustomerInternet.EnableControls;
begin
  actAdd.Enabled := (bEdit or bFull);
  btnInfo.Visible := False; // просмотр биллинг
  actUnblock.Visible := False; // правка биллинга
  actEdit.Enabled := (bEdit or bFull); // правка биллинга
  actDelete.Enabled := (bEdit or bFull); // правка биллинга
  tlbButtons.Visible := actAdd.Enabled or actEdit.Enabled or actDelete.Enabled;
end;

procedure TapgCustomerInternet.OpenData;
begin
  dsInternet.Open;
  EnableControls;
end;

procedure TapgCustomerInternet.srcInternetStateChange(Sender: TObject);
begin
  EnableControls;
end;

procedure TapgCustomerInternet.actDeleteExecute(Sender: TObject);
var
  s: string;
  DLLHandle: THandle;
  ShowDeleteForm: TDllForm;

begin
  if (dsInternet.RecordCount = 0) or dsInternet.FieldByName('BLNG_ID').IsNull then
    Exit;

  s := ExtractFilePath(Application.ExeName);
  s := s + 'internet.dll';
  if FileExists(s) then
  begin
    DLLHandle := LoadLibrary(PChar(s));
    try
      if DLLHandle <= 0 then
        MessageDlg('Error loading ' + QuotedStr(s), mtError, [mbOk], 0)
      else
      begin
        @ShowDeleteForm := GetProcAddress(DLLHandle, 'ShowDeleteForm');

        if Assigned(ShowDeleteForm) then
          ShowDeleteForm(Application.Handle, dmMain.dbTV.Handle, dsInternet.FieldByName('UNIT_ID').AsInteger,
            PChar(dmMain.USER), PChar(dmMain.Password))
        else
          MessageDlg('Error execute ShowDeleteForm', mtError, [mbOk], 0);
      end;
    finally
      FreeLibrary(DLLHandle);
    end;
  end
  else
  begin
    if MessageDlg(format(rsDeleteWithName, [dsInternet['LOGIN']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dsInternet.Delete;
  end;

  dsInternet.CloseOpen(true);
end;

procedure TapgCustomerInternet.actEditExecute(Sender: TObject);
var
  s: string;
  DLLHandle: THandle;
  UnblockUser: TDllForm;
begin
  if (not(bEdit or bFull)) then
    Exit;
  if (dsInternet.RecordCount = 0) or dsInternet.FieldByName('BLNG_ID').IsNull then
    Exit;

  s := ExtractFilePath(Application.ExeName);
  s := s + 'internet.dll';
  if FileExists(s) then
  begin
    DLLHandle := LoadLibrary(PChar(s));
    try
      if DLLHandle <= 0 then
        MessageDlg('Error loading ' + QuotedStr(s), mtError, [mbOk], 0)
      else
      begin
        @UnblockUser := GetProcAddress(DLLHandle, 'EditUser');
        if Assigned(UnblockUser) then
          UnblockUser(Application.Handle, dmMain.dbTV.Handle, dsInternet.FieldByName('UNIT_ID').AsInteger,
            PChar(dmMain.USER), PChar(dmMain.Password))
        else
          MessageDlg('Error execute UnblockUser', mtError, [mbOk], 0);
      end
    finally
      FreeLibrary(DLLHandle);
    end;
  end
  else
  begin
    if EditBillInfo(dsInternet['BLNG_ID'], FDataSource.DataSet.FieldByName('CUSTOMER_ID').AsInteger,
      FDataSource.DataSet.FieldByName('ACCOUNT_NO').AsString) > 0 then
      dsInternet.Refresh;
  end;

end;

procedure TapgCustomerInternet.actAddExecute(Sender: TObject);
var
  s: string;
  DLLHandle: THandle;
  AddUserForm: TDllForm;
begin
  if (not(bEdit or bFull)) then
    Exit;

  s := ExtractFilePath(Application.ExeName) + 'internet.dll';
  if FileExists(s) then
  begin
    DLLHandle := LoadLibrary(PChar(s));
    try
      if DLLHandle <= 0 then
        MessageDlg('Error loading ' + QuotedStr(s), mtError, [mbOk], 0)
      else
      begin
        @AddUserForm := GetProcAddress(DLLHandle, 'AddInternetUser');
        if Assigned(AddUserForm) then
        begin
          AddUserForm(Application.Handle, dmMain.dbTV.Handle, FDataSource.DataSet.FieldByName('CUSTOMER_ID').AsInteger,
            PWChar(dmMain.USER), PWChar(dmMain.Password));
          dsInternet.CloseOpen(true);
        end
        else
          MessageDlg('Error execute AddInternetUser', mtError, [mbOk], 0);
      end;
    finally
      FreeLibrary(DLLHandle);
    end;
  end
  else
  begin
    if EditBillInfo(-1, FDataSource.DataSet.FieldByName('CUSTOMER_ID').AsInteger,
      FDataSource.DataSet.FieldByName('ACCOUNT_NO').AsString) > 0 then
      dsInternet.CloseOpen(true);
  end;
end;

procedure TapgCustomerInternet.actUnblockExecute(Sender: TObject);
var
  s: string;
  DLLHandle: THandle;
  UnblockUser: TDllForm;
begin
  s := ExtractFilePath(Application.ExeName);
  s := s + 'internet.dll';
  if FileExists(s) then
  begin
    DLLHandle := LoadLibrary(PChar(s));
    try
      if DLLHandle <= 0 then
        MessageDlg('Error loading ' + QuotedStr(s), mtError, [mbOk], 0)
      else
      begin
        @UnblockUser := GetProcAddress(DLLHandle, 'UnblockUser');
        if Assigned(UnblockUser) then
          UnblockUser(Application.Handle, dmMain.dbTV.Handle, dsInternet.FieldByName('UNIT_ID').AsInteger,
            PChar(dmMain.USER), PChar(dmMain.Password))
        else
          MessageDlg('Error execute UnblockUser', mtError, [mbOk], 0);
      end
    finally
      FreeLibrary(DLLHandle);
    end;
  end
end;

procedure TapgCustomerInternet.CloseData;
begin
  dsInternet.Close;
end;

procedure TapgCustomerInternet.dbgrdBillDblClick(Sender: TObject);
begin
  if (not(Sender as TDBGridEh).DataSource.DataSet.Active) then
    Exit;

  if (Sender as TDBGridEh).DataSource.DataSet.RecordCount = 0 then
    actAdd.Execute
  else
    actEdit.Execute;
end;

end.
