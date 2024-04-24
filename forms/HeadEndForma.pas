unit HeadEndForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls,
  FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, FIBDatabase, pFIBDatabase, DBCtrlsEh, DBLookupEh, OkCancel_frame, pFIBQuery,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, CnErrorProvider, amSplitter;

type
  THeadEndForm = class(TForm)
    pnlHead: TPanel;
    dsHC: TpFIBDataSet;
    srcHC: TDataSource;
    dsC: TpFIBDataSet;
    srcC: TDataSource;
    dsHE: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcHE: TDataSource;
    Label2: TLabel;
    edtHE_NAME: TDBEditEh;
    Label4: TLabel;
    DBEdit4: TDBEditEh;
    Label7: TLabel;
    DBEdit7: TDBEditEh;
    lbl3: TLabel;
    cbbLupStreets: TDBLookupComboboxEh;
    lbl4: TLabel;
    cbbLupHOUSE: TDBLookupComboboxEh;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    dbmmoNotice: TDBMemoEh;
    lbl5: TLabel;
    OkCancelFrame1: TOkCancelFrame;
    cbbType: TDBLookupComboboxEh;
    lblAttribute: TLabel;
    dsType: TpFIBDataSet;
    srcType: TDataSource;
    pgcInfo: TPageControl;
    tsChanals: TTabSheet;
    tsHouses: TTabSheet;
    pnlChannels: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    lbl1: TLabel;
    dbgrdGridSC: TDBGridEh;
    pnlProgrBtn: TPanel;
    btnChanAdd: TSpeedButton;
    btnChanRemove: TSpeedButton;
    pnl3: TPanel;
    lbl2: TLabel;
    dbgrdGridC: TDBGridEh;
    dsHouses: TpFIBDataSet;
    srcHouses: TDataSource;
    dbgrdHouses: TDBGridEh;
    lbl6: TLabel;
    luParent: TDBLookupComboboxEh;
    dsParent: TpFIBDataSet;
    srcParent: TDataSource;
    cnErrors: TCnErrorProvider;
    procedure btnChanAddClick(Sender: TObject);
    procedure btnChanRemoveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdGridSCDblClick(Sender: TObject);
    procedure dbgrdGridCDblClick(Sender: TObject);
    procedure pgcInfoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function HeadEndModify(const aHE_ID: Integer): Integer;

implementation

uses
  DM, PrjConst;

{$R *.dfm}

function HeadEndModify(const aHE_ID: Integer): Integer;
begin
  result := aHE_ID;
  with THeadEndForm.Create(Application) do
    try
      pnlChannels.Enabled := aHE_ID > 0;
      dsParent.ParamByName('HE_ID').AsInteger := aHE_ID;
      dsParent.Open;
      dsHE.ParamByName('HE_ID').AsInteger := aHE_ID;
      dsHE.Open;
      if aHE_ID = -1
      then begin
        dsHE.Insert;
        result := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
        dsHE.ParamByName('HE_ID').AsInteger := result;
      end;
      if ShowModal = mrOk
      then begin
        if dsHE.State in [dsEdit, dsInsert]
        then dsHE.Post;
      end
      else begin
        if dsHE.State in [dsEdit, dsInsert]
        then dsHE.Cancel;
        result := -1;
      end;
      dsHE.Close;
    finally free
    end;
end;

procedure THeadEndForm.btnChanAddClick(Sender: TObject);
begin
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text :=
        'insert into HEADEND_CHANNELS (CH_ID, HE_ID, CH_FREQ, CH_NUMBER) select CH_ID, :HE_ID, CH_FREQ, CH_NUMBER from CHANNELS where CH_ID = :CH_ID';
      ParamByName('HE_ID').Value := dsHE['HE_ID'];
      ParamByName('Ch_Id').Value := dsC['Ch_Id'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsHC.CloseOpen(true);
      dsC.CloseOpen(true);
    finally free;
    end;
end;

procedure THeadEndForm.btnChanRemoveClick(Sender: TObject);
begin
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'delete from HEADEND_CHANNELS where (CH_ID = :CH_ID) and (HE_ID = :HE_ID);';
      ParamByName('HE_ID').Value := dsHE['HE_ID'];
      ParamByName('Ch_Id').Value := dsHC['Ch_Id'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsHC.CloseOpen(true);
      dsC.CloseOpen(true);
    finally free;
    end;
end;

procedure THeadEndForm.dbgrdGridCDblClick(Sender: TObject);
begin
  btnChanAddClick(Sender);
end;

procedure THeadEndForm.dbgrdGridSCDblClick(Sender: TObject);
begin
  btnChanRemoveClick(Sender);
end;

procedure THeadEndForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsHomes.Close;
  dsStreets.Close;
  dsType.Close;
  dsParent.Close;
end;

procedure THeadEndForm.FormCreate(Sender: TObject);
begin
  dsStreets.Open;
  dsHomes.Open;
  dsType.Open;
end;

procedure THeadEndForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then bbOkClick(Sender);
end;

procedure THeadEndForm.bbOkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  if (edtHE_NAME.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtHE_NAME, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else CnErrors.Dispose(edtHE_NAME);

  if (cbbLupStreets.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(cbbLupStreets, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else CnErrors.Dispose(cbbLupStreets);

  if (cbbLupHOUSE.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(cbbLupHOUSE, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else CnErrors.Dispose(cbbLupHOUSE);

  if (not errors)
  then ModalResult := mrOk;
end;

procedure THeadEndForm.pgcInfoChange(Sender: TObject);
begin
  dsHouses.Active := pgcInfo.ActivePage = tsHouses;
end;

end.
