unit WireForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin,
  GridForma, ToolCtrlsEh, DBGridEhToolCtrls, CnErrorProvider, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, FIBDataSet,
  pFIBDataSet,
  frxClass, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, MemTableDataEh, MemTableEh;

type
  TWireForm = class(TGridForm)
    dsWire: TpFIBDataSet;
    btn1: TToolButton;
    btnPrint: TToolButton;
    actPrint: TAction;
    frxReport: TfrxReport;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pmFilter: TPopupMenu;
    N31: TMenuItem;
    N53: TMenuItem;
    N42: TMenuItem;
    N36: TMenuItem;
    btnFilterNew: TToolButton;
    actEnableFilter: TAction;
    actFilterSet: TAction;
    btn2: TToolButton;
    btn3: TToolButton;
    actOpenObject: TAction;
    actOpenNodeFrom: TAction;
    actOpenNodeTo: TAction;
    miN1: TMenuItem;
    miOpenNodeFrom: TMenuItem;
    miOpenNodeTo: TMenuItem;
    pnlPorts: TPanel;
    spl1: TSplitter;
    dbgWireLink: TDBGridEh;
    dsPorts: TpFIBDataSet;
    srcPorts: TDataSource;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnPortLinkEdit: TSpeedButton;
    actPortLinkAdd: TAction;
    actPortLinkEdit: TAction;
    btnOpen: TSpeedButton;
    pmOpen: TPopupMenu;
    miOpenEq: TMenuItem;
    miOpenNode: TMenuItem;
    pgcWire: TPageControl;
    tsPort: TTabSheet;
    tsPoint: TTabSheet;
    Panel1: TPanel;
    btnPointDel: TSpeedButton;
    btnPointAdd: TSpeedButton;
    btnPointEdit: TSpeedButton;
    dbgPoint: TDBGridEh;
    dsFilter: TMemTableEh;
    actPointAdd: TAction;
    actPointEdit: TAction;
    actPointDel: TAction;
    dsPoint: TpFIBDataSet;
    srcPoint: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actOpenNodeFromExecute(Sender: TObject);
    procedure actOpenNodeToExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actPortLinkAddExecute(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure miOpenEqClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure miOpenNodeClick(Sender: TObject);
    procedure actFilterSetExecute(Sender: TObject);
    procedure actEnableFilterExecute(Sender: TObject);
    procedure pgcWireChange(Sender: TObject);
    procedure actPointAddExecute(Sender: TObject);
    procedure actPointDelExecute(Sender: TObject);
    procedure dbgWireLinkGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    FFullAccess: Boolean;
    procedure InitForm;
    procedure InitSecurity;
    function GenerateFilter: string;
  public
    procedure SetDefaultFilter;
  end;

var
  WireForm: TWireForm;

implementation

uses
  MAIN, DM, A4onTypeUnit, PrjConst, NodeLinkForma, WireLinkForma, WirePointForma, WireFilter, FIBQuery, pFIBQuery,
  AtrCommon,
  AtrStrUtils;

const
  const_default_filter: string = ' 1=1 ';

{$R *.dfm}

procedure TWireForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsPorts.Close;
  dsWire.Close;
  WireForm := nil;
end;

procedure TWireForm.InitSecurity;
begin
  inherited;
  FFullAccess := (dmMain.AllowedAction(rght_Dictionary_Nodes));
  // Экспорт информации
  pmgSaveSelection.Visible := (dmMain.AllowedAction(rght_Export));

  actDelete.Enabled := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  actEdit.Enabled := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  actNew.Enabled := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;

  actPortLinkAdd.Visible := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  actPortLinkEdit.Visible := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  btnDel.Visible := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;

  actPointAdd.Visible := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  actPointEdit.Visible := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  actPointDel.Visible := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
end;

procedure TWireForm.miOpenEqClick(Sender: TObject);
begin
  inherited;
  if ((dsPorts.FieldByName('Eid').IsNull) or (dsPorts.FieldByName('ENAME').IsNull)) then
    exit;

  A4MainForm.OpenEquipmentByName(dsPorts['ENAME']);
end;

procedure TWireForm.miOpenNodeClick(Sender: TObject);
begin
  inherited;
  if dsPorts.FieldByName('NODE_ID').IsNull then
    exit;

  A4MainForm.OpnenNodeByID(dsPorts['NODE_ID']);
end;

procedure TWireForm.pgcWireChange(Sender: TObject);
begin
  inherited;
  dsPorts.Active := (pgcWire.ActivePage = tsPort);
  dsPoint.Active := (pgcWire.ActivePage = tsPoint);
end;

procedure TWireForm.InitForm;
begin
  //
end;

procedure TWireForm.FormShow(Sender: TObject);
begin
  inherited;
  InitForm;
  InitSecurity;
  dsWire.Open;
  dsPorts.Open;
end;

procedure TWireForm.actDeleteExecute(Sender: TObject);
var
  i: Integer;
  s: string;
begin
  inherited;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Clear;
      SQL.Add('execute block (WID D_INTEGER = :WID) returns ( CWHAT  D_Varchar10,  CCOUNT d_INTEGER) as ');
      SQL.Add('begin ');
      SQL.Add('  ccount = 0; ');
      SQL.Add('  CWHAT = ''''; ');
      SQL.Add('  select count(*) from port p where p.Wid = :WID into :CCOUNT; ');
      SQL.Add('  if (ccount > 0) then ');
      SQL.Add('    CWHAT = ''Порты''; ');
      SQL.Add('  suspend; ');
      SQL.Add('end ');
      ParamByName('WID').AsInteger := dsWire['WID'];
      Transaction.StartTransaction;
      ExecQuery;
      i := FN('CCOUNT').AsInteger;
      if i > 0 then
        s := FN('CWHAT').AsString
      else
        s := '';
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
  if i > 0 then
    ShowMessageFmt(rsErrorNeedLinkClear, [s, i])
  else
  begin
    if (MessageDlg(Format(rsDeleteWithName, [dsWire['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      dsWire.UpdateTransaction.StartTransaction;
      dsWire.Delete;
      dsWire.UpdateTransaction.Commit;
    end
  end;
end;

procedure TWireForm.actEditExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
begin
  inherited;

  if (not dsWire.Active) then
    exit;

  LinkItem.LINK_ID := dsWire['WID'];
  if not dsWire.FieldByName('NODE_S_ID').IsNull then
  begin
    LinkItem.NODE_ID := dsWire['NODE_S_ID'];
    LinkItem.NODE_Name := dsWire['NODE_S'];
  end
  else
  begin
    LinkItem.NODE_ID := -1;
    LinkItem.NODE_Name := '';
  end;

  SecondItem.LINK_ID := dsWire['WID'];
  if not dsWire.FieldByName('NODE_E_ID').IsNull then
  begin
    SecondItem.NODE_ID := dsWire['NODE_E_ID'];
    SecondItem.NODE_Name := dsWire['NODE_E'];
  end
  else
  begin
    SecondItem.NODE_ID := -1;
    SecondItem.NODE_Name := '';
  end;

  if LinkNodes(LinkItem, SecondItem) then
  begin
    dsWire.Refresh;
  end
end;

procedure TWireForm.actEnableFilterExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet is TpFIBDataSet then
  begin
    actEnableFilter.Checked := not actEnableFilter.Checked;
    dsWire.ParamByName('Filter').Value := GenerateFilter;
    dsPorts.Close;
    dsWire.CloseOpen(True);
    dsPorts.Open;
  end;
end;

procedure TWireForm.actFilterSetExecute(Sender: TObject);
var
  filter: string;
begin
  inherited;
  if not(srcDataSource.DataSet is TpFIBDataSet) then
    exit;

  filter := '';

  with TWireFilterForm.Create(Application) do
    try
      if not dsFilter.Active then
        SetDefaultFilter;

      actEnableFilter.Checked := (ShowModal = mrOk);
      filter := GenerateFilter;
    finally
      Free;
    end;

  if (srcDataSource.DataSet.Filtered) then
  begin
    srcDataSource.DataSet.filter := '';
    srcDataSource.DataSet.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsWire.Close;
    dsWire.ParamByName('Filter').Value := filter;
    try
      dsWire.Open;
    except
      ShowMessage(rsErrorFilter);
      dsWire.Close;
      dsWire.ParamByName('Filter').Clear;
      dsWire.Open;
    end;
    pgcWireChange(nil);
  end;
end;

procedure TWireForm.actNewExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
begin
  inherited;

  if (not dsWire.Active) then
    exit;

  LinkItem.NODE_ID := -1;
  LinkItem.NODE_Name := '';
  LinkItem.LINK_ID := -1;

  SecondItem.NODE_ID := -1;
  SecondItem.NODE_Name := '';
  SecondItem.LINK_ID := -1;

  if LinkNodes(LinkItem, SecondItem) then
  begin
    dsWire.CloseOpen(True);
    dsWire.Locate('WID', LinkItem.LINK_ID, []);
  end
end;

procedure TWireForm.actOpenNodeFromExecute(Sender: TObject);
begin
  inherited;
  if dsWire.FieldByName('NODE_S_ID').IsNull then
    exit;

  A4MainForm.OpnenNodeByID(dsWire['NODE_S_ID']);
end;

procedure TWireForm.actOpenNodeToExecute(Sender: TObject);
begin
  inherited;
  if dsWire.FieldByName('NODE_E_ID').IsNull then
    exit;

  A4MainForm.OpnenNodeByID(dsWire['NODE_E_ID']);
end;

procedure TWireForm.actPointAddExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsWire.FieldByName('NODE_S_ID').IsNull) or (dsWire.FieldByName('NODE_E_ID').IsNull) then
    exit;

  if (dsWire.FieldByName('LABELS').IsNull) then
    s := ''
  else
    s := dsWire['LABELS'];

  WirePoint(dsWire['WID']);
  dsPoint.CloseOpen(True);
end;

procedure TWireForm.actPointDelExecute(Sender: TObject);
begin
  inherited;
  if (dsPoint.RecordCount = 0) or (dsPoint.FieldByName('NODE_NAME').IsNull) then
    exit;

  if Application.MessageBox(PWideChar(Format(rsDeleteRecord, [dsPoint.FieldByName('NODE_NAME').AsString])),
    PWideChar(rsDeleteCaption), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'delete from Wire_Point where WID = :WID and Node_Id = :Node_Id';
      ParamByName('WID').AsInteger := dsPoint['WID'];
      ParamByName('Node_Id').AsInteger := dsPoint['Node_Id'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;

  dsPoint.CloseOpen(True);
end;

procedure TWireForm.actPortLinkAddExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsWire.FieldByName('NODE_S_ID').IsNull) or (dsWire.FieldByName('NODE_E_ID').IsNull) then
    exit;

  if (dsWire.FieldByName('LABELS').IsNull) then
    s := ''
  else
    s := dsWire['LABELS'];

  WireLink(dsWire['WID'], s, dsWire['NODE_S_ID'], dsWire['NODE_E_ID']);
  dsPorts.CloseOpen(True);
end;

procedure TWireForm.btnDelClick(Sender: TObject);
begin
  inherited;

  if (dsPorts.RecordCount = 0) or (dsPorts.FieldByName('WID').IsNull) then
    exit;

  if Application.MessageBox(PWideChar(rsWireUnLinkQuest), PWideChar(rsWireUnLink),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'update Port set WID = null, WLABEL = null where WID = :WID ';
      if not dsPorts.FieldByName('Wlabel').IsNull then
      begin
        SQL.Add(' and WLABEL = :WLABEL ');
        ParamByName('WLABEL').AsString := dsPorts['Wlabel'];
      end;
      ParamByName('WID').AsInteger := dsPorts['WID'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;

  dsPorts.CloseOpen(True);
end;

procedure TWireForm.btnOpenClick(Sender: TObject);
begin
  inherited;
  pmOpen.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TWireForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not(dsWire.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsWire['COLOR']);
end;

procedure TWireForm.dbgWireLinkGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  //
  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('CUST_CONNECTED').IsNull then
  begin
    if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('CUST_CONNECTED').AsInteger = 0) then
      Background := clYellow
    else
      Background := clWindow;
  end;
end;

procedure TWireForm.FormCreate(Sender: TObject);
begin
  inherited;
  dmMain.frxAddFunctions(frxReport);
end;

function TWireForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  inherited;
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

function TWireForm.GenerateFilter: string;

  function RecordToFilter: string;
  var
    tmpSQL, s: string;
  begin
    tmpSQL := '';

    // Условие отбора по адресу
    if (dsFilter['CHECK_ADRESS'] = 1) then
    begin
      if (not dsFilter.FieldByName('HOUSE_ID').IsNull) then
      begin
        s := ' and ((s.House_Id = %d) or (e.House_Id = %d)) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('HOUSE_ID').AsInteger,
          dsFilter.FieldByName('HOUSE_ID').AsInteger])
      end
      else if (not dsFilter.FieldByName('Street_Id').IsNull) then
      begin
        s := ' and ((sh.Street_Id = %d) or (eh.Street_Id = %d)) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('Street_Id').AsInteger,
          dsFilter.FieldByName('Street_Id').AsInteger])
      end;

      if (not dsFilter.FieldByName('PORCH').IsNull) then
      begin
        s := ' and ((s.Porch_N = ''%s'') or (e.Porch_N = ''%s'')) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('PORCH').AsString, dsFilter.FieldByName('PORCH').AsString])
      end;

      if (not dsFilter.FieldByName('FLOOR').IsNull) then
      begin
        s := ' and ((s.Floor_N = ''%s'') or (e.Floor_N = ''%s'')) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('FLOOR').AsString, dsFilter.FieldByName('FLOOR').AsString])
      end;

      if (not dsFilter.FieldByName('PLACE').IsNull) then
      begin
        s := ' and ((s.Place = ''%s'') or (e.Place = ''%s'')) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('PLACE').AsString, dsFilter.FieldByName('PLACE').AsString])
      end;

      if (not dsFilter.FieldByName('SUBAREA_ID').IsNull) then
      begin
        s := ' and ((sh.Subarea_Id = %d) or (eh.Subarea_Id = %d)) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('SUBAREA_ID').AsInteger,
          dsFilter.FieldByName('SUBAREA_ID').AsInteger])
      end;

      if (not dsFilter.FieldByName('AREA_ID').IsNull) then
      begin
        s := ' and ((ss.AREA_ID = %d) or (es.AREA_ID = %d)) ';
        tmpSQL := tmpSQL + Format(s, [dsFilter.FieldByName('AREA_ID').AsInteger,
          dsFilter.FieldByName('AREA_ID').AsInteger])
      end;
    end;

    if (not dsFilter.FieldByName('MatID').IsNull) then
      tmpSQL := tmpSQL + Format(' and ( c.M_ID = %d ) ', [dsFilter.FieldByName('MatID').AsInteger]);

    if (not dsFilter.FieldByName('WTYPE').IsNull) then
      tmpSQL := tmpSQL + Format(' and ( c.WTYPE = %d ) ', [dsFilter.FieldByName('WTYPE').AsInteger]);

    if (not dsFilter.FieldByName('WLABEL').IsNull) then
    begin
      s := dsFilter.FieldByName('WLABEL').AsString;
      if (s.Contains('%') or s.Contains('%')) then
        tmpSQL := tmpSQL + Format(' and ( c.LABELS like ''%s'') ', [s])
      else
        tmpSQL := tmpSQL + Format(' and ( c.LABELS = ''%s'') ', [s]);
    end;

    if (not dsFilter.FieldByName('PROBLEM').IsNull) then
    begin
      // 1 Линии свободны
      // 2 Подключена одна точка
      // 3 Линия подключена к откл. абоненту

      case dsFilter['PROBLEM'] of
        1: // 1 Линии свободны
          tmpSQL := tmpSQL + ' and (not (c.Capacity is null or c.Capacity = 1)) ' +
            'and (mod((select count(*) from port ip where ip.Wid = c.Wid), 2) <> 0)';

        2: // 2 Подключена одна точка
          tmpSQL := tmpSQL + ' and (not (c.Capacity is null or c.Capacity = 1)) ' +
            'and (mod((select count(*) from port ip where ip.Wid = c.Wid), 2) <> 0)';

        3: // 3 Линия подключена к откл. абоненту
          tmpSQL := tmpSQL + ' and (exists(select p.Wid from TV_LAN l' + #13#10 +
            ' inner join equipment e on (l.Eq_Id = e.Eid)' + #13#10 +
            ' inner join port p on (p.Eid = e.Eid and l.Port = p.Port) where p.Wid = c.wid' + #13#10 +
            ' and not exists(select sh.Customer_Id' + #13#10 +
            ' from Subscr_hist sh inner join services s on (sh.Serv_Id = s.Service_Id)' + #13#10 +
            ' where s.Business_Type in (1, 3) and sh.Customer_Id = l.Customer_Id ' + #13#10 +
            ' and current_date between sh.Date_From and sh.Date_To )))';
      end;
    end;

    if (tmpSQL <> '') then
      Result := TrimAnd(tmpSQL)
    else
      Result := filter_1_1;

    if dsFilter['inversion'] then
      Result := Format(' NOT (%s) ', [Result]);
  end;

var
  whereStr: string;
  default: string;
begin
  default := filter_1_1;
  Result := default;
  whereStr := '';

  if (dsFilter.RecordCount = 0) or (not actEnableFilter.Checked) then
    exit;

  srcDataSource.DataSet.DisableControls;

  try
    dsFilter.First;

    whereStr := '';
    while not dsFilter.Eof do
    begin
      whereStr := whereStr + ' ( ' + RecordToFilter + ' ) ';
      // проверим, если ограничение одной записи и фильтр по квартире. то скинем ограничение
      dsFilter.next;
      if not dsFilter.Eof then
        if dsFilter['next_condition'] = 0 then
          whereStr := whereStr + ' OR '
        else
          whereStr := whereStr + ' AND '
    end;
  except
    whereStr := default;
    ShowMessage(rsErrorSetFilter);
  end;

  Result := whereStr;
  srcDataSource.DataSet.EnableControls;
end;

procedure TWireForm.SetDefaultFilter;
var
  f: string;
begin
  dsFilter.Close;
  dsFilter.Open;
  dsFilter.EmptyTable;
  f := A4MainForm.GetUserFilterFolder + 'wire_default.jwf';
  if FileExists(f) then
  begin
    if dsFilter.State in [dsEdit, dsInsert] then
      dsFilter.Post;
    DatasetFromJson(dsFilter, f);
  end;

  if dsFilter.RecordCount > 0 then
    actEnableFilter.Checked := True;
end;

end.
