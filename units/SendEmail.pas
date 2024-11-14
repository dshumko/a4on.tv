unit SendEmail;

interface

uses
  System.SysUtils, System.Classes,
  OverbyteIcsWSocket, OverbyteIcsSmtpProt, OverbyteIcsSslBase, OverbyteIcsTypes;

type
  TEmailClient = class(TComponent)
    procedure SmtpClientHeaderLine(Sender: TObject; Msg: Pointer; Size: Integer);
  private
    fSslContext: TSslContext;
    fSslSmtpClient: TSslSmtpCli;
    FAllInOneFlag: Boolean;
    FEhloCount: Integer;
    FAnswer: String;
    FSmtpHost: string;
    FSmtpPort: String;
    FSmtpLogin: string;
    FSmtpPassword: string;
    FFromEmail: string;
    FToEmail: string;
    FCcEmail: string;
    FSubject: string;
    FBody: string;
    FAttachments: TStrings;
    FConfirm: Boolean;
    FSmtpAuthType: TSmtpAuthType;
    FSslType: TSmtpSslType;
    FFinish: Boolean;
    procedure SslSmtpClientBeforeFileOpen(Sender: TObject; Idx: Integer; FileName: String;
      var Action: TSmtpBeforeOpenFileAction);
    procedure SslSmtpClientRequestDone(Sender: TObject; RqType: TSmtpRequest; Error: Word);
    procedure SetAnswer(const text: string);
    procedure SetAuthType(const Value: string);
    procedure SetSslType(const Value: string);
  public
    property SmtpHost: string read FSmtpHost write FSmtpHost;
    property SmtpPort: String read FSmtpPort write FSmtpPort;
    property SmtpLogin: string read FSmtpLogin write FSmtpLogin;
    property SmtpPassword: string read FSmtpPassword write FSmtpPassword;
    property FromEmail: string read FFromEmail write FFromEmail;
    property CcEmail: string read FCcEmail write FCcEmail;
    property ToEmail: string read FToEmail write FToEmail;
    property Confirm: Boolean read FConfirm write FConfirm;
    property AuthType: string write SetAuthType;
    property SslType: string write SetSslType;
    property Subject: string read FSubject write FSubject;
    property Body: string read FBody write FBody;
    procedure AddAttachment(const FileName: String);
    function SendEmail: String;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
  System.AnsiStrings;

constructor TEmailClient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fSslContext := TSslContext.Create(self);
  fSslSmtpClient := TSslSmtpCli.Create(self);
  FAttachments := TStringList.Create;

  with fSslContext do
  begin
    Name := 'SslContext';
    SslVerifyPeer := False;
    SslVerifyDepth := 9;
    SslVerifyFlags := [];
    SslOptions := [sslOpt_NO_SSLv2];
    SslVerifyPeerModes := [SslVerifyMode_PEER];
    SslSessionCacheModes := [sslSESS_CACHE_CLIENT];
    SslCipherList := 'ALL:!ADH:RC4+RSA:+SSLv2:@STRENGTH';
    SslVersionMethod := sslV23_CLIENT;
    SslECDHMethod := sslECDHNone;
    SslSessionTimeout := 300000;
    SslSessionCacheSize := 20480;
  end;

  with fSslSmtpClient do
  begin
    Name := 'SslSmtpClient';
    XMailer := 'A4ON.TV SMTP Client';
    AuthType := smtpAuthPlain;
    CharSet := 'utf-8';
    DefaultEncoding := smtpEnc8bit;
    Allow8bitChars := False;
    ContentType := smtpPlainText;
    OnRequestDone := SslSmtpClientRequestDone;
    OnBeforeFileOpen := SslSmtpClientBeforeFileOpen;
    SslContext := fSslContext;
    OnHeaderLine := SmtpClientHeaderLine;
  end;

  FAllInOneFlag := True;
  FConfirm := False;
  FCcEmail := '';
  FSmtpAuthType := smtpAuthPlain;
  FSslType := smtpTlsImplicit;
end;

destructor TEmailClient.Destroy;
begin
  FreeAndNil(fSslContext);
  FreeAndNil(fSslSmtpClient);
  FreeAndNil(FAttachments);
  inherited;
end;

