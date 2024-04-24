unit EQGroupsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBCtrlsEh,
  CnErrorProvider, VclTee.TeCanvas, EhLibVCL, DBGridEhGrouping, DynVarsEh,
  PrjConst, A4onTypeUnit, AtrPages, amSplitter;

type
  TEQGroupsForm = class(TGridForm)
    dsEQGroups: TpFIBDataSet;
    lbl1: TLabel;
    edtName: TDBEditEh;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    lbl3: TLabel;
    btnColorClear: TButton;
    btnColorSet: TButtonColor;
    pnlForms: TPanel;
    splLst: TSplitter;
    pnlDATA: TPanel;
    lstForms: TListBox;
    splMain: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure btnColorSetClick(Sender: TObject);
    procedure btnColorClearClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstFormsClick(Sender: TObject);
  private
    FLastPage: TA4onPage;
    FPageList: TA4onPages;
    procedure DoCreatePages;
    function IndexToPage(Index: Integer): TA4onPage;
    procedure ShowPage(Page: TA4onPage);
    procedure UpdateCommands;
    procedure StartCommand(Sender: TObject);
    procedure UpdatePage(Sender: TObject);
    procedure InitSecurity;
  public
    { Public declarations }
  end;

var
  EQGroupsForm: TEQGroupsForm;

implementation

uses
  DM, EQGAttributesFmu, EQGPortsFmu;

{$R *.dfm}

procedure TEQGroupsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i : Integer;
begin
  inherited;

  if Assigned(FPageList) then
  begin
    for i := 0 to FPageList.Count - 1 do
    begin
      if Assigned(FPageList[i].Page) then
        FPageList[i].Page.SaveState;
    end;
    FPageList.Free;
  end;


  dsEQGroups.Close;
  EQGroupsForm := nil;
end;

procedure TEQGroupsForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit(true);
end;

procedure TEQGroupsForm.btnCancelLinkClick(Sender: TObject);
begin
  pnlEdit.Color := clBtnFace;
  inherited;
end;

procedure TEQGroupsForm.btnColorClearClick(Sender: TObject);
begin
  inherited;
  btnColorSet.SymbolColor := clBtnFace;
  if not ( srcDataSource.DataSet.State in [dsInsert,dsEdit] )
  then srcDataSource.DataSet.Edit;
  srcDataSource.DataSet.FieldByName('COLOR').Clear;
end;

procedure TEQGroupsForm.btnColorSetClick(Sender: TObject);
begin
  inherited;
  if not ( srcDataSource.State in [dsInsert,dsEdit] )
  then srcDataSource.DataSet.Edit;
  srcDataSource.DataSet['COLOR'] := ColorToString(btnColorSet.SymbolColor);
end;

procedure TEQGroupsForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError,iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtName);

  if not errors
  then begin
    inherited;
    pnlEdit.Color := clBtnFace;
  end;
end;

procedure TEQGroupsForm.dbGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not dsEQGroups.FieldByName('COLOR').IsNull then
    try
      Background := StringToColor(dsEQGroups.FieldByName('COLOR').Value);
    except
    end;
end;

procedure TEQGroupsForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteRecord,[srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TEQGroupsForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then begin
    StartEdit();
    if not dsEQGroups.FieldByName('COLOR').IsNull
    then
      try
        btnColorSet.SymbolColor := StringToColor(dsEQGroups.FieldByName('COLOR').Value);
      except
      end;
  end;
end;

procedure TEQGroupsForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TEQGroupsForm.FormShow(Sender: TObject);
begin
  inherited;

  InitSecurity;

  dsEQGroups.Open;

  DoCreatePages;
  ShowPage(IndexToPage(0));
  UpdateCommands;
end;

procedure TEQGroupsForm.InitSecurity;
begin
  // права пользователей
  fCanEdit   := (((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment)) or dmMain.AllowedAction(rght_Dictionary_HeadEndEQP)));
  fCanCreate := (((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment)) or dmMain.AllowedAction(rght_Dictionary_HeadEndEQP)));
  // права пользователей
  actNew.Visible    := fCanCreate;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;
end;

procedure TEQGroupsForm.lstFormsClick(Sender: TObject);
begin
  inherited;
  ShowPage(IndexToPage(lstForms.ItemIndex));
end;

procedure TEQGroupsForm.DoCreatePages;
var
  i: Integer;
  Page: TA4onPage;
  Item: TA4onPageItem;
  PageName: string;
begin
  for i := 0 to FPageList.Count - 1 do
  begin
    Item := FPageList[i];
    if Item.Page = nil then
    begin
      Item.Page := Item.PageClass.CreatePageGrid(Self, dbGrid);
      Page := Item.Page;
      Page.InitForm;
      Page.OnUpdate := UpdatePage;
      Page.OnStart := StartCommand;
      Page.BorderStyle := bsNone;
      Page.Parent := pnlDATA;
      Page.Width := pnlDATA.ClientHeight;
      Page.Height := pnlDATA.ClientHeight;
    end;
  end;
  with lstForms do
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      for i := 0 to FPageList.Count - 1 do
      begin
        PageName := FPageList[i].PageClass.GetPageName;
        Items.Add(PageName);
      end;
    finally
      Items.EndUpdate;
    end;
  end;
end;

function TEQGroupsForm.IndexToPage(Index: Integer): TA4onPage;
begin
  if (Index < 0) or (Index >= FPageList.Count) then
    raise Exception.Create('Invalid page index');
  Result := FPageList[Index].Page;
end;


procedure TEQGroupsForm.FormCreate(Sender: TObject);
begin
  FPageList := TA4onPages.Create;
  FPageList.Add(TapgEQGAttributes);
  FPageList.Add(TapgEQGPort);

  inherited;
end;

procedure TEQGroupsForm.ShowPage(Page: TA4onPage);
begin
  if FLastPage <> nil then
  begin
    FLastPage.Visible := False;
    FLastPage.CloseData;
  end;
  FLastPage := Page;
  if Page <> nil then
  begin
    Page.Align := alClient;
    Page.Visible := True;
    Page.Width := pnlDATA.ClientWidth;
    Page.OpenData;
  end;
end;

procedure TEQGroupsForm.UpdateCommands;
begin
  //
end;

procedure TEQGroupsForm.StartCommand(Sender: TObject);
begin
  //
end;

procedure TEQGroupsForm.UpdatePage(Sender: TObject);
begin
  dsEQGroups.Refresh;
end;

end.
