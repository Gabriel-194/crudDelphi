program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {crud},
  uAluno in 'uAluno.pas',
  uProfessor in 'uProfessor.pas',
  uDisciplina in 'uDisciplina.pas',
  uTurma in 'uTurma.pas',
  uMatricula in 'uMatricula.pas',
  uAlunoCadastro in 'uAlunoCadastro.pas' {frmAlunoCadastro},
  uProfessorCadastro in 'uProfessorCadastro.pas' {frmProfessorCadastro},
  dataBase in 'dataBase.pas' {DataModule1: TDataModule},
  uDisciplinaCadastro in 'uDisciplinaCadastro.pas' {frmDisciplinaCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tcrud, crud);
  Application.CreateForm(TfrmAlunoCadastro, frmAlunoCadastro);
  Application.CreateForm(TfrmProfessorCadastro, frmProfessorCadastro);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmDisciplinaCadastro, frmDisciplinaCadastro);
  Application.Run;
end.
