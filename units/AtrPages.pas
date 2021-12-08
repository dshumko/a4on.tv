unit AtrPages;

interface

Uses
  // VCL
  System.Classes, System.SysUtils, VCL.Forms, Data.DB, System.Types, DBGridEh;

type
  TA4onPage = class;
  TA4onPageItem = class;
  TA4onPageClass = class of TA4onPage;

  { TA4onPages }
  TA4onPages = class
  private
    FList: TList;
    function GetCount: Integer;
    function GetItem(Index: Integer): TA4onPageItem;
    function GetItemIndex(AItem: TA4onPageItem): Integer;
    procedure InsertItem(AItem: TA4onPageItem);
    procedure RemoveItem(AItem: TA4onPageItem);
  public
    destructor Destroy; override;
    class function GeTA4onPageName: string; virtual; abstract;
    procedure Add(PageClass: TA4onPageClass);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TA4onPageItem read GetItem; default;
  end;

  { TA4onPageItem }
  TA4onPageItem = class
  private
    FOwner: TA4onPages;
    FPage: TA4onPage;
    FPageClass: TA4onPageClass;
    function GetIndex: Integer;
    procedure SetOwner(AOwner: TA4onPages);
  public
    constructor Create(AOwner: TA4onPages; APageClass: TA4onPageClass);
    destructor Destroy; override;
    property Page: TA4onPage read FPage write FPage;
    property Index: Integer read GetIndex;
    property PageClass: TA4onPageClass read FPageClass;
  end;

  TResultEvent = procedure(Code: Integer; const S: string) of object;

  { TA4onPage }

  TA4onPage = class(TForm)
  private
    FOnStart: TNotifyEvent;
    FOnUpdate: TNotifyEvent;
    function GetDataSource: TDataSource;
    procedure InitControls;
  protected
    FDataSource: TDataSource;
    FGrid: TDBGridEh;
    procedure Start;
    procedure UpdatePage;
    property DataSource: TDataSource read GetDataSource;
    procedure dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
  public
    class function GetPageName: string; virtual; abstract;
    procedure UpdateObject; virtual;
    procedure OpenData; virtual;
    procedure SaveData; virtual;
    procedure CloseData; virtual;
    procedure SaveState; virtual;
    procedure SavePosition; virtual;
    procedure GotoSavedPosition; virtual;
    function ValidateData: Boolean; virtual;
    function LoadDefaults: Boolean; virtual;
    function GetOrderClause(grid: TDBGridEh): string; virtual;
    constructor CreatePage(AOwner: TComponent; ADataSource: TDataSource); virtual;
    constructor CreatePageGrid(AOwner: TComponent; AGrid: TDBGridEh); virtual;
    procedure InitForm; virtual;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end;

implementation

uses
  MAIN, DM, ToolCtrlsEh, VCL.StdCtrls;

{ TA4onPages }

destructor TA4onPages.Destroy;
begin
  if Assigned(FList) then
  begin
    while Count > 0 do
      Items[0].Free;
    FreeAndNil(FList);
  end;
  inherited Destroy;
end;

function TA4onPages.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TA4onPages.GetItem(Index: Integer): TA4onPageItem;
begin
  if Assigned(FList) then
    Result := FList[Index]
  else
    Result := nil;
end;

function TA4onPages.GetItemIndex(AItem: TA4onPageItem): Integer;
begin
  if Assigned(FList) then
    Result := FList.IndexOf(AItem)
  else
    Result := -1;
end;

procedure TA4onPages.InsertItem(AItem: TA4onPageItem);
begin
  if not Assigned(FList) then
    FList := TList.Create;
  AItem.FOwner := Self;
  FList.Add(AItem);
end;

procedure TA4onPages.RemoveItem(AItem: TA4onPageItem);
begin
  AItem.FOwner := nil;
  FList.Remove(AItem);
end;

procedure TA4onPages.Add(PageClass: TA4onPageClass);
begin
  TA4onPageItem.Create(Self, PageClass);
end;

{ TA4onPageItem }

