unit ReportDesignerForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  MemTableDataEh, GridsEh, DBGridEh, MemTableEh, DataDriverEh, pFIBDataDriverEh, FIBDataSet, pFIBDataSet, DM,
{$IFDEF MSWINDOWS}
  Vcl.FileCtrl,
{$ENDIF}
  System.Actions,
  Vcl.Menus, Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList,
  ToolCtrlsEh, DBGridEhToolCtrls, ReportPreview, frxClass, DBAxisGridsEh, PrjConst, RxSplit, EhLibVCL, DBGridEhGrouping,
  DynVarsEh;

type
  TReportDesignerForm = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ActionList1: TActionList;
    aNewCategory: TAction;
    aSaveRepToFile: TAction;
    aLoadRepFromFile: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aDesigner: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    aViewPrewiev: TAction;
    N6: TMenuItem;
    aNewReport: TAction;
    aShowAllReports: TAction;
    RxSplitter1: TRxSplitter;
    GroupBox1: TGroupBox;
    aDelete: TAction;
    aNoVisibleReport: TAction;
    aCloseOpen: TAction;
    aPrint: TAction;
    aSaveToFile: TAction;
    aExport2PDF: TAction;
    aActualSize: TAction;
    aFitPage: TAction;
    aFitWidth: TAction;
    aExport2XLS: TAction;
    aExportGIF: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    aPrevious: TAction;
    aFirst: TAction;
    aNext: TAction;
    aLast: TAction;
    aPreviewEdit: TAction;
    aClearPreView: TAction;
    dsReport: TDataSource;
    StatusBar1: TStatusBar;
    aTruePreview: TAction;
    aLoadsFromFolder: TAction;
    aSelectedReport: TAction;
    aExp2Dir: TAction;
    aImp4Dir: TAction;
    pnl1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ToolButton8: TToolButton;
    ToolButton33: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton35: TToolButton;
    ToolButton34: TToolButton;
    ToolButton36: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    ToolButton10: TToolButton;
    ReportsTree: TDBGridEh;
    spl1: TSplitter;
    ImageList1: TImageList;
    procedure aNewCategoryExecute(Sender: TObject);
    procedure aSaveRepToFileExecute(Sender: TObject);
    procedure aLoadRepFromFileExecute(Sender: TObject);
    procedure aDesignerExecute(Sender: TObject);
    procedure aViewPrewievExecute(Sender: TObject);
    function frxDesignerSaveReport(Report: TfrxReport; SaveAs: Boolean): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure aNewReportExecute(Sender: TObject);
    procedure aNoVisibleReportExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aCloseOpenExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReportsTreeDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure dsReportDataChange(Sender: TObject; Field: TField);
    procedure aTruePreviewExecute(Sender: TObject);
    procedure aExp2DirExecute(Sender: TObject);
    procedure aImp4DirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FID_REPORT: Integer;
    FormPreview: TReportChild;
  public
    { Public declarations }
    // создает новый пустой отчет
    procedure NewEmptyReport(Sender: TObject);
    // создает новый отчет с ReportTitle, MasterData и PageFooter
    procedure NewReport(Sender: TObject);
    // копирует файлы каталога в одноименную категорию БД
    procedure CopyFiles2BD(const StartDir: string { каталог с отчетами };
      id_category: Integer { ID_REPORT категории } );
    (* ********************************************************************** *)
    (* БД от DataDrive определяет где находятся таблица для хранения отчетов *)
    (* DefaultDataBase определяет с какой БД отчеты работают *)
    (* ********************************************************************** *)
    property ID_REPORT: Integer read FID_REPORT write FID_REPORT;
  end;

var
  ReportDesignerForm: TReportDesignerForm;

implementation

uses
  System.IniFiles,
  FIBDatabase, FIBQuery, atrCmdUtils;

{$R *.dfm}

procedure TReportDesignerForm.aNewCategoryExecute(Sender: TObject);
var
  val: string;
  i: Integer;
