object frmAlunoCadastro: TfrmAlunoCadastro
  Left = 0
  Top = 0
  Caption = 'cadastro de aluno'
  ClientHeight = 441
  ClientWidth = 624
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
    Width = 37
    Height = 15
    Caption = 'codigo'
  end
  object Label2: TLabel
    Left = 272
    Top = 80
    Width = 31
    Height = 15
    Caption = 'nome'
  end
  object edtCodigo: TEdit
    Left = 88
    Top = 112
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'edtCodigo'
  end
  object edtNome: TEdit
    Left = 272
    Top = 112
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'edtCodigo'
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
  object lsvAlunos: TListView
    Left = 296
    Top = 184
    Width = 305
    Height = 185
    Columns = <
      item
        Caption = 'codigo'
        Width = 80
      end
      item
        Caption = 'nome'
        Width = 250
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
    Caption = 'btnEditar'
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
end
