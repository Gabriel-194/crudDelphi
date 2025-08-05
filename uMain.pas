unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAluno, uProfessor, uDisciplina, uTurma, uMatricula,
  Vcl.ExtCtrls, uAlunoCadastro, uProfessorCadastro;

type
  Tcrud = class(TForm)
    EscolhaOpcao: TLabel;
    btnAlunos: TButton;
    btnProfessor: TButton;
    procedure btnAlunosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProfessorClick(Sender: TObject);
    private

  public
      listaAluno: TStringList;
      listaProfessor: TStringList;

  end;

var
  crud: Tcrud;

implementation

{$R *.dfm}



procedure Tcrud.FormCreate(Sender: TObject);
begin
  listaAluno := TStringList.Create;
  listaProfessor := TStringList.Create;
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

procedure Tcrud.btnProfessorClick(Sender: TObject);
 var
  formProfessor : TfrmProfessorCadastro;
begin
  formProfessor := TfrmProfessorCadastro.create(nil);
  try
    formProfessor.lista := self.listaProfessor;
    formProfessor.ShowModal;
  finally
    formProfessor.free;
  end;
end;



end.