begin
  if InputQuery(rsReportCategoryName, rsReportCategoryNameHint, val) then
    if dmMain.mtReportsTree.State = dsBrowse then
    begin
      if (dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull) then
        i := dmMain.mtReportsTree.FieldByName('ID_REPORT').AsInteger
      else
        i := dmMain.mtReportsTree.FieldByName('ID_PARENT').AsInteger;

      dmMain.mtReportsTree.Append;
      dmMain.mtReportsTree.FieldByName('REPORT_NAME').Value := val;
      dmMain.mtReportsTree.FieldByName('NO_VISIBLE').Value := 0;
      dmMain.mtReportsTree.FieldByName('ID_PARENT').Value := i;
      dmMain.mtReportsTree.Post;
      dmMain.mtReportsTree.DisableControls;
      dmMain.mtReportsTree.Close;
      dmMain.mtReportsTree.Open;
      dmMain.mtReportsTree.Last;
      dmMain.mtReportsTree.First;
      dmMain.mtReportsTree.Locate('REPORT_NAME;ID_PARENT', VarArrayOf([val, i]), []);
      dmMain.mtReportsTree.EnableControls;
    end;
end;

procedure TReportDesignerForm.aSaveRepToFileExecute(Sender: TObject);
begin
  // Сохранить в файл
  if dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull then
  begin
    ShowMessage(rsCategorySaveError);
    Exit;
  end;
  // имя файла как имя отчета
  SaveDialog1.FileName := dmMain.mtReportsTree.FieldByName('REPORT_NAME').AsString;
  if SaveDialog1.Execute then
    TBlobField(dmMain.mtReportsTree.FieldByName('REPORT_BODY')).SaveToFile(SaveDialog1.FileName);
end;

procedure TReportDesignerForm.aLoadRepFromFileExecute(Sender: TObject);
var
  rStream: TStream;
  id_parent: Integer;
  ReportName: string;
begin
  if not OpenDialog1.Execute then
    Exit;
  rStream := TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
  try
    if dmMain.mtReportsTree.State = dsBrowse then
    begin
      if dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull then
        id_parent := dmMain.mtReportsTree.FieldValues['ID_REPORT']
      else
        id_parent := dmMain.mtReportsTree.FieldValues['ID_PARENT'];
      ReportName := ExtractFileName(ChangeFileExt(OpenDialog1.FileName, ''));
      dmMain.mtReportsTree.Insert;
      dmMain.mtReportsTree.FieldValues['REPORT_NAME'] := ReportName;
      dmMain.mtReportsTree.FieldValues['NO_VISIBLE'] := 0;
      dmMain.mtReportsTree.FieldValues['ID_PARENT'] := id_parent;
      TBlobField(dmMain.mtReportsTree.FieldByName('REPORT_BODY')).LoadFromStream(rStream);
      dmMain.mtReportsTree.Post;
      dmMain.mtReportsTree.DisableControls;
      dmMain.mtReportsTree.Close;
      dmMain.mtReportsTree.Open;
      dmMain.mtReportsTree.Last;
      dmMain.mtReportsTree.First;
      dmMain.mtReportsTree.Locate('ID_PARENT;REPORT_NAME', VarArrayOf([id_parent, ReportName]), []);
      dmMain.mtReportsTree.EnableControls;
    end;
  finally
    rStream.Free;
  end;
end;

procedure TReportDesignerForm.aDesignerExecute(Sender: TObject);
var
  rStream: TStream;
begin
  if dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull then
    Exit;
  rStream := TMemoryStream.Create;
  try
    TBlobField(dmMain.mtReportsTree.FieldByName('REPORT_BODY')).SaveToStream(rStream);
    rStream.Position := 0;
    FormPreview.frxReport.LoadFromStream(rStream);
    FormPreview.frxReport.FileName := dmMain.mtReportsTree.FieldByName('REPORT_NAME').AsString;
  finally
    rStream.Free;
  end;

  FormPreview.frxReport.DesignReport; // (False);
end;

