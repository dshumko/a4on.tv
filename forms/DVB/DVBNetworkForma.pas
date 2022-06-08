unit DVBNetworkForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtDlgs,
  FIBDataSet, pFIBDataSet, OkCancel_frame, FIBDatabase, pFIBDatabase, DBCtrlsEh, uDBImages;

type

  TDVBNetworkForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    dsNetwork: TpFIBDataSet;
    srcNetwork: TDataSource;
    trWrite: TpFIBTransaction;
    edtNAME: TDBEditEh;
    edtTIMEOFFSET: TDBNumberEditEh;
    edtNID: TDBNumberEditEh;
    GroupBoxPID: TGroupBox;
    chkNIT: TDBCheckBoxEh;
    chkSDT: TDBCheckBoxEh;
    chkTDT: TDBCheckBoxEh;
    GroupBoxEIT: TGroupBox;
    chkDescParental: TDBCheckBoxEh;
    chkDescContent: TDBCheckBoxEh;
    chkDescExtended: TDBCheckBoxEh;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBMemo1: TDBMemoEh;
    Label5: TLabel;
    lbl1: TLabel;
    cbLang: TDBComboBoxEh;
    lbl2: TLabel;
    cbCOUNTRY: TDBComboBoxEh;
    edtONID: TDBNumberEditEh;
    lbl3: TLabel;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEditEh2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function DescriptorsToStr: String;
    function PIDsToStr: String;
    procedure SetPID(const pid: string);
    procedure StrToDescriptors;
    procedure StrToPIDs;
  public
    { Public declarations }
  end;

function EditDVBNetwork(const aDVBN_ID: Int64; const Mode: integer = 1): Int64;

implementation

uses
  DM;

{$R *.dfm}

function EditDVBNetwork(const aDVBN_ID: Int64; const Mode: integer = 1): Int64;
var
  DVBNetworkForm: TDVBNetworkForm;
begin
  result := -1;

  DVBNetworkForm := TDVBNetworkForm.Create(Application);
  with DVBNetworkForm do
    try
      dsNetwork.ParamByName('DVBN_ID').AsInt64 := aDVBN_ID;
      dsNetwork.Open;
      StrToDescriptors;
      StrToPIDs;
      if Mode <> 0 then
      begin
        if aDVBN_ID > 0 then
          dsNetwork.Edit
        else
        begin
          dsNetwork.Insert;
        end;
      end;

      if ShowModal = mrOk then
      begin
        if aDVBN_ID = -1 then
          dsNetwork['DVBN_ID'] := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
        dsNetwork['DESCRIPTORS'] := DescriptorsToStr;
        dsNetwork['PIDS'] := PIDsToStr;
        dsNetwork.Post;
        result := dsNetwork['DVBN_ID'];
      end
      else
      begin
        if dsNetwork.State in [dsEdit, dsInsert] then
          dsNetwork.Cancel;
      end;
    finally
      free
    end;
end;

procedure TDVBNetworkForm.DBEditEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((UpCase(Key) < 'A') or (UpCase(Key) > 'Z')) then
    Key := #0;
end;

procedure TDVBNetworkForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TDVBNetworkForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
end;

function TDVBNetworkForm.DescriptorsToStr: String;
begin
  //
  // ExtendedEventDescriptor - расширеное описание
  // ParentalRatingDescriptor - возрастной контроль
  // ContentDescriptor - жанр
  result := '';
  if chkDescExtended.Checked then
    result := result + 'ExtendedEventDescriptor, ';
  if chkDescParental.Checked then
    result := result + 'ParentalRatingDescriptor, ';
  if chkDescContent.Checked then
    result := result + 'ContentDescriptor, ';
  if result <> '' then
    result := Copy(result, 1, Length(result) - 2);
end;

function TDVBNetworkForm.PIDsToStr: String;
var
  PIDs: TStringList;
begin
  {
    BAT - Bouquet Association Table
    CAT - Conditional Access Table
    CIT - Content Identifier Table
    DIT - Discontinuity Information Table
    EIT - Event Information Table
    NIT - Network Information Table
    PAT - Program Association Table
    RNT - RAR Notification Table
    RST - Running Status Table
    SDT - Service Description Table
    SIT - Selection Information Table
    ST  - Stuffing Table
    TDT - Time and Date Table
    TOT - Time Offset Table
    TSDT- Transport Stream Description Table
  }
  result := '';
  PIDs := TStringList.Create;
  try
    PIDs.Delimiter := ',';
    if chkNIT.Checked then
      PIDs.Add('NIT');
    if chkTDT.Checked then
    begin
      PIDs.Add('TDT');
      PIDs.Add('TOT');
    end;
    if chkSDT.Checked then
      PIDs.Add('SDT');
    result := PIDs.DelimitedText;
  finally
    PIDs.free
  end;
end;

procedure TDVBNetworkForm.StrToDescriptors;
var
  s: string;

begin
  if dsNetwork.FieldByName('DESCRIPTORS').IsNull then
    Exit;
  s := AnsiUpperCase(dsNetwork['DESCRIPTORS']);

  chkDescExtended.Checked := (Pos('EXTENDEDEVENTDESCRIPTOR', s) > 0);
  chkDescParental.Checked := (Pos('PARENTALRATINGDESCRIPTOR', s) > 0);
  chkDescContent.Checked := (Pos('CONTENTDESCRIPTOR', s) > 0);
end;

procedure TDVBNetworkForm.SetPID(const pid: string);
begin
  if pid = 'SDT' then
    chkSDT.Checked := True
  else if pid = 'NIT' then
    chkNIT.Checked := True
  else if pid = 'TDT' then
    chkTDT.Checked := True
  else if pid = 'TOT' then
    chkTDT.Checked := True;
end;

procedure TDVBNetworkForm.StrToPIDs;
var
  s: string;
  i: integer;
  PIDs: TStringList;
begin
  if dsNetwork.FieldByName('PIDS').IsNull then
    Exit;
  s := AnsiUpperCase(dsNetwork['PIDS']);

  {
    BAT - Bouquet Association Table
    CAT - Conditional Access Table
    CIT - Content Identifier Table
    DIT - Discontinuity Information Table
    EIT - Event Information Table
    NIT - Network Information Table
    PAT - Program Association Table
    RNT - RAR Notification Table
    RST - Running Status Table
    SDT - Service Description Table
    SIT - Selection Information Table
    ST  - Stuffing Table
    TDT - Time and Date Table
    TOT - Time Offset Table
    TSDT- Transport Stream Description Table
  }
  PIDs := TStringList.Create;
  try
    PIDs.Delimiter := ',';
    PIDs.DelimitedText := s;
    for i := 0 to PIDs.Count - 1 do
    begin
      s := Trim(PIDs[i]);
      SetPID(s);
    end;
  finally
    PIDs.free
  end;
end;

end.
