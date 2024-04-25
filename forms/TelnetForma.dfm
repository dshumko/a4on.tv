object TelnetForm: TTelnetForm
  Left = 0
  Top = 0
  Caption = 'Telnet'
  ClientHeight = 301
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlControl: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 61
    Align = alTop
    TabOrder = 0
    DesignSize = (
      584
      61)
    object HostLabel: TLabel
      Left = 8
      Top = 11
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object InfoLabel: TLabel
      Left = 337
      Top = 35
      Width = 64
      Height = 13
      Caption = 'Disconnected'
    end
    object PortLabel: TLabel
      Left = 184
      Top = 11
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object lbl6: TLabel
      Left = 407
      Top = 11
      Width = 19
      Height = 13
      Caption = 'EOL'
    end
    object HostEdit: TEdit
      Left = 40
      Top = 8
      Width = 137
      Height = 21
      TabOrder = 0
      Text = '172.16.2.135'
    end
    object ConnectButton: TButton
      Left = 264
      Top = 8
      Width = 65
      Height = 21
      Caption = '&Connect'
      TabOrder = 2
      OnClick = ConnectButtonClick
    end
    object DisconnectButton: TButton
      Left = 336
      Top = 8
      Width = 65
      Height = 21
      Caption = '&Disconnect'
      Enabled = False
      TabOrder = 3
      OnClick = DisconnectButtonClick
    end
    object PortEdit: TEdit
      Left = 208
      Top = 8
      Width = 41
      Height = 21
      TabOrder = 1
      Text = 'telnet'
    end
    object DataEdit: TEdit
      Left = 40
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 6
      Text = '9kpNQzsad11S'
    end
    object SendButton: TButton
      Left = 264
      Top = 32
      Width = 65
      Height = 21
      Caption = '&Send'
      Enabled = False
      TabOrder = 7
      OnClick = SendButtonClick
    end
    object btnClose: TButton
      Left = 487
      Top = 8
      Width = 91
      Height = 45
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 1
      TabOrder = 5
      OnClick = btnCloseClick
    end
    object cbbEOL: TDBComboBoxEh
      Left = 432
      Top = 8
      Width = 49
      Height = 21
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        '\r\n'
        '\n\r'
        '\n'
        '\r')
      KeyItems.Strings = (
        '0'
        '1'
        '2'
        '3')
      ShowHint = True
      TabOrder = 4
      Text = '\r\n'
      Visible = True
      OnChange = cbbEOLChange
    end
  end
  object DisplayMemo: TDBMemoEh
    Left = 0
    Top = 61
    Width = 584
    Height = 240
    ScrollBars = ssBoth
    Align = alClient
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ShowHint = True
    TabOrder = 1
    Visible = True
    WantReturns = True
    OnKeyDown = DisplayMemoKeyDown
    OnKeyPress = DisplayMemoKeyPress
  end
  object actlst1: TActionList
    Left = 73
    Top = 92
    object actShowControl: TAction
      Caption = 'actShowControl'
      ShortCut = 49235
      OnExecute = actShowControlExecute
    end
  end
  object PropStorageEh: TPropStorageEh
    Section = 'TELNET'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.ActiveControl'
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 191
    Top = 128
  end
end
