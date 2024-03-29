﻿unit SelectOneForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TSelectOneForm = class(TForm)
    pnlBottom: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dbgSelect: TDBGridEh;
    srcSelect: TDataSource;
    procedure dbgSelectDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectOneForm: TSelectOneForm;

implementation

{$R *.dfm}

procedure TSelectOneForm.dbgSelectDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
