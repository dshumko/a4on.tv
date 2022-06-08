unit ScanImageForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.ExtDlgs,
  DelphiTwain, DelphiTwain_Vcl, DBCtrlsEh, PropFilerEh, PropStorageEh;

type
  TScanImageForm = class(TForm)
    PnlTop: TPanel;
    ImgHolder: TImage;
    BtnScanWithDialog: TButton;
    BtnScanWithoutDialog: TButton;
    btnSave: TButton;
    cbbDevice: TDBComboBoxEh;
    lbl1: TLabel;
    btnCancel: TButton;
    dlgOpenPic: TOpenPictureDialog;
    edtFile: TDBEditEh;
    lbl2: TLabel;
    chkSave: TDBCheckBoxEh;
    PropStorageEh: TPropStorageEh;
    procedure BtnScanWithDialogClick(Sender: TObject);
    procedure BtnScanWithoutDialogClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cbbDeviceEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure cbbDeviceChange(Sender: TObject);
    procedure edtFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
  private
    Twain: TDelphiTwain;
    FTempFile: String;
    FFileLoaded: Boolean;
    procedure ReloadSources;
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer; Image: TBitmap; var Cancel: Boolean);
  protected
    procedure DoCreate; override;
    procedure DoDestroy; override;
  public
    property TempFile: String Read FTempFile;
  end;

function ScanDocument(const itsPassport : Boolean; var SaveFile : Boolean): String;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg,
  PrjConst;

{ TScanImageForm }

function ScanDocument(const itsPassport : Boolean; var SaveFile : Boolean): String;
begin
  with TScanImageForm.Create(application) do
    try
      chkSave.Visible := itsPassport;
      if itsPassport then begin
        btnSave.Caption := rsRecognize;
      end
      else btnSave.Caption := rsSave;
      if showmodal = mrOk then begin
        Result := TempFile;
        SaveFile := chkSave.Checked and ItsPassport;
      end;
    finally
      Free;
    end;
end;

procedure TScanImageForm.btnSaveClick(Sender: TObject);
var
  jpg_img: TJPEGImage;
  TempPath, TmpFile, Prefix: string;
  R: Cardinal;
begin
  if FFileLoaded then begin
    FTempFile := edtFile.Text;
  end
  else begin
    Prefix := 'Scan_';
    R := GetTempPath(0, nil);
    SetLength(TempPath, R);
    R := GetTempPath(R, PChar(TempPath));
    if R <> 0 then begin
      SetLength(TempPath, StrLen(PChar(TempPath)));
      SetLength(TmpFile, MAX_PATH);
      R := GetTempFileName(PChar(TempPath), PChar(Prefix), 0, PChar(TmpFile));
      if R <> 0 then begin
        SetLength(TmpFile, StrLen(PChar(TmpFile)));
        // TmpFile := ChangeFileExt(TmpFile, '.jpg');
      end;
    end;

    if TmpFile.IsEmpty then
      TmpFile := ExtractFilePath(application.ExeName) + Prefix + '.jpg';

    FTempFile := TmpFile;
    jpg_img := TJPEGImage.Create;
    try
      jpg_img.Assign(ImgHolder.Picture.Bitmap);
      jpg_img.DIBNeeded;
      jpg_img.CompressionQuality := 75; // от 0 до 100, где 100 -самое лучшее качество
      jpg_img.Compress;
      jpg_img.SaveToFile(FTempFile);
    finally
      jpg_img.Free;
    end;
  end;
end;

procedure TScanImageForm.BtnScanWithDialogClick(Sender: TObject);
begin
  Twain.SelectedSourceIndex := cbbDevice.ItemIndex;

  if Assigned(Twain.SelectedSource) then begin
    // Load source, select transference method and enable (display interface)}
    Twain.SelectedSource.Loaded := True;
    Twain.SelectedSource.ShowUI := True; // display interface
    Twain.SelectedSource.Enabled := True;
  end;
end;

procedure TScanImageForm.BtnScanWithoutDialogClick(Sender: TObject);
begin
  Twain.SelectedSourceIndex := cbbDevice.ItemIndex;

  if Assigned(Twain.SelectedSource) then begin
    // Load source, select transference method and enable (display interface)}
    Twain.SelectedSource.Loaded := True;
    Twain.SelectedSource.ShowUI := False;
    Twain.SelectedSource.Enabled := True;
  end;
end;

procedure TScanImageForm.cbbDeviceChange(Sender: TObject);
begin
  BtnScanWithDialog.Enabled := not cbbDevice.Text.IsEmpty;
  BtnScanWithoutDialog.Enabled := not cbbDevice.Text.IsEmpty;

end;

procedure TScanImageForm.cbbDeviceEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if Twain.SourceManagerLoaded then
    ReloadSources;
  Handled := True;
end;

procedure TScanImageForm.DoCreate;
begin
  inherited;

  Twain := TDelphiTwain.Create;
  Twain.OnTwainAcquire := TwainTwainAcquire;

  if Twain.LoadLibrary then begin
    // Load source manager
    Twain.SourceManagerLoaded := True;

    ReloadSources;
  end
  else begin
    ShowMessage('Twain is not installed.');
  end;
end;

procedure TScanImageForm.DoDestroy;
begin
  Twain.Free; // Don't forget to free Twain!

  inherited;
end;

procedure TScanImageForm.edtFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if dlgOpenPic.Execute then begin
    edtFile.Text := dlgOpenPic.FileName;
    ImgHolder.Picture.LoadFromFile(dlgOpenPic.FileName);
    FFileLoaded := True;
    btnSave.Enabled := True;
  end
end;

procedure TScanImageForm.ReloadSources;
var
  I: Integer;
begin
  cbbDevice.Items.Clear;
  cbbDevice.KeyItems.Clear;
  for I := 0 to Twain.SourceCount - 1 do begin
    cbbDevice.Items.Add(Twain.Source[I].ProductName);
    cbbDevice.KeyItems.Add(I.ToString);
  end;

  if cbbDevice.Items.Count > 0 then
    cbbDevice.ItemIndex := 0;
end;

procedure TScanImageForm.TwainTwainAcquire(Sender: TObject; const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
  ImgHolder.Picture.Assign(Image);
  Cancel := True; // Only want one image
  FFileLoaded := False;
  edtFile.Text := '';
  btnSave.Enabled := True;
end;

end.
