program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {crud},
  uAluno in 'uAluno.pas',
  uProfessor in 'uProfessor.pas',
  uDisciplina in 'uDisciplina.pas',
  uTurma in 'uTurma.pas',
  uMatricula in 'uMatricula.pas',
  uAlunoCadastro in 'uAlunoCadastro.pas' {frmAlunoCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tcrud, crud);
  Application.CreateForm(TfrmAlunoCadastro, frmAlunoCadastro);
  Application.Run;
end.
