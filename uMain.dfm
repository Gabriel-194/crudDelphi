object crud: Tcrud
  Left = 0
  Top = 0
  Caption = 'crud'
  ClientHeight = 555
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object EscolhaOpcao: TLabel
    Left = 288
    Top = 48
    Width = 227
    Height = 21
    Caption = 'Escolha uma das op'#231#245'es a seguir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnAlunos: TButton
    Left = 304
    Top = 112
    Width = 201
    Height = 25
    Caption = 'aluno'
    TabOrder = 0
    OnClick = btnAlunosClick
  end
  object btnProfessor: TButton
    Left = 304
    Top = 160
    Width = 201
    Height = 25
    Caption = 'Professor'
    TabOrder = 1
    OnClick = btnProfessorClick
  end
end
