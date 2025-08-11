object frmCadastroMatriculas: TfrmCadastroMatriculas
  Left = 0
  Top = 0
  Caption = 'menu de matriculas'
  ClientHeight = 530
  ClientWidth = 690
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
    Width = 302
    Height = 15
    Caption = 'digite o codigo do aluno desejado para fazer a matricula :'
  end
  object Label3: TLabel
    Left = 349
    Top = 40
    Width = 286
    Height = 15
    Caption = 'digite o codigo da turma que deseja fazer a matricula :'
  end
  object edtCodigoTurma: TEdit
    Left = 349
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
  object lsvMatricula: TListView
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
        Caption = 'Codigo aluno'
        Width = 200
      end
      item
        Caption = 'Codigo turma '
        Width = 80
      end>
    GridLines = True
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
  object edtCodigoAluno: TEdit
    Left = 24
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 438
    Width = 690
    Height = 92
    Align = alBottom
    TabOrder = 6
    Visible = False
    ExplicitLeft = -69
    ExplicitTop = 349
    ExplicitWidth = 693
    object Label5: TLabel
      Left = 72
      Top = 24
      Width = 76
      Height = 15
      Caption = 'codigo aluno :'
    end
    object Label6: TLabel
      Left = 248
      Top = 24
      Width = 80
      Height = 15
      Caption = 'Codigo turma :'
    end
    object edtEditarCodigoAluno: TEdit
      Left = 72
      Top = 45
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object edtEditarCodigoTurma: TEdit
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
