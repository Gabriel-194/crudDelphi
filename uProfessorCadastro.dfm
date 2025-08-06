object frmProfessorCadastro: TfrmProfessorCadastro
  Left = 0
  Top = 0
  Caption = 'frmProfessorCadastro'
  ClientHeight = 532
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 88
    Top = 80
    Width = 45
    Height = 15
    Caption = 'Codigo :'
  end
  object Label2: TLabel
    Left = 248
    Top = 80
    Width = 39
    Height = 15
    Caption = 'Nome :'
  end
  object Label3: TLabel
    Left = 408
    Top = 80
    Width = 27
    Height = 15
    Caption = 'CPF :'
  end
  object edtCodigo: TEdit
    Left = 88
    Top = 101
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 248
    Top = 101
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object btnAdicionar: TButton
    Left = 88
    Top = 192
    Width = 75
    Height = 25
    Caption = 'adicionar'
    TabOrder = 2
    OnClick = btnAdicionarClick
  end
  object lsvProfessor: TListView
    Left = 224
    Top = 192
    Width = 361
    Height = 201
    Columns = <
      item
        Caption = 'codigo'
        Width = 80
      end
      item
        Caption = 'nome'
        Width = 200
      end
      item
        Caption = 'cpf'
        Width = 80
      end>
    TabOrder = 3
    ViewStyle = vsReport
  end
  object btnListar: TButton
    Left = 88
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 4
    OnClick = btnListarClick
  end
  object btnEditar: TButton
    Left = 88
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 5
    OnClick = btnEditarClick
  end
  object btnExcluir: TButton
    Left = 88
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
    OnClick = btnExcluirClick
  end
  object edtCpf: TEdit
    Left = 408
    Top = 101
    Width = 121
    Height = 23
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 694
    Height = 92
    Align = alBottom
    TabOrder = 8
    Visible = False
    object Label5: TLabel
      Left = 72
      Top = 24
      Width = 39
      Height = 15
      Caption = 'Nome :'
    end
    object Label6: TLabel
      Left = 248
      Top = 24
      Width = 27
      Height = 15
      Caption = 'CPF :'
    end
    object edtEditarNome: TEdit
      Left = 72
      Top = 45
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object edtEditarCpf: TEdit
      Left = 248
      Top = 45
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object btnConfirmar: TButton
      Left = 552
      Top = 32
      Width = 75
      Height = 25
      Caption = 'confirmar'
      TabOrder = 2
      OnClick = btnConfirmarClick
    end
  end
end
