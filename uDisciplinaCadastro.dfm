object frmDisciplinaCadastro: TfrmDisciplinaCadastro
  Left = 0
  Top = 0
  Caption = 'frmDisciplinacadastro'
  ClientHeight = 521
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 88
    Top = 72
    Width = 39
    Height = 15
    Caption = 'Nome :'
  end
  object edtNome: TEdit
    Left = 88
    Top = 93
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object btnAdicionar: TButton
    Left = 88
    Top = 168
    Width = 75
    Height = 25
    Caption = 'adicionar'
    TabOrder = 1
    OnClick = btnAdicionarClick
  end
  object btnEditar: TButton
    Left = 88
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
    OnClick = btnEditarClick
  end
  object btnExcluir: TButton
    Left = 88
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btnExcluirClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 439
    Width = 729
    Height = 82
    Align = alBottom
    TabOrder = 4
    object Label5: TLabel
      Left = 56
      Top = 19
      Width = 34
      Height = 15
      Caption = 'nome:'
    end
    object edtEditarNome: TEdit
      Left = 56
      Top = 40
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object btnConfirmar: TButton
      Left = 464
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
  end
  object lsvDisciplina: TListView
    Left = 248
    Top = 154
    Width = 281
    Height = 201
    Columns = <
      item
        Caption = 'codigo'
        Width = 80
      end
      item
        Caption = 'nome'
        Width = 200
      end>
    GridLines = True
    TabOrder = 5
    ViewStyle = vsReport
  end
  object btnListar: TButton
    Left = 88
    Top = 209
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 6
    OnClick = btnListarClick
  end
end
