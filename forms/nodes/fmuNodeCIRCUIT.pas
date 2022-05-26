unit fmuNodeCIRCUIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, ComCtrls, ToolWin,
  GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet, ActnList,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, Vcl.Menus, DBCtrlsEh;

type
  TapgNodeCIRCUIT = class(TA4onPage)
    dsCircuit: TpFIBDataSet;
    srcCircuit: TDataSource;
    tbAttributes: TToolBar;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    btnView: TToolButton;
    btn1: TToolButton;
    actView: TAction;
    imgPNG: TDBImageEh;
    pmCircuit: TPopupMenu;
    mniCircuitView: TMenuItem;
    mniN2: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    miN1: TMenuItem;
    miLoadPNG: TMenuItem;
    dlgOpen: TOpenDialog;
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure imgPNGDblClick(Sender: TObject);
    procedure miLoadPNGClick(Sender: TObject);
  private
    procedure EnableControls;
    procedure actViewFile;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses ShellApi, MAIN, AtrCommon, DM, CircuitMain;

class function TapgNodeCIRCUIT.GetPageName: string;
begin
  Result := rsClmnCircuit;
end;

procedure TapgNodeCIRCUIT.imgPNGDblClick(Sender: TObject);
begin
  actViewExecute(Sender);
end;

procedure TapgNodeCIRCUIT.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Dictionary_Nodes)) or (dmMain.AllowedAction(rght_Dictionary_Nodes));

  tbAttributes.Visible := FullAccess;
  // actAdd.Visible := tbAttributes.Visible;
  actDel.Visible := tbAttributes.Visible;
  actEdit.Visible := tbAttributes.Visible;

  dsCircuit.DataSource := FDataSource;
end;

procedure TapgNodeCIRCUIT.miLoadPNGClick(Sender: TObject);
var
  e, f: string;
  aPicStream: TMemoryStream;
begin
  if FDataSource.DataSet.RecordCount = 0 then
    Exit;

  if (not dmMain.AllowedAction(rght_Dictionary_Nodes)) then
    Exit;

  dlgOpen.Filter := 'Изображения|*.png; *.jpg; *.jpeg|jpg|*.jpg; *.jpeg|png|*.png';
  if dlgOpen.Execute then
  begin
    if not dsCircuit.Active then
      dsCircuit.Open;

    if dsCircuit.RecordCount > 0 then
      dsCircuit.Edit
    else
    begin
      dsCircuit.Insert;
      dsCircuit['NOTICE'] := '';
      dsCircuit['HOUSE_ID'] := FDataSource.DataSet['NODE_ID'];
    end;

    f := ExtractFileName(dlgOpen.FileName);
    e := UpperCase(ExtractFileExt(f));
    dsCircuit.FieldByName('CIRCUIT').Clear;
    if e = '.PNG' then
    begin
      TBlobField(dsCircuit.FieldByName('PNG')).LoadFromFile(dlgOpen.FileName);
    end
    else
    begin
      aPicStream := TMemoryStream.Create;
      try
        aPicStream.LoadFromFile(dlgOpen.FileName);
        Jpeg2Png(aPicStream);
        TBlobField(dsCircuit.FieldByName('PNG')).LoadFromStream(aPicStream);
      finally
        aPicStream.Free;
      end;
      f := ChangeFileExt(f, '.PNG');
    end;
    dsCircuit['NAME'] := f;
    dsCircuit.Post;
  end;
end;

procedure TapgNodeCIRCUIT.EnableControls;
begin
  // actEdit.Enabled := dsCircuit.RecordCount > 0;
  actDel.Enabled := dsCircuit.RecordCount > 0;
end;

procedure TapgNodeCIRCUIT.OpenData;
begin
  dsCircuit.Open;
  EnableControls;
end;

procedure TapgNodeCIRCUIT.actDelExecute(Sender: TObject);
begin
  if dsCircuit.RecordCount = 0 then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_Nodes))) then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsCircuit['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsCircuit.Delete;
end;

procedure TapgNodeCIRCUIT.actEditExecute(Sender: TObject);
var
  CircuitData: TMemoryStream;
  PngData: TMemoryStream;
  NeedSave: Boolean;
begin
  inherited;
  if FDataSource.DataSet.RecordCount = 0 then
    Exit;

  if (not dmMain.AllowedAction(rght_Dictionary_Nodes)) then
    Exit;

  CircuitData := TMemoryStream.Create;
  PngData := TMemoryStream.Create;

  try
    if (dsCircuit.RecordCount = 0) or (dsCircuit.FieldByName('CIRCUIT').IsNull) then
      NeedSave := EditCircuit(CircuitData, PngData)
    else
    begin
      TBlobField(dsCircuit.FieldByName('CIRCUIT')).SaveToStream(CircuitData);
      CircuitData.Seek(0, soBeginning);
      NeedSave := EditCircuit(CircuitData, PngData);
    end;
    if NeedSave then
    begin
      if dsCircuit.RecordCount > 0 then
        dsCircuit.Edit
      else
      begin
        dsCircuit.Insert;
        dsCircuit['NAME'] := 'Схема';
        dsCircuit['NOTICE'] := '';
        dsCircuit['HOUSE_ID'] := FDataSource.DataSet['NODE_ID'];
      end;
      TBlobField(dsCircuit.FieldByName('CIRCUIT')).LoadFromStream(CircuitData);
      TBlobField(dsCircuit.FieldByName('PNG')).LoadFromStream(PngData);
      dsCircuit.Post;
    end;
  finally
    CircuitData.Free;
    PngData.Free;
  end;
end;

procedure TapgNodeCIRCUIT.actViewExecute(Sender: TObject);
var
  CircuitData: TMemoryStream;
  PngData: TMemoryStream;
begin
  inherited;

  if (not dsCircuit.FieldByName('CIRCUIT').IsNull) then
  begin
    CircuitData := TMemoryStream.Create;
    PngData := TMemoryStream.Create;
    try
      TBlobField(dsCircuit.FieldByName('CIRCUIT')).SaveToStream(CircuitData);
      CircuitData.Seek(0, soBeginning);
      EditCircuit(CircuitData, PngData, True);
    finally
      CircuitData.Free;
      PngData.Free;
    end;
  end
  else if (not dsCircuit.FieldByName('PNG').IsNull) then
  begin
    actViewFile;
  end;
end;

procedure TapgNodeCIRCUIT.actViewFile;
var
  FileName: string;
  PngData: TFileStream;
begin
  inherited;

  if (not dsCircuit.FieldByName('PNG').IsNull) then
  begin
    FileName := GetTempDir + 'A4on\';
    if not DirectoryExists(FileName) then
      CreateDir(FileName);
    FileName := FileName + dsCircuit.FieldByName('NAME').AsString;
    PngData := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);
    try
      TBlobField(dsCircuit.FieldByName('PNG')).SaveToStream(PngData);
    finally
      PngData.Free;
    end;
    if FileExists(FileName) then
      ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TapgNodeCIRCUIT.CloseData;
begin
  dsCircuit.Close;
end;

end.
