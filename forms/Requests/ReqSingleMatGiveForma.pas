unit ReqSingleMatGiveForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, PropFilerEh, Data.DB, FIBDataSet, pFIBDataSet,
  PropStorageEh, DBGridEh, DBCtrlsEh, Vcl.Mask, DBLookupEh,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, CnErrorProvider;

type
  TReqSingleMatGiveForm = class(TForm)
    pnlB: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    PropStorage: TPropStorageEh;
    dsMaterial: TpFIBDataSet;
    srcMaterial: TDataSource;
    CnErrors: TCnErrorProvider;
    dsWH: TpFIBDataSet;
    srcWH: TDataSource;
    lblDim: TLabel;
    pnlTop: TPanel;
    lbl3: TLabel;
    ednQ: TDBNumberEditEh;
    lbl2: TLabel;
    lcbWH: TDBLookupComboboxEh;
    lbl1: TLabel;
    lcbEquipment: TDBLookupComboboxEh;
    pnlClient: TPanel;
    mmoN: TDBMemoEh;
    pnlByBack: TPanel;
    lblCost: TLabel;
    ednCost: TDBNumberEditEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure lcbEquipmentChange(Sender: TObject);
    procedure dsWHBeforeOpen(DataSet: TDataSet);
  private
    FRq_Id: Integer;
    FOwnerID: Integer;
    FOwnerIsCustomer: Boolean;
    function CheckAndSave: Boolean;
    function SaveInDB: Boolean;
  public
    property Rq_Id: Integer read FRq_Id write FRq_Id;
    property OwnerID: Integer read FOwnerID write FOwnerID;
    property OwnerIsCustomer: Boolean read FOwnerIsCustomer write FOwnerIsCustomer;
  end;

function SingleMatGive(const aRequest: Integer; const aOwnerID: Integer;
  const aOwnerIsCustomer: Boolean = True; const aByBack: Boolean = False): Boolean;

implementation

uses
  PrjConst, DM, MAIN, pFIBQuery;

{$R *.dfm}

function SingleMatGive(const aRequest: Integer; const aOwnerID: Integer;
  const aOwnerIsCustomer: Boolean = True; const aByBack: Boolean = False): Boolean;
begin
  with TReqSingleMatGiveForm.Create(Application) do
  begin
    Rq_Id := aRequest;
    OwnerID := aOwnerID;
    OwnerIsCustomer := aOwnerIsCustomer;

    ShowModal;
  end;
end;

function TReqSingleMatGiveForm.CheckAndSave: Boolean;
var
  HasErors: Boolean;
begin
  HasErors := False;

  CnErrors.Dispose(lcbEquipment);
  if VarIsNull(lcbEquipment.KeyValue) then
  begin
    HasErors := True;
    CnErrors.SetError(lcbEquipment, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end;

  CnErrors.Dispose(lcbWH);
  if VarIsNull(lcbWH.KeyValue) then
  begin
    HasErors := True;
    CnErrors.SetError(lcbWH, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end;

  CnErrors.Dispose(ednQ);
  if ednQ.Text.IsEmpty then
  begin
    HasErors := True;
    CnErrors.SetError(ednQ, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
  begin
    if (not VarIsNull(lcbEquipment.KeyValue)) and dsMaterial.Locate('ID', lcbEquipment.KeyValue, []) then
    begin
      if dsMaterial['QUANT'] < ednQ.Value then
      begin
        HasErors := True;
        CnErrors.SetError(ednQ, Format(rsMatQuantMoreThan, [dsMaterial.FieldByName('QUANT').AsString]), iaMiddleLeft,
          bsNeverBlink);
      end
    end
  end;

  if not HasErors then
    HasErors := not SaveInDB;

  Result := not HasErors;
end;

procedure TReqSingleMatGiveForm.dsWHBeforeOpen(DataSet: TDataSet);
begin
  if dsWH.RecordCount = 1 then
    lcbWH.KeyValue := dsWH['O_ID'];
end;

procedure TReqSingleMatGiveForm.btnOkClick(Sender: TObject);
begin
  if CheckAndSave then
    modalResult := mrOk
  else
    modalResult := mrNone;
end;

procedure TReqSingleMatGiveForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsWH.Close;
  dsMaterial.Close;
end;

procedure TReqSingleMatGiveForm.FormShow(Sender: TObject);
begin
  dsMaterial.ParamByName('Rq_Id').AsInteger := FRq_Id;
  dsMaterial.ParamByName('OWNER_ID').AsInteger := FOwnerID;
  if FOwnerIsCustomer then
    dsMaterial.ParamByName('OWNER_TYPE').AsInteger := 1
  else
    dsMaterial.ParamByName('OWNER_TYPE').AsInteger := 2;

  dsMaterial.Open;
  dsWH.Open;
end;

procedure TReqSingleMatGiveForm.lcbEquipmentChange(Sender: TObject);
begin
  btnOk.Visible := not(VarIsNull(lcbEquipment.KeyValue) or VarIsNull(lcbWH.KeyValue));
  lblDim.Caption := '';
  if dsMaterial.Active then begin
    if (not VarIsNull(lcbEquipment.KeyValue)) and dsMaterial.Locate('ID', lcbEquipment.KeyValue, []) then begin
      if not dsMaterial.FieldByName('DIMENSION').IsNull then
        lblDim.Caption := dsMaterial['DIMENSION'];

      if not dsMaterial.FieldByName('COST').IsNull then
        ednCost.Value := dsMaterial['COST'];
    end;
  end;
end;

function TReqSingleMatGiveForm.SaveInDB: Boolean;
begin
  Result := False;
  if dsMaterial.Locate('ID', lcbEquipment.KeyValue, []) then
  begin
    with TpFIBQuery.Create(Self) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.Text :=
          'execute procedure REQUEST_MATERIALS_RETURN_IUD(null, :RQ_ID, :M_ID, :QUANT, :WH_ID, :NOTICE, 0, :SERIAL, :COST, :PROP)';
        ParamByName('RQ_ID').Value := FRq_Id;
        if not dsMaterial.FieldByName('M_ID').IsNull then
          ParamByName('M_ID').Value := dsMaterial.FieldByName('M_ID').Value;
        if not dsMaterial.FieldByName('SERIAL').IsNull then
          ParamByName('SERIAL').Value := dsMaterial.FieldByName('SERIAL').Value;
        if not dsMaterial.FieldByName('COST').IsNull then
          ParamByName('COST').Value := dsMaterial.FieldByName('COST').Value;

        // 4 Возврат бесплатно,  5 Возврат за деньги (Выкуп)
        ParamByName('PROP').Value := 5;
        ParamByName('QUANT').Value := ednQ.Value;
        ParamByName('WH_ID').Value := lcbWH.KeyValue;
        ParamByName('NOTICE').Value := mmoN.Lines.Text;

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
        Result := True;
      finally
        free;
      end;
    end;
  end;
end;

end.
