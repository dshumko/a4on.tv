unit untPages;

interface

uses
  System.Win.ComObj,
  System.Classes, System.SysUtils,
  Data.DB,
  Vcl.Forms, Vcl.Grids, Vcl.Controls;

type
  TPage = class;
  TPageItem  = class;
  TPageClass = class of TPage;

  { TPageList }

  TPageList = class
  private
    FList: TList;
    function GetCount: Integer;
    function GetItem(Index: Integer): TPageItem;
    function GetItemIndex(AItem: TPageItem): Integer;
    procedure InsertItem(AItem: TPageItem);
    procedure RemoveItem(AItem: TPageItem);
  public
    destructor Destroy; override;
    procedure Add(PageClass: TPageClass);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TPageItem read GetItem; default;
  end;

  { TPageItem }

  TPageItem = class
  private
    FOwner: TPageList;
    FPage: TPage;
    FPageClass: TPageClass;
    function GetIndex: Integer;
    procedure SetOwner(AOwner: TPageList);
  public
    constructor Create(AOwner: TPageList; APageClass: TPageClass);
    destructor Destroy; override;
    property Page: TPage read FPage write FPage;
    property Index: Integer read GetIndex;
    property PageClass: TPageClass read FPageClass;
  end;

  TResultEvent = procedure (Code: Integer; const S: string) of object;

  { TPage }

  TPage = class(TForm)
  private
    FPassword: Integer;
    FOnStart: TNotifyEvent;
    FOnUpdate: TNotifyEvent;
    FOnGetPassword: TNotifyEvent;
    function GetDataSource: TDataSource;
  protected
    FDataSource: TDataSource;
    procedure Start;
    procedure UpdatePage;
    property DataSource: TDataSource read GetDataSource;
  public
    procedure UpdateObject; virtual;
    function LoadDefaults: Boolean; virtual;
    constructor CreatePage(AOwner: TComponent; ADataSource: TDataSource); virtual;
    class function GetPageName: string; virtual; abstract;
    procedure Initialize; virtual;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end;

implementation

{ TPageList }

destructor TPageList.Destroy;
begin
  while Count > 0 do Items[0].FreeAndNil;
  inherited Destroy;
end;

function TPageList.GetCount: Integer;
begin
  if FList = nil then
    Result := 0
  else
    Result := FList.Count;
end;

function TPageList.GetItem(Index: Integer): TPageItem;
begin
  Result := FList[Index];
end;

function TPageList.GetItemIndex(AItem: TPageItem): Integer;
begin
  Result := FList.IndexOf(AItem);
end;

procedure TPageList.InsertItem(AItem: TPageItem);
begin
  if FList = nil then FList := TList.Create;
  FList.Add(AItem);
  AItem.FOwner := Self;
end;

procedure TPageList.RemoveItem(AItem: TPageItem);
begin
  AItem.FOwner := nil;
  FList.Remove(AItem);
  if FList.Count = 0 then
  begin
    FList.FreeAndNil;
    FList := nil;
  end;
end;

procedure TPageList.Add(PageClass: TPageClass);
begin
  TPageItem.Create(Self, PageClass);
end;

{ TPageItem }

constructor TPageItem.Create(AOwner: TPageList; APageClass: TPageClass);
begin
  inherited Create;
  FPageClass := APageClass;
  SetOwner(AOwner);
end;

destructor TPageItem.Destroy;
begin
  SetOwner(nil);
  inherited Destroy;
end;

procedure TPageItem.SetOwner(AOwner: TPageList);
begin
  if FOwner <> nil then FOwner.RemoveItem(Self);
  if AOwner <> nil then AOwner.InsertItem(Self);
end;

function TPageItem.GetIndex: Integer;
begin
  Result := FOwner.GetItemIndex(Self);
end;

{ TPage }

constructor TPage.CreatePage(AOwner: TComponent; ADataSource: TDataSource);
begin
  inherited Create(AOwner);
  FDataSource := ADataSource;
end;

function TPage.GetDataSource: TDataSource;
begin
  Result := FDataSource;
end;

procedure TPage.Start;
begin
  if Assigned(FOnStart) then FOnStart(Self);
end;

procedure TPage.UpdatePage;
begin
  if Assigned(FOnUpdate) then FOnUpdate(Self);
end;

procedure TPage.Initialize;
begin

end;

procedure TPage.UpdateObject;
begin

end;

function TPage.LoadDefaults: Boolean;
begin
  Result := True;
end;

end.