procedure TReportDesignerForm.aViewPrewievExecute(Sender: TObject);
begin
  if (dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull) or
    (dmMain.mtReportsTree.FieldByName('REPORT_BODY').AsString = '') then
    Exit;

  GroupBox1.Caption := Format(rsPreviewTitle, [dmMain.mtReportsTree.FieldByName('REPORT_NAME').AsString]);

  if (assigned(FormPreview.frxPreview) and (FormPreview.frxPreview.Visible)) then
  begin
    try
      FormPreview.frxPreview.SetFocus;
      FormPreview.REPORT_ID := dmMain.mtReportsTree.FieldByName('ID_REPORT').AsInteger;
      FormPreview.LoadReportBody;
      FormPreview.ShowReportBody;
    except
      FormPreview.Close;
    end;
  end;
end;

function TReportDesignerForm.frxDesignerSaveReport(Report: TfrxReport; SaveAs: Boolean): Boolean;
var
  rStream: TStream;
begin
  rStream := TMemoryStream.Create;
  try
    begin
      FormPreview.frxReport.SaveToStream(rStream);
      dmMain.mtReportsTree.Edit;
      TBlobField(dmMain.mtReportsTree.FieldByName('REPORT_BODY')).LoadFromStream(rStream);
      dmMain.mtReportsTree.Post;
      // SaveAs:=true;  // Зачем это?
      Result := true;
    end;
  finally
    rStream.Free;
  end;
end;

procedure TReportDesignerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportDesignerForm := Nil;
  Action := caFree;
end;

procedure TReportDesignerForm.FormCreate(Sender: TObject);
begin
  FormPreview := TReportChild.CreateAsPage(GroupBox1);
  FormPreview.actClose.Enabled := False;
  FormPreview.Parent := GroupBox1;
  FormPreview.Width := GroupBox1.ClientHeight;
  FormPreview.Height := GroupBox1.ClientHeight;
  FormPreview.Align := alClient;
  FormPreview.Show;
  // FormPreview.Visible := True;

  // DataDriver.SelectCommand.Params.ParamByName('IS_VISIBLE').Value:='and r.no_visible=0';
  dmMain.mtReportsTree.Active := true;
  dmMain.mtReportsTree.Last;
  dmMain.mtReportsTree.First;
  dmMain.frxDesigner.OnSaveReport := frxDesignerSaveReport;

  ReportsTree.PopupMenu := PopupMenu1;

  FID_REPORT := 0;
end;

procedure TReportDesignerForm.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  if assigned(FormPreview.frxPreview) then
    if (FormPreview.frxPreview.PageCount > 0) then
      FormPreview.frxPreview.MouseWheelScroll(WheelDelta, Shift, MousePos, False);
end;

procedure TReportDesignerForm.aNewReportExecute(Sender: TObject);
var
  rStream: TStream;
  id_parent: Integer;
  ReportName: string;
begin
  ReportName := rsNewReportName;
  if InputQuery(rsReportName, rsReportNameHint, ReportName) then
  begin
    rStream := TMemoryStream.Create;
    try
      if dmMain.mtReportsTree.State = dsBrowse then
      begin
        if dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull then
          id_parent := dmMain.mtReportsTree.FieldValues['ID_REPORT']
        else
          id_parent := dmMain.mtReportsTree.FieldValues['ID_PARENT'];
        dmMain.mtReportsTree.Append;
        dmMain.mtReportsTree.FieldValues['REPORT_NAME'] := ReportName;
        dmMain.mtReportsTree.FieldValues['NO_VISIBLE'] := 0;
        dmMain.mtReportsTree.FieldValues['ID_PARENT'] := id_parent;
        // создаем новый отчет и сохраняем в поток
        // NewEmptyReport(Sender);
        NewReport(Sender);
        FormPreview.frxReport.SaveToStream(rStream);
        rStream.Position := 0;
        // грузим в поле таблицы БД из потока
        TBlobField(dmMain.mtReportsTree.FieldByName('REPORT_BODY')).LoadFromStream(rStream);
        try
          dmMain.mtReportsTree.Post;
        except
          dmMain.mtReportsTree.Cancel;
          raise;
        end;
        dmMain.mtReportsTree.DisableControls;
        dmMain.mtReportsTree.Close;
        dmMain.mtReportsTree.Open;
        dmMain.mtReportsTree.Last;
        dmMain.mtReportsTree.First;
        dmMain.mtReportsTree.Locate('ID_PARENT;REPORT_NAME', VarArrayOf([id_parent, ReportName]), []);
        dmMain.mtReportsTree.EnableControls;
      end;
    finally
      rStream.Free;
    end;
  end;
