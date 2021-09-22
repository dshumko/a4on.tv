unit fmuNodeRequests;

interface

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Actions, System.UITypes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.Buttons, VCL.ExtCtrls, VCL.ActnList,
  VCL.ComCtrls, VCL.ToolWin, Data.DB, WinAPI.ShellAPI,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet,
  DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL, DBGridEhGrouping,
  DynVarsEh, FIBDatabase, pFIBDatabase, DBCtrlsEh;

type
  TapgNodeRequests = class(TA4onPage)
    dsRequests: TpFIBDataSet;
    srcRequests: TDataSource;
    dbGridCustReq: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlPhoto: TPanel;
    dsPhotos: TpFIBDataSet;
    srcPhotos: TDataSource;
    dbgPhotos: TDBGridEh;
    spl1: TSplitter;
    imgJPG: TDBImageEh;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbGridCustReqDblClick(Sender: TObject);
    procedure dbGridCustReqGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure imgJPGDblClick(Sender: TObject);
    procedure dbgPhotosDblClick(Sender: TObject);
    procedure dbGridCustReqRowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure dbGridCustReqRowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
  private
    CE: Boolean;
    CC: Boolean;
    CG: Boolean;
    CA: Boolean;
    FullAccess: Boolean;
    procedure EnableControls;
  public
    procedure RefreshDS;
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses MAIN, AtrCommon, RequestNewForma, RequestForma, DM;

class function TapgNodeRequests.GetPageName: string;
begin
  Result := rsRequests;
end;

procedure TapgNodeRequests.imgJPGDblClick(Sender: TObject);
var
  FileName: string;
begin
  if dsPhotos.FieldByName('ID').IsNull or dsPhotos.FieldByName('jpg').IsNull then
    Exit;

  FileName := GetTempDir + 'A4on\';
  if not DirectoryExists(FileName) then
    CreateDir(FileName);
  FileName := FileName + IntToStr(dsPhotos['RQ_ID']) + '_' + IntToStr(dsPhotos['ID']) + '.jpg';
  TBlobField(dsPhotos.FieldByName('jpg')).SaveToFile(FileName);
  ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TapgNodeRequests.RefreshDS;
begin
  dsRequests.CloseOpen(true);
  if dbGridCustReq.RowPanel.Active then
    dsPhotos.CloseOpen(true);
end;

procedure TapgNodeRequests.InitForm;
begin
  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_Request_full); // (50, 'ПОЛНЫЙ ДОСТУП', 'ЗАЯВКИ', 'Полный доступ');
  CA := dmMain.AllowedAction(rght_Request_add); // (51, 'ДОБАВЛЕНИЕ', 'ЗАЯВКИ', 'Добавление заявок');
  CE := dmMain.AllowedAction(rght_Request_edit); // (52, 'РЕДАКТИРОВАНИЕ', 'ЗАЯВКИ', 'Редактирование заявки');
  CC := dmMain.AllowedAction(rght_Request_Close); // (54, 'ЗАКРЫТИЕ', 'ЗАЯВКИ', 'Закрытие заявки');
  CG := dmMain.AllowedAction(rght_Request_Give); // (53, 'ВЫДАЧА', 'ЗАЯВКИ', 'Выдача заявок в работу');

  actAdd.Visible := FullAccess or CA;
  actEdit.Visible := FullAccess or CE;
  actDel.Visible := FullAccess or CE;
  pnlButtons.Visible := FullAccess or CE or CA or CG;

  dsRequests.DataSource := FDataSource;
end;

procedure TapgNodeRequests.EnableControls;
begin
  actEdit.Enabled := dsRequests.RecordCount > 0;
  actDel.Enabled := dsRequests.RecordCount > 0;
end;

procedure TapgNodeRequests.OpenData;
begin
  dsRequests.Open;
  EnableControls;
end;

procedure TapgNodeRequests.actDelExecute(Sender: TObject);
begin
  if not dsRequests.FieldByName('RQ_ID').IsNull then
  begin
    if ((dsRequests.FieldByName('REQ_RESULT').IsNull) or (dsRequests.FieldByName('REQ_RESULT').AsInteger = 0)) then
    begin
      if Application.MessageBox(PWideChar(rsCancelRequest), PWideChar(rsRequestCancel),
        MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
      begin
        dsRequests.UpdateTransaction.StartTransaction;
        dsRequests.Edit;
        dsRequests['REQ_RESULT'] := 3;
        dsRequests.Post;
        dsRequests.UpdateTransaction.Commit;
        dsRequests.Refresh;
      end;
    end;
  end;
end;

procedure TapgNodeRequests.actEditExecute(Sender: TObject);
var
  aRequest: Integer;
  aNodeID: Integer;
  aMode: Byte;
Begin
  if not(FullAccess or CE or CC or CG or CA) then
    Exit;

  if not dsRequests.FieldByName('RQ_ID').IsNull then
  begin
    if not(FullAccess or CE or CC or CG) then
      Exit;
    aMode := 1;
    aRequest := dsRequests.FieldByName('RQ_ID').AsInteger;
  end
  else
  begin
    if not(FullAccess or CA) then
      Exit;
    aMode := 0;
    aRequest := -1;
  end;

  if not FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
    aNodeID := FDataSource.DataSet.FieldByName('NODE_ID').AsInteger
  else
    aNodeID := -1;
  // aNodeID = -2 Найдем узел при открытии заявки
  ReguestNodeExecute(aRequest, aNodeID, aMode);
  dsRequests.CloseOpen(true);
end;

procedure TapgNodeRequests.actAddExecute(Sender: TObject);
var
  aNodeID: Integer;
begin
  if not FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
    aNodeID := FDataSource.DataSet['NODE_ID']
  else
    aNodeID := -1;
  NewNodeRequest(aNodeID, RefreshDS);
end;

procedure TapgNodeRequests.CloseData;
begin
  if dsPhotos.Active then
    dsPhotos.Close;
  dsRequests.Close;
end;

procedure TapgNodeRequests.dbgPhotosDblClick(Sender: TObject);
begin
  imgJPGDblClick(Sender);
end;

procedure TapgNodeRequests.dbGridCustReqDblClick(Sender: TObject);
begin
  if dsRequests.FieldDefs.IndexOf('RQ_ID') = -1 then
    Exit;

  if (not dsRequests.FieldByName('RQ_ID').IsNull) then
  begin
    if actEdit.Enabled then
      actEdit.Execute;
  end
  else
  begin
    if actAdd.Enabled then
      actAdd.Execute;
  end;

end;

procedure TapgNodeRequests.dbGridCustReqGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').IsNull then
    try
      Background := StringToColor((Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').Value);
    except
    end;
end;

procedure TapgNodeRequests.dbGridCustReqRowDetailPanelHide(
  Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  dsPhotos.Close;
end;

procedure TapgNodeRequests.dbGridCustReqRowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  dsPhotos.Open;
end;

end.
