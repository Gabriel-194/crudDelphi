object frmAlunoCadastro: TfrmAlunoCadastro
  Left = 0
  Top = 0
  Caption = 'cadastro de aluno'
  ClientHeight = 506
  ClientWidth = 662
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
  object Label1: TLabel
    Left = 296
    Top = 72
    Width = 24
    Height = 15
    Caption = 'CPF:'
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
  object edtCpf: TEdit
    Left = 296
    Top = 93
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 424
    Width = 662
    Height = 82
    Align = alBottom
    TabOrder = 5
    object Label5: TLabel
      Left = 56
      Top = 19
      Width = 34
      Height = 15
      Caption = 'nome:'
    end
    object Label6: TLabel
      Left = 225
      Top = 19
      Width = 20
      Height = 15
      Caption = 'cpf:'
    end
    object edtEditarNome: TEdit
      Left = 56
      Top = 40
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object edtEditarCpf: TEdit
      Left = 225
      Top = 40
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object btnConfirmar: TButton
      Left = 464
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 2
      OnClick = btnConfirmarClick
    end
  end
  object lsvAluno: TListView
    Left = 248
    Top = 154
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
    GridLines = True
    TabOrder = 6
    ViewStyle = vsReport
  end
  object btnListar: TButton
    Left = 88
    Top = 209
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 7
    OnClick = btnListarClick
  end
end