end;

procedure TReportDesignerForm.NewEmptyReport(Sender: TObject); // создает новый отчет
var
  Page: TfrxReportPage;
begin
  { очищаем отчет }
  FormPreview.frxReport.Clear;
  { добавляем источник данных в список доступных для отчета }
  // frxReport1.DataSets.Add(frxDBDataSet1);
  { добавляем страницу "Данные" }
  // DataPage:=TfrxDataPage.Create(frxReport1);
  { добавляем страницу }
  Page := TfrxReportPage.Create(FormPreview.frxReport);
  { создаем уникальное имя }
  Page.CreateUniqueName;
  { устанавливаем размеры полей, бумаги и ориентацию по умолчанию }
  Page.SetDefaults;
end;

procedure TReportDesignerForm.NewReport(Sender: TObject); // создает новый отчет с ...
var
  // DataPage: TfrxDataPage;
  Page: TfrxReportPage;
  Band: TfrxBand;
  DataBand: TfrxMasterData;
  Memo: TfrxMemoView;
begin
  { очищаем отчет }
  FormPreview.frxReport.Clear;
  { добавляем страницу "Данные" }
  // DataPage:=TfrxDataPage.Create(frxReport1);
  { добавляем страницу }
  Page := TfrxReportPage.Create(FormPreview.frxReport);
  { создаем уникальное имя }
  Page.CreateUniqueName;
  { устанавливаем размеры полей, бумаги и ориентацию по умолчанию }
  Page.SetDefaults;

  { добавляем ReportTitle }
  Band := TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  { для бэнда достаточно установить координату Top и высоту }
  { обе координаты - в пикселах }
  Band.Top := 0;
  Band.Height := 20;
  { добавляем MasterData }
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  // DataBand.DataSet:=frxDBDataSet1;
  { координата Top не должна пересекать ранее добавленный бэнд! }
  DataBand.Top := 100;
  DataBand.Height := 20;
  { добавляем объект на master data }
  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  { выравниваем текст по правому краю объекта }
  Memo.Halign := haRight;
  // создает новый отчет с ReportTitle, MasterData и PageFooter
  { добавляем PageFooter }
  Band := TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.Top := 200;
  Band.Height := 20;
end;

