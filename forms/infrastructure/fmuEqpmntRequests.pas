unit fmuEqpmntRequests;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.ToolWin,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, DBCtrlsEh, amSplitter,
  Vcl.StdCtrls, Vcl.Mask, PropFilerEh, PropStorageEh;

type
  TapgEqpmntRequests = class(TA4onPage)
    dsRequests: TpFIBDataSet;
    srcRequests: TDataSource;
    dbGridCustReq: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    btnEdit: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsPhotos: TpFIBDataSet;
    srcPhotos: TDataSource;
    pnlText: TPanel;
    pnlPhoto: TPanel;
    spl1: TSplitter;
    dbgPhotos: TDBGridEh;
    imgJPG: TDBImageEh;
    Splitter1: TSplitter;
    mmoCONTETNT: TDBMemoEh;
    mmoTROUBLE: TDBMemoEh;
    Splitter2: TSplitter;
    PropStorageEh: TPropStorageEh;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbGridCustReqDblClick(Sender: TObject);
    procedure dbGridCustReqGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure imgJPGDblClick(Sender: TObject);
    procedure dbgPhotosDblClick(Sender: TObject);
    procedure dbGridCustReqRowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
    procedure dbGridCustReqRowDetailPanelShow(Sender: TCustomDBGridEh; var CanShow: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure PropStorageEhWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
    procedure PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
      var Processed: Boolean);
  private
    CE: Boolean;
    CC: Boolean;
    CG: Boolean;
    CA: Boolean;
    FullAccess: Boolean;
    FIsVertical: Boolean;
    procedure EnableControls;
    procedure SwitchLayout(const InVertical: Boolean);
  public
    procedure RefreshDS;
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, RequestNewForma, RequestForma, DM;

class function TapgEqpmntRequests.GetPageName: string;
begin
  Result := rsRequests;
end;

procedure TapgEqpmntRequests.SwitchLayout(const InVertical: Boolean);
begin
  if (FIsVertical = InVertical) then
    Exit;

  FIsVertical := InVertical;
  if not FIsVertical then
  begin
    pnlButtons.Align := alLeft;
    pnlButtons.Width := 26;
    btnEdit.Left := 2;
    btnEdit.Top := 30;
    btnDel.Left := 2;
    btnDel.Top := pnlButtons.Height - btnDel.Height - 4;
    btnDel.Anchors := [akLeft, akBottom];
  end
  else
  begin
    pnlButtons.Align := alTop;
    pnlButtons.Height := 26;
    btnEdit.Top := 2;
    btnEdit.Left := 30;
    btnDel.Top := 2;
    btnDel.Left := pnlButtons.Width - btnDel.Width - 4;
    btnDel.Anchors := [akTop, akRight];
  end;
end;

procedure TapgEqpmntRequests.imgJPGDblClick(Sender: TObject);
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

procedure TapgEqpmntRequests.RefreshDS;
begin
  dsRequests.CloseOpen(true);
  if dbGridCustReq.RowPanel.Active then
    dsPhotos.CloseOpen(true);
end;

procedure TapgEqpmntRequests.InitForm;
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

procedure TapgEqpmntRequests.EnableControls;
begin
  actEdit.Enabled := dsRequests.RecordCount > 0;
  actDel.Enabled := dsRequests.RecordCount > 0;
end;

procedure TapgEqpmntRequests.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FIsVertical := False;
end;

procedure TapgEqpmntRequests.FormResize(Sender: TObject);
var
  b: Boolean;
begin
  b := (dmMain.GetIniValue('EQUIPMENT_INFOLAYOUT') = '1');
  SwitchLayout(b);
end;

procedure TapgEqpmntRequests.OpenData;
begin
  dsRequests.Open;
  EnableControls;
end;

procedure TapgEqpmntRequests.PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
  var Processed: Boolean);
begin
  try
    if PropName = 'pnlText_Width' then
    begin
      pnlText.Width := StrToInt(Reader.ReadString());
      Processed := true;
    end
    else if PropName = 'mmoCONTETNT_Height' then
    begin
      mmoCONTETNT.Height := StrToInt(Reader.ReadString());
      Processed := true;
    end
    else if PropName = 'RowPanel_Height' then
    begin
      dbGridCustReq.RowDetailPanel.Height := StrToInt(Reader.ReadString());
      Processed := true;
    end
  except
    Processed := true;
  end;
end;

procedure TapgEqpmntRequests.PropStorageEhWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
begin
  Writer.WritePropName('pnlText_Width');
  Writer.WriteString(IntToStr(pnlText.Width));
  Writer.WritePropName('mmoCONTETNT_Height');
  Writer.WriteString(IntToStr(mmoCONTETNT.Height));
  Writer.WritePropName('RowPanel_Height');
  Writer.WriteString(IntToStr(dbGridCustReq.RowDetailPanel.Height));
end;

procedure TapgEqpmntRequests.actDelExecute(Sender: TObject);
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

procedure TapgEqpmntRequests.actEditExecute(Sender: TObject);
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

procedure TapgEqpmntRequests.actAddExecute(Sender: TObject);
var
  aNodeID: Integer;
begin
  if not FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
    aNodeID := FDataSource.DataSet['NODE_ID']
  else
    aNodeID := -1;
  NewNodeRequest(aNodeID, RefreshDS);
end;

procedure TapgEqpmntRequests.CloseData;
begin
  if dsPhotos.Active then
    dsPhotos.Close;
  dsRequests.Close;
end;

procedure TapgEqpmntRequests.dbgPhotosDblClick(Sender: TObject);
begin
  imgJPGDblClick(Sender);
end;

procedure TapgEqpmntRequests.dbGridCustReqDblClick(Sender: TObject);
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

procedure TapgEqpmntRequests.dbGridCustReqGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').IsNull then
    try
      Background := StringToColor((Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').Value);
    except
    end;
end;

procedure TapgEqpmntRequests.dbGridCustReqRowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  dsPhotos.Close;
end;

procedure TapgEqpmntRequests.dbGridCustReqRowDetailPanelShow(Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  dsPhotos.Open;
end;

end.
