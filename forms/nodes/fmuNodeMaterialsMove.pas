unit fmuNodeMaterialsMove;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, MemTableDataEh, DataDriverEh, pFIBDataDriverEh,
  MemTableEh;

type
  TapgNodeMaterialsMove = class(TA4onPage)
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dbgMat: TDBGridEh;
    srcMat: TDataSource;
    Panel1: TPanel;
    btnDetail: TSpeedButton;
    ActListCustomers: TActionList;
    actAdd: TAction;
    dsMat: TpFIBDataSet;
    actDetail: TAction;
    procedure actDetailExecute(Sender: TObject);
    procedure dbgMatDblClick(Sender: TObject);
  private
    CE: Boolean;
    CC: Boolean;
    CG: Boolean;
    CA: Boolean;
    FullAccess: Boolean;
    procedure SetSQL(const Grouping: Boolean = False);
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, DM, RequestForma;

class function TapgNodeMaterialsMove.GetPageName: string;
begin
  Result := rsMaterialsМоve;
end;

procedure TapgNodeMaterialsMove.InitForm;
begin
  actDetail.Checked := True;
  SetSQL(actDetail.Checked);
  dsMat.DataSource := FDataSource;

  FullAccess := dmMain.AllowedAction(rght_Request_full); // (50, 'ПОЛНЫЙ ДОСТУП', 'ЗАЯВКИ', 'Полный доступ');
  CA := dmMain.AllowedAction(rght_Request_add); // (51, 'ДОБАВЛЕНИЕ', 'ЗАЯВКИ', 'Добавление заявок');
  CE := dmMain.AllowedAction(rght_Request_edit); // (52, 'РЕДАКТИРОВАНИЕ', 'ЗАЯВКИ', 'Редактирование заявки');
  CC := dmMain.AllowedAction(rght_Request_Close); // (54, 'ЗАКРЫТИЕ', 'ЗАЯВКИ', 'Закрытие заявки');
  CG := dmMain.AllowedAction(rght_Request_Give); // (53, 'ВЫДАЧА', 'ЗАЯВКИ', 'Выдача заявок в работу');
end;

procedure TapgNodeMaterialsMove.OpenData;
begin
  dsMat.Open;
end;

procedure TapgNodeMaterialsMove.actDetailExecute(Sender: TObject);
begin
  actDetail.Checked := not actDetail.Checked;
  dsMat.Close;
  SetSQL(actDetail.Checked);
  if actDetail.Checked then
    actDetail.ImageIndex := 24 // детально
  else
    actDetail.ImageIndex := 101; // суммарно
  dsMat.Open;
end;

procedure TapgNodeMaterialsMove.CloseData;
begin
  dsMat.Close;
end;

procedure TapgNodeMaterialsMove.dbgMatDblClick(Sender: TObject);
var
  aRequest: Integer;
  aNodeID: Integer;
  aMode: Byte;
begin
  if dsMat.FieldDefs.IndexOf('RQ_ID') = -1 then
    Exit;

  if (not dsMat.FieldByName('RQ_ID').IsNull) then begin

    if not(FullAccess or CE or CC or CG or CA) then
      Exit;

    if not dsMat.FieldByName('RQ_ID').IsNull then begin
      if not(FullAccess or CE or CC or CG) then
        Exit;
      aMode := 1;
      aRequest := dsMat.FieldByName('RQ_ID').AsInteger;
      if not FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
        aNodeID := FDataSource.DataSet.FieldByName('NODE_ID').AsInteger
      else
        aNodeID := -1;
      ReguestNodeExecute(aRequest, aNodeID, aMode);
    end;
  end;
end;

procedure TapgNodeMaterialsMove.SetSQL(const Grouping: Boolean = False);
begin
  dsMat.SelectSQL.Clear;
  dsMat.SelectSQL.Add('select');
  dsMat.SelectSQL.Add('    NM.M_ID');
  dsMat.SelectSQL.Add('  , M.NAME');
  dsMat.SelectSQL.Add('  , M.COST');
  dsMat.SelectSQL.Add('  , M.DIMENSION');
  if Grouping then begin
    dsMat.SelectSQL.Add('  , NULL WH_NAME');
    dsMat.SelectSQL.Add('  , NULL WH_ID');
    dsMat.SelectSQL.Add('  , ''Итого'' OPER, NULL RQ_ID, NULL RQ_EXEC_TIME');
    dsMat.SelectSQL.Add('  , SUM(NM.MT * NM.QUANT) QNT');
  end
  else begin
    dsMat.SelectSQL.Add('  , O.O_NAME WH_NAME');
    dsMat.SelectSQL.Add('  , NM.WH_ID');
    dsMat.SelectSQL.Add('  , iif(NM.MT = 1, ''Установка'', ''Возврат'') OPER, NM.RQ_ID, NM.RQ_EXEC_TIME');
    dsMat.SelectSQL.Add('  , NM.MT * NM.QUANT QNT');
  end;
  dsMat.SelectSQL.Add('from (select');
  dsMat.SelectSQL.Add('          RM.M_ID');
  dsMat.SelectSQL.Add('        , RM.RM_NOTICE NOTICE');
  dsMat.SelectSQL.Add('        , RM.RM_QUANT QUANT');
  dsMat.SelectSQL.Add('        , 1 as MT');
  dsMat.SelectSQL.Add('        , RM.RM_ID');
  dsMat.SelectSQL.Add('        , R.RQ_ID');
  dsMat.SelectSQL.Add('        , R.RQ_EXEC_TIME');
  dsMat.SelectSQL.Add('        , RM.WH_ID');
  dsMat.SelectSQL.Add('      from REQUEST R');
  dsMat.SelectSQL.Add('          inner join REQUEST_MATERIALS RM on (R.RQ_ID = RM.RQ_ID)');
  dsMat.SelectSQL.Add('      where R.NODE_ID = :NODE_ID');
  dsMat.SelectSQL.Add('      union all');
  dsMat.SelectSQL.Add('      select');
  dsMat.SelectSQL.Add('          RM.M_ID');
  dsMat.SelectSQL.Add('        , RM.NOTICE NOTICE');
  dsMat.SelectSQL.Add('        , RM.QUANT QUANT');
  dsMat.SelectSQL.Add('        , -1 as MT');
  dsMat.SelectSQL.Add('        , RM.ID RM_ID');
  dsMat.SelectSQL.Add('        , R.RQ_ID');
  dsMat.SelectSQL.Add('        , R.RQ_EXEC_TIME');
  dsMat.SelectSQL.Add('        , RM.WH_ID');
  dsMat.SelectSQL.Add('      from REQUEST R');
  dsMat.SelectSQL.Add('          inner join REQUEST_MATERIALS_RETURN RM on (R.RQ_ID = RM.RQ_ID)');
  dsMat.SelectSQL.Add('      where R.NODE_ID = :NODE_ID) NM');
  dsMat.SelectSQL.Add('    inner join MATERIALS M on (M.M_ID = NM.M_ID)');
  dsMat.SelectSQL.Add('    left outer join OBJECTS O on (O.O_ID = NM.WH_ID and O.O_TYPE = 10)');
  if Grouping then
    dsMat.SelectSQL.Add('group by 1,2,3,4,5,6,7,8,9')
  else
    dsMat.SelectSQL.Add('order by 1');
end;

end.
