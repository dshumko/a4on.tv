unit fmuCustomerCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, frxClass, frxPreview, DB, FIBDataSet, pFIBDataSet, PrjConst,
  FIBDatabase, pFIBDatabase;

type
  TapgCustomerCard = class(TA4onPage)
    frxReport: TfrxReport;
    frxPreview: TfrxPreview;
    dsForScroolWait: TpFIBDataSet;
    trRead: TpFIBTransaction;
    srcForScroolWait: TDataSource;
    function frxReportUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure srcForScroolWaitDataChange(Sender: TObject; Field: TField);
  private
    fActiveForm : Boolean;
  public
    procedure InitForm; override;
    procedure OpenData;   override;
    procedure CloseData;  override;
    class function GetPageName: string; override;
  end;
implementation

{$R *.dfm}

uses AtrCommon, synacode, dm;

class function TapgCustomerCard.GetPageName: string;
begin
  Result := rsFormOnTab;
end;

procedure TapgCustomerCard.InitForm;
var
  Stream: TStream;
  fReport_ID : Integer;
begin
  fActiveForm := False;
  //FDataSource.OnDataChange := srcDataChange;
  dsForScroolWait.DataSource := FDataSource;

  fReport_ID := dmMain.GET_ID_REPORT_BY_PATH(rsRepOnTab);
  if fReport_ID > 0 then begin
    try
      dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value:=fReport_ID;
      dmMain.fdsLoadReport.Open;
      if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value<>NULL then begin
        Stream:=TMemoryStream.Create;
        try
          TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
          Stream.Position:=0;
          frxReport.LoadFromStream(Stream);
          frxReport.FileName:=dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
          Caption := frxReport.FileName;
        finally
          Stream.Free;
        end;
      end;
    finally
      dmMain.fdsLoadReport.Close;
    end;
    fReport_ID := frxReport.Variables.IndexOf('CUSTOMER');
    frxPreview.Visible := (fReport_ID >= 0);
    dmMain.frxAddFunctions(frxReport);
  end
  else frxPreview.Visible := False;
end;

procedure TapgCustomerCard.OpenData;
begin
  fActiveForm := True;
  dsForScroolWait.Open;
end;

procedure TapgCustomerCard.CloseData;
begin
  dsForScroolWait.Close;
  fActiveForm := False;
end;

procedure TapgCustomerCard.srcForScroolWaitDataChange(Sender: TObject;
  Field: TField);
begin

  if (not fActiveForm)
     or (not frxPreview.Visible)
     or (srcForScroolWait.DataSet.FieldByName('CUSTOMER_ID').IsNull)
  then Exit;

  frxReport.Variables['CUSTOMER'] := srcForScroolWait.DataSet['CUSTOMER_ID'];
  frxReport.ShowReport(true);
  //frxReport.ShowPreparedReport;

end;

function TapgCustomerCard.frxReportUserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
  {

  if MethodName = 'BASE64_DECODE' then Result := DecodeBase64(Params[0]);
  if MethodName = 'BASE64_ENCODE' then Result := EncodeBase64(Params[0]);
  if MethodName = 'GEN_BARCODE'   then Result := dmMain.GenerateBarCode(Params[0],Params[1],Params[2],Params[3],Params[4],Params[5],Params[5]);
  if MethodName = 'InSuperMode'   then Result := dmMain.SuperMode;
  }
end;

end.