procedure TEmailClient.SmtpClientHeaderLine(Sender: TObject; Msg: Pointer; Size: Integer);
begin
  if (System.AnsiStrings.StrLen(PAnsiChar(Msg)) > 0) and
    (System.AnsiStrings.StrLIComp(PAnsiChar(Msg), PAnsiChar('X-Mailer:'), 9) = 0) then
    System.AnsiStrings.StrCat(PAnsiChar(Msg), PAnsiChar(#13#10'X-Postmaster-Msgtype: A4onTV'));
end;

procedure TEmailClient.SslSmtpClientBeforeFileOpen(Sender: TObject; Idx: Integer; FileName: String;
  var Action: TSmtpBeforeOpenFileAction);
begin
  Action := smtpBeforeOpenFileNone;
end;

procedure TEmailClient.SetAuthType(const Value: string);
begin
  if Value = 'Plain' then
    FSmtpAuthType := smtpAuthPlain
  else if Value = 'Login' then
    FSmtpAuthType := smtpAuthLogin
  else if Value = 'CramMD5' then
    FSmtpAuthType := smtpAuthCramMD5
  else if Value = 'CramSHA1' then
    FSmtpAuthType := smtpAuthCramSha1
  else if Value = 'NTLM' then
    FSmtpAuthType := smtpAuthNtlm
  else if Value = 'AutoSelect' then
    FSmtpAuthType := smtpAuthAutoSelect
  else
    FSmtpAuthType := smtpAuthNone;
end;

procedure TEmailClient.SetSslType(const Value: string);
begin
  if Value = 'TLS' then
    FSslType := smtpTlsImplicit
  else if Value = 'STARTTLS' then
    FSslType := smtpTlsExplicit
  else
    FSslType := smtpTlsNone;
end;

procedure TEmailClient.SslSmtpClientRequestDone(Sender: TObject; RqType: TSmtpRequest; Error: Word);
begin
  { For every operation, we display the status }
  if (Error > 0) and (Error < 10000) then
    SetAnswer('RequestDone Rq=' + IntToStr(Ord(RqType)) + ' Error=' + fSslSmtpClient.ErrorMessage);

  { Check if the user has asked for "All-In-One" demo }
  if not FAllInOneFlag then
  begin
    fSslSmtpClient.PostQuitMessage;
    Exit;
  end;

  if Error <> 0 then
  begin
    FAllInOneFlag := False; { Terminate All-In-One demo }
    FFinish := True;
    fSslSmtpClient.PostQuitMessage;
    Exit;
  end;

  case RqType of
    smtpConnect:
      begin
        if fSslSmtpClient.AuthType = smtpAuthNone then
          fSslSmtpClient.Helo
        else
          fSslSmtpClient.Ehlo;
      end;
    smtpHelo:
      fSslSmtpClient.MailFrom;
    smtpEhlo:
      if fSslSmtpClient.SslType = smtpTlsExplicit then
      begin
        Inc(FEhloCount);
        if FEhloCount = 1 then
          fSslSmtpClient.StartTls
        else if FEhloCount > 1 then
          fSslSmtpClient.Auth;
      end
      else
        fSslSmtpClient.Auth;
    smtpStartTls:
      fSslSmtpClient.Ehlo; // We need to re-issue the Ehlo command
    smtpAuth:
      fSslSmtpClient.MailFrom;
    smtpMailFrom:
      fSslSmtpClient.RcptTo;
    smtpRcptTo:
      fSslSmtpClient.Data;
    smtpData:
      fSslSmtpClient.Quit;
    smtpQuit:
      begin
        FFinish := True;
        SetAnswer('OK');
      end;
  end;

  if FFinish then
    fSslSmtpClient.PostQuitMessage;

end;

procedure TEmailClient.SetAnswer(const text: string);
begin
  FAnswer := text;
end;

procedure TEmailClient.AddAttachment(const FileName: String);
begin
  if FileName <> '' then
    FAttachments.Add(FileName);
end;

function TEmailClient.SendEmail: String;
begin
  if fSslSmtpClient.Connected then
  begin
    Result := 'Connected';
    Exit;
  end;
  FAnswer := '';
  FAllInOneFlag := True;
  FFinish := False;
  FEhloCount := 0;
  { Initialize all SMTP component properties from our GUI }
  fSslSmtpClient.Host := FSmtpHost;
  fSslSmtpClient.Port := FSmtpPort;
  fSslSmtpClient.FromName := FFromEmail;

  fSslSmtpClient.HdrFrom := FFromEmail;
  // fSslSmtpClient.HdrTo := ToEmail;
  if FCcEmail <> '' then
    fSslSmtpClient.HdrCc := FCcEmail;

  fSslSmtpClient.HdrSubject := FSubject;
  fSslSmtpClient.EmailFiles := FAttachments;
  fSslSmtpClient.ConfirmReceipt := FConfirm;
  fSslSmtpClient.AuthType := FSmtpAuthType;

  fSslSmtpClient.ContentType := smtpPlainText;
  fSslSmtpClient.MailMessage.Clear;
  fSslSmtpClient.MailMessage.Add(FBody);

  fSslSmtpClient.SslType := FSslType;
  if fSslSmtpClient.SslType <> smtpTlsNone then
  begin
    fSslContext.SslVerifyPeer := False;
    fSslSmtpClient.OnSslVerifyPeer := nil;
    fSslSmtpClient.OnSslHandshakeDone := nil;
  end;

  fSslSmtpClient.Username := FSmtpLogin;
  fSslSmtpClient.Password := FSmtpPassword;
  fSslSmtpClient.HdrPriority := TSmtpPriority(0);
  { Recipient list is computed from To, Cc and Bcc fields }
  fSslSmtpClient.RcptName.Clear;
  fSslSmtpClient.RcptName.Delimiter := ',';
  if FCcEmail <> '' then
    fSslSmtpClient.RcptName.CommaText := FCcEmail + ',' + ToEmail.Trim
  else
    fSslSmtpClient.RcptName.CommaText := ToEmail.Trim;
  fSslSmtpClient.HdrTo := ToEmail.Trim;

  fSslSmtpClient.Connect;
  fSslSmtpClient.MessageLoop;
  FAttachments.Clear;
  Result := FAnswer;
end;

end.