procedure TReportDesignerForm.aNoVisibleReportExecute(Sender: TObject);
begin
  // cкрыть/показать отчет
  if not dmMain.mtReportsTree.FieldByName('NO_VISIBLE').AsBoolean then
    if MessageDlg(rsReporHide, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
  dmMain.mtReportsTree.Edit;
  try
    dmMain.mtReportsTree.FieldByName('NO_VISIBLE').AsBoolean := not dmMain.mtReportsTree.FieldByName('NO_VISIBLE')
      .AsBoolean;
    dmMain.mtReportsTree.Post;
    aCloseOpenExecute(Sender);
  except
    dmMain.mtReportsTree.Cancel;
    raise;
  end;
end;

procedure TReportDesignerForm.aDeleteExecute(Sender: TObject);
begin
  if dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull then
  begin
    if (MessageDlg(Format(rsRepordCategoryDelete, [dmMain.mtReportsTree.FieldByName('REPORT_NAME').AsString]),
      mtWarning, [mbYes, mbNo], 0) = mrYes) then
      dmMain.mtReportsTree.Delete;
  end
  else if (MessageDlg(Format(rsRepordDelete, [dmMain.mtReportsTree.FieldByName('REPORT_NAME').AsString]), mtWarning,
    [mbYes, mbNo], 0) = mrYes) then
    dmMain.mtReportsTree.Delete;

  aCloseOpenExecute(Sender);
end;

procedure TReportDesignerForm.aCloseOpenExecute(Sender: TObject);
begin
  // ID:=dmMain.mtReportsTree.FieldByName('ID_REPORT').Value;
  dmMain.mtReportsTree.Close;
  dmMain.mtReportsTree.Open;
  dmMain.mtReportsTree.Last;
  dmMain.mtReportsTree.First;
  // if ID<>NULL then dmMain.mtReportsTree.Locate('ID_REPORT', ID, [])
end;

procedure TReportDesignerForm.FormDestroy(Sender: TObject);
begin
  try
    // TODO: Не понятно с закрытием дизайнера отчетов. ошибка
    if assigned(FormPreview) then
      FreeAndNil(FormPreview);
  finally
    //
  end;
end;

procedure TReportDesignerForm.ReportsTreeDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumnEh; State: TGridDrawState);
begin
  // ReportsTree.Canvas.Font.Size:=Column.Font.Size;
  if assigned(dmMain) then
  begin
    if dmMain.mtReportsTree.FieldByName('NO_VISIBLE').AsBoolean then // Скрытые отчеты
      ReportsTree.Canvas.Font.Color := clGrayText
    else
      ReportsTree.Canvas.Font.Color := clWindowText;
    if not dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull then // Отчеты
      ReportsTree.Canvas.Font.Style := ReportsTree.Canvas.Font.Style + [fsUnderline]
    else
    begin
      ReportsTree.Canvas.Font.Style := ReportsTree.Canvas.Font.Style + [fsBold]; // категории
      // ReportsTree.Canvas.Font.Size:=ReportsTree.Canvas.Font.Size+2;
    end;
  end;

  ReportsTree.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TReportDesignerForm.dsReportDataChange(Sender: TObject; Field: TField);
begin
  if dmMain.mtReportsTree.Active then
  begin
    StatusBar1.Panels[0].Text := dmMain.mtReportsTree.FieldByName('ID_REPORT').AsString;
    // FID_REPORT:=dmMain.mtReportsTree.FieldByName('ID_REPORT').AsInteger;
  end;
end;

procedure TReportDesignerForm.aTruePreviewExecute(Sender: TObject);
begin
  if dmMain.mtReportsTree.FieldByName('REPORT_BODY').IsNull then
    Exit;

  FormPreview.REPORT_ID := dmMain.mtReportsTree.FieldByName('ID_REPORT').AsInteger;

end;

procedure TReportDesignerForm.aExp2DirExecute(Sender: TObject);
var
  StartDir (* имя стартового каталога *) , FullFileName (* полное имя файла *) ,
    DirName (* имя каталога отчета *) : string;
