unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAluno, uProfessor, uDisciplina, uTurma, uMatricula,
  Vcl.ExtCtrls, uAlunoCadastro;

type
  Tcrud = class(TForm)
    EscolhaOpcao: TLabel;
    btnAlunos: TButton;
    procedure btnAlunosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    private
      listaAluno: TStringList;

  public

  end;

var
  crud: Tcrud;

implementation

{$R *.dfm}

procedure Tcrud.FormCreate(Sender: TObject);
begin
  listaAluno := TStringList.Create;
end;


procedure Tcrud.btnAlunosClick(Sender: TObject);
var
  formAluno: TfrmAlunoCadastro;
begin
  formAluno := TfrmAlunoCadastro.Create(nil);
  try
    formAluno.lista := self.listaAluno;
    formAluno.ShowModal;
  finally
    formAluno.Free;
  end;
end;



end.
