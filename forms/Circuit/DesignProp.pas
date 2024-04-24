unit DesignProp;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  SimpleGraph;

type
  TDesignerProperties = class(TForm)
    Grid: TGroupBox;
    ShowGrid: TCheckBox;
    Label1: TLabel;
    SnapToGrid: TCheckBox;
    Colors: TGroupBox;
    Label2: TLabel;
    DesignerBackgroundColor: TPanel;
    Label3: TLabel;
    DesignerMarkerColor: TPanel;
    Label4: TLabel;
    DesignerGridColor: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    Bevel1: TBevel;
    ColorDialog: TColorDialog;
    btnApply: TButton;
    Edit1: TEdit;
    GridSize: TUpDown;
    BackgroundColor: TShape;
    MarkerColor: TShape;
    GridColor: TShape;
    procedure DesignerBackgroundColorClick(Sender: TObject);
    procedure DesignerMarkerColorClick(Sender: TObject);
    procedure DesignerGridColorClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fsg: TSimpleGraph;
    procedure ApplyChanges;
  public
    class function Execute(SimpleGraph: TSimpleGraph): Boolean;
  end;

implementation

{$R *.dfm}

{ TDesignerProperties }

class function TDesignerProperties.Execute(SimpleGraph: TSimpleGraph): Boolean;
begin
  Result := False;
  with Create(Application) do
    try
      Fsg := SimpleGraph;
      GridSize.Min := Low(TGridSize);
      GridSize.Max := High(TGridSize);
      SnapToGrid.Checked := SimpleGraph.SnapToGrid;
      ShowGrid.Checked := SimpleGraph.ShowGrid;
      GridSize.Position := SimpleGraph.GridSize;
      BackgroundColor.Brush.Color := SimpleGraph.Color;
      MarkerColor.Brush.Color := SimpleGraph.MarkerColor;
      GridColor.Brush.Color := SimpleGraph.GridColor;
      if ShowModal = mrOK then
      begin
        ApplyChanges;
        Result := True;
      end;
    finally
      Free;
    end;
end;

procedure TDesignerProperties.ApplyChanges;
begin
  Fsg.BeginUpdate;
  try
    Fsg.SnapToGrid := SnapToGrid.Checked;
    Fsg.ShowGrid := ShowGrid.Checked;
    Fsg.GridSize := GridSize.Position;
    Fsg.Color := BackgroundColor.Brush.Color;
    Fsg.MarkerColor := MarkerColor.Brush.Color;
    Fsg.GridColor := GridColor.Brush.Color;
  finally
    Fsg.EndUpdate;
  end;
end;

procedure TDesignerProperties.DesignerBackgroundColorClick(Sender: TObject);
begin
  ColorDialog.Color := BackgroundColor.Brush.Color;
  if ColorDialog.Execute then
    BackgroundColor.Brush.Color := ColorDialog.Color;
end;

procedure TDesignerProperties.DesignerMarkerColorClick(Sender: TObject);
begin
  ColorDialog.Color := MarkerColor.Brush.Color;
  if ColorDialog.Execute then
    MarkerColor.Brush.Color := ColorDialog.Color;
end;

procedure TDesignerProperties.DesignerGridColorClick(Sender: TObject);
begin
  ColorDialog.Color := GridColor.Brush.Color;
  if ColorDialog.Execute then
    GridColor.Brush.Color := ColorDialog.Color;
end;

procedure TDesignerProperties.btnApplyClick(Sender: TObject);
begin
  ApplyChanges;
end;

procedure TDesignerProperties.FormCreate(Sender: TObject);
begin
  SetBounds(Screen.Width - Width - 30, 50, Width, Height);
end;

end.