begin
  // создание стартовой директории
  // StartDir:='D:\test_fr';
  if SelectDirectory(rsSelectFolder, StartDir, StartDir) then
  begin

    if not System.SysUtils.DirectoryExists(StartDir) then
      CreateDir(StartDir);

    dmMain.mtReportsTree.Close;
    // DataDriver.SelectCommand.Params.ParamByName('IS_VISIBLE').Value:='';
    dmMain.mtReportsTree.Open;
    dmMain.mtReportsTree.Last;
    dmMain.mtReportsTree.First;
    dmMain.qCommon.SQL.Text := 'select fn.full_name from get_fullname_report(:id_report, ''\'') fn';
    try
      dmMain.qCommon.Prepare;
      while not dmMain.mtReportsTree.Eof do
      begin

        dmMain.qCommon.ParamByName('ID_REPORT').Value := dmMain.mtReportsTree.FieldByName('ID_REPORT').Value;
        dmMain.qCommon.ExecQuery;
        FullFileName := StartDir + '\' + dmMain.qCommon.FieldByName('FULL_NAME').AsString;

        if dmMain.mtReportsTree.FieldByName('REPORT_BODY').AsString = '' then
        begin
          if not System.SysUtils.DirectoryExists(FullFileName) then
            if not System.SysUtils.ForceDirectories(FullFileName) then
              raise Exception.Create(Format(rsErrorCrateDirectory, [FullFileName]));
        end
        else
        begin
          // вычисление полного имени отчета
          FullFileName := FullFileName + '.fr3';
          DirName := ExtractFilePath(FullFileName);
          if not System.SysUtils.DirectoryExists(DirName) then
            if not System.SysUtils.ForceDirectories(DirName) then
              raise Exception.Create(Format(rsErrorCrateDirectory, [DirName]));
          try
            TBlobField(dmMain.mtReportsTree.FieldByName('REPORT_BODY')).SaveToFile(FullFileName);
          except
            on E: Exception do
              MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
          // установка атрубута скрытый файл если отчет скрыт
          if FileExists(FullFileName) then
          begin
{$IFDEF MSWINDOWS}
{$WARN SYMBOL_PLATFORM OFF}
            if dmMain.mtReportsTree.FieldByName('no_visible').AsBoolean then
              SetFileAttributes(PChar(FullFileName), faHidden);
{$WARN SYMBOL_PLATFORM ON}
{$ENDIF}
          end
          else
            MessageDlg(Format(rsFileNotFoundWT, [FullFileName]), mtWarning, [mbOK], 0);
        end;

        dmMain.mtReportsTree.Next;
      end;
      if (MessageDlg(Format(rsSaveReportsAsFiles, [StartDir]), mtInformation, [mbYes, mbNo], 0) = mrYes) then
        atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', StartDir);
    finally
      dmMain.qCommon.Close;
    end;
  end;
end;

procedure TReportDesignerForm.aImp4DirExecute(Sender: TObject);
var
  StartDir: string; (* имя стартового каталога *)
  inRep: Integer;
begin
  if SelectDirectory(rsSelectReportsDir, StartDir, StartDir) then
  begin
    CopyFiles2BD(StartDir, 0);
    // Обновим все отчеты в невидимые если он не в каталоге InMENU
    inRep := -1;
    try
      dmMain.qCommon.SQL.Text := 'select r.id_report from reports r where upper(r.report_name) = ''INMENU''';
      dmMain.qCommon.ExecQuery;
      if not dmMain.qCommon.FieldByName('ID_REPORT').IsNull then
        inRep := dmMain.qCommon.FieldByName('ID_REPORT').AsInteger;
    finally
      dmMain.qCommon.Close;
    end;
    if inRep <> -1 then
    begin
      dmMain.Query.SQL.Text := 'execute block as begin';
      dmMain.Query.SQL.Add('update reports r set r.NO_VISIBLE = 1 where r.ID_PARENT = 0;');
      dmMain.Query.SQL.Add('update reports r set r.ID_PARENT = 0 where r.ID_PARENT = ' + IntToStr(inRep) + ';');
      dmMain.Query.SQL.Add('delete from reports r where r.id_report = ' + IntToStr(inRep) + ';');
      dmMain.Query.SQL.Add('end');
      dmMain.Query.Transaction.StartTransaction;
      dmMain.Query.ExecQuery;
      dmMain.Query.Transaction.Commit;
    end;
    dmMain.fdsReport.Close;
    dmMain.mtReportsTree.Close;
    dmMain.mtReportsTree.Open;
    dmMain.mtReportsTree.Last;
    dmMain.mtReportsTree.First;
    MessageDlg(rsReportsLoaded, mtInformation, [mbOK], 0);
  end;
end;

procedure TReportDesignerForm.CopyFiles2BD(const StartDir: string; id_category: Integer);
var
  ID_REPORT: Variant;
  sr: TSearchRec;
  rStream: TStream;
  i: Integer;
