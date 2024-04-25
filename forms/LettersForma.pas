unit LettersForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  GridForma, FIBDataSet, pFIBDataSet, DBGridEh, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBCtrlsEh,
  CnErrorProvider, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh,
  PrnDbgeh;

type
  TLettersForm = class(TGridForm)
    dsLetters: TpFIBDataSet;
    DBCheckBoxEh1: TDBCheckBoxEh;
    deName: TDBEditEh;
    cbFOR_FORM: TDBComboBoxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    cbReport: TDBComboBoxEh;
    dsReports: TpFIBDataSet;
    chkSaveAsPDF: TDBCheckBoxEh;
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsLettersNewRecord(DataSet: TDataSet);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure dbFileNameEnter(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateComboReport;
  public
    { Public declarations }
  end;

var
  LettersForm: TLettersForm;

implementation

uses
  DM, MAIN;

{$R *.dfm}

procedure TLettersForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Reports)))
  then
    srcDataSource.DataSet.Post
  else
    srcDataSource.DataSet.Cancel;

end;

procedure TLettersForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TLettersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsLetters.Close;
  LettersForm := nil;
end;

procedure TLettersForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;

end;

procedure TLettersForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  tbOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  actNew.Enabled := not tbOk.Enabled;
  actDelete.Enabled := actNew.Enabled;
  actEdit.Enabled := actNew.Enabled;

end;

procedure TLettersForm.FormShow(Sender: TObject);
begin
  inherited;
  fCanEdit := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Reports));
  fCanCreate := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Reports));

  UpdateComboReport;

  dsLetters.Open;
  // права пользователей
  actNew.Visible := ((fCanEdit or fCanCreate));
  actDelete.Visible := actNew.Visible;
  actEdit.Visible := actNew.Visible;
  tbOk.Visible := actNew.Visible;
  tbCancel.Visible := actNew.Visible;
end;

procedure TLettersForm.dbFileNameEnter(Sender: TObject);
begin
  inherited;
  CnErrors.Dispose(Sender as TControl);
end;

procedure TLettersForm.dsLettersNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsLetters['RECORDINDB'] := 0;
end;

procedure TLettersForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not(fCanEdit or fCanCreate))
  then
    exit;
  if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['lettertypedescr']]), mtConfirmation, [mbYes, mbNo],
    0) = mrYes)
  then
    srcDataSource.DataSet.Delete;
end;

procedure TLettersForm.actEditExecute(Sender: TObject);
begin
  inherited;
 if (not(fCanEdit or fCanCreate))
  then
    exit;
  StartEdit();
end;

procedure TLettersForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not(fCanEdit or fCanCreate))
  then
    exit;
  StartEdit(True);
end;

procedure TLettersForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;
  if (cbFOR_FORM.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(cbFOR_FORM, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbFOR_FORM);
  if (deName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(deName, rsSelectName, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(deName);

  if (cbReport.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(cbReport, rsSelectFile, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbReport);

  if not errors
  then
    inherited;

end;

procedure TLettersForm.UpdateComboReport;
var
  s : string;
begin
  dsReports.Open;
  while not dsReports.Eof do begin
    s := dsReports['report_name'];
    if (dsReports['FULL_NAME']<>'') then
      s := dsReports['FULL_NAME'] + '/'+s;

    cbReport.Items.Add(s);
    dsReports.Next;
  end;
  dsReports.Close;
end;

end.