constructor TA4onPageItem.Create(AOwner: TA4onPages; APageClass: TA4onPageClass);
begin
  inherited Create;
  FPageClass := APageClass;
  SetOwner(AOwner);
end;

destructor TA4onPageItem.Destroy;
begin
  SetOwner(nil);
  inherited Destroy;
end;

procedure TA4onPageItem.SetOwner(AOwner: TA4onPages);
begin
  if FOwner <> nil then
    FOwner.RemoveItem(Self);
  if AOwner <> nil then
    AOwner.InsertItem(Self);
end;

function TA4onPageItem.GetIndex: Integer;
begin
  Result := FOwner.GetItemIndex(Self);
end;

{ TA4onPage }

constructor TA4onPage.CreatePage(AOwner: TComponent; ADataSource: TDataSource);
begin
  inherited Create(AOwner);

  FDataSource := ADataSource;
  FGrid := nil;

  InitControls;
end;

constructor TA4onPage.CreatePageGrid(AOwner: TComponent; AGrid: TDBGridEh);
begin
  inherited Create(AOwner);

  FGrid := AGrid;
  FDataSource := AGrid.DataSource;

  InitControls;
end;

procedure TA4onPage.InitControls;
var
  i, c: Integer;
  Font_size: Integer;
  Row_height: Integer;
  Font_name, S: string;
  ini: string;
  formName: String;
begin
  ini := A4MainForm.GetIniFileName;
  formName := Self.Name;
  i := Pos('_', formName);
  if i > 0 then
    formName := copy(formName, 1, i - 1);
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(ini, formName + '.' + Components[i].Name,
        [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
      for c := 0 to (Components[i] as TDBGridEh).Columns.Count - 1 do
      begin
        S := (Components[i] as TDBGridEh).Columns[c].FieldName.toUpper;
        if (S.Contains('NOTICE') or S.Contains('DESCRIPTION')) and
          (not Assigned((Components[i] as TDBGridEh).Columns[c].OnGetCellParams)) then
          (Components[i] as TDBGridEh).Columns[c].OnGetCellParams := dbGridColumnsGetCellParams
      end;
    end;
  end;
end;

procedure TA4onPage.dbGridColumnsGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, ' ', [rfReplaceAll]);
end;

function TA4onPage.GetDataSource: TDataSource;
begin
  Result := FDataSource;
end;

procedure TA4onPage.Start;
begin
  if Assigned(FOnStart) then
    FOnStart(Self);
end;

procedure TA4onPage.UpdatePage;
begin
  if Assigned(FOnUpdate) then
    FOnUpdate(Self);
end;

procedure TA4onPage.InitForm;
begin

end;

procedure TA4onPage.UpdateObject;
begin

end;

procedure TA4onPage.OpenData;
begin

end;

procedure TA4onPage.SaveData;
begin

end;

procedure TA4onPage.SavePosition;
begin

end;

procedure TA4onPage.GotoSavedPosition;
begin

end;

procedure TA4onPage.SaveState;
var
  i: Integer;
  ini: string;
  formName: String;
begin
  ini := A4MainForm.GetIniFileName;
  formName := Self.Name;
  i := Pos('_', formName);
  if i > 0 then
    formName := copy(formName, 1, i - 1);

  ini := A4MainForm.GetIniFileName;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(ini, formName + '.' + Components[i].Name, true);
end;

procedure TA4onPage.CloseData;
begin

end;

function TA4onPage.ValidateData: Boolean;
begin
  Result := true;
end;

function TA4onPage.LoadDefaults: Boolean;
begin
  Result := true;
end;

function TA4onPage.GetOrderClause(grid: TDBGridEh): string;
var
  S: string;
  i, J: Integer;
begin
  J := grid.SortMarkedColumns.Count;
  S := '';
  for i := 0 to pred(J) do
  begin
    S := S + grid.SortMarkedColumns[i].FieldName;
    if grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      S := S + ' desc';
    if i <> pred(J) then
      S := S + ', ';
  end;
  Result := S;
end;

end.