begin
  i := 0;
  if FindFirst(StartDir + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Name = '.') or (sr.Name = '..') then
        Continue;
      if not dmMain.fdsReport.Active then
        dmMain.fdsReport.Open;
      if ((sr.Attr and faDirectory) <> faDirectory) then
      begin // файлы
        if AnsiUpperCase(ExtractFileExt(sr.Name)) = '.FR3' then
        begin
          // ищем похожий
          try
            dmMain.qCommon.SQL.Text := 'select r.id_report from reports r ' + 'where r.id_parent = ' +
              IntToStr(id_category) + ' ' + ' and r.report_body is not null' + ' and upper(r.report_name) = upper(''' +
              ChangeFileExt(sr.Name, '') + ''')';
            dmMain.qCommon.ExecQuery;
            ID_REPORT := dmMain.qCommon.FieldByName('ID_REPORT').Value;
          finally
            dmMain.qCommon.Close;
          end;
          // отчет вставляем в БД
          if ID_REPORT = NULL then // нет отчета
            dmMain.fdsReport.Insert
          else
          begin
            dmMain.fdsReport.ParamByName('ID_REPORT').Value := ID_REPORT;
            dmMain.fdsReport.CloseOpen(False);
            dmMain.fdsReport.Edit;
          end;
          dmMain.fdsReport.FieldByName('REPORT_NAME').Value := ChangeFileExt(sr.Name, '');
{$IFDEF MSWINDOWS}
{$WARN SYMBOL_PLATFORM OFF}
          dmMain.fdsReport.FieldByName('NO_VISIBLE').AsBoolean := (sr.Attr and faHidden) = faHidden;
{$WARN SYMBOL_PLATFORM ON}
{$ENDIF}
          dmMain.fdsReport.FieldByName('ID_PARENT').Value := id_category;
          // тело отчета
          rStream := TFileStream.Create(StartDir + '\' + sr.Name, fmOpenRead);
          try
            TBlobField(dmMain.fdsReport.FieldByName('REPORT_BODY')).LoadFromStream(rStream);
          finally
            rStream.Free;
          end;
          try
            dmMain.fdsReport.Post;
          except
            on E: Exception do
              MessageDlg(E.Message, mtWarning, [mbOK], 0);
          end;
          StatusBar1.Panels[1].Text := 'Отчет ' + sr.Name;
        end;
      end
      else
      begin // каталоги
        // ищем категорию
        try
          dmMain.qCommon.SQL.Text := 'select r.id_report from reports r ' + 'where upper(r.report_name) = upper(''' +
            sr.Name + ''')' + ' and r.report_body is null';
          if id_category = 0 then // самая начальная категория
            dmMain.qCommon.SQL.Add('  and ((r.id_parent = 0) or (r.id_parent is null))');
          dmMain.qCommon.ExecQuery;
          ID_REPORT := dmMain.qCommon.FieldByName('ID_REPORT').Value;
        finally
          dmMain.qCommon.Close;
        end;
        (* Не использована mtReportsTree из-за тупой (!!!) ошибки при вставке:
          Can not delete Record if it present in active list. *)
        // не нашли - создаем
        if ID_REPORT = NULL then
        begin
          dmMain.fdsReport.Insert;
          dmMain.fdsReport.FieldByName('REPORT_NAME').Value := sr.Name;
          dmMain.fdsReport.FieldByName('ID_PARENT').Value := id_category;
          ID_REPORT := dmMain.fdsReport.FieldByName('ID_REPORT').Value;
        end
        else
          dmMain.fdsReport.Edit;
{$IFDEF MSWINDOWS}
{$WARN SYMBOL_PLATFORM OFF}
        dmMain.fdsReport.FieldByName('NO_VISIBLE').AsBoolean := (sr.Attr and faHidden) = faHidden;
{$WARN SYMBOL_PLATFORM ON}
{$ENDIF}
        dmMain.fdsReport.Post;
        // рекурсия в каталог
        CopyFiles2BD(StartDir + '\' + sr.Name, ID_REPORT);
        StatusBar1.Panels[1].Text := rsChange + sr.Name;
      end;
      if (i mod 100) = 0 then
        Application.ProcessMessages;
      i := i + 1;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

end.
