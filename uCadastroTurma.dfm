object uTurmaCadastro: TuTurmaCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro Turma'
  ClientHeight = 514
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 291
    Height = 15
    Caption = 'digite o codigo do professor desejado para essa turma :'
  end
  object Label3: TLabel
    Left = 344
    Top = 40
    Width = 333
    Height = 15
    Caption = 'digite o codigo da disciplina que deseja adicionar nessa turma :'
  end
  object edtCodigoDisciplina: TEdit
    Left = 344
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object btnAdicionar: TButton
    Left = 88
    Top = 154
    Width = 75
    Height = 25
    Caption = 'adicionar'
    TabOrder = 1
    OnClick = btnAdicionarClick
  end
  object lsvTurma: TListView
    Left = 248
    Top = 154
    Width = 369
    Height = 201
    Columns = <
      item
        Caption = 'Codigo'
        Width = 80
      end
      item
        Caption = 'Codigo professor'
        Width = 200
      end
      item
        Caption = 'Codigo Disciplina '
        Width = 80
      end>
    GridLines = True
    Items.ItemData = {050000000000000000}
    TabOrder = 2
    ViewStyle = vsReport
  end
  object btnEditar: TButton
    Left = 88
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 3
    OnClick = btnEditarClick
  end
  object btnExcluir: TButton
    Left = 88
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = btnExcluirClick
  end
  object edtCodigoProfessor: TEdit
    Left = 24
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 693
    Height = 92
    Align = alBottom
    TabOrder = 6
    Visible = False
    object Label5: TLabel
      Left = 72
      Top = 24
      Width = 95
      Height = 15
      Caption = 'codigo professor :'
    end
    object Label6: TLabel
      Left = 248
      Top = 24
      Width = 98
      Height = 15
      Caption = 'Codigo disciplina :'
    end
    object edtEditarCodigoProfessor: TEdit
      Left = 72
      Top = 45
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object edtEditarCodigoDisciplina: TEdit
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
  object Listar: TButton
    Left = 88
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 7
    OnClick = ListarClick
  end
end
