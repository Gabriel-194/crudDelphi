unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAluno, uProfessor, uDisciplina, uTurma, uMatricula,
  Vcl.ExtCtrls, uAlunoCadastro, uProfessorCadastro, uDisciplinaCadastro, uCadastroTurma, uCadastroMatricula,
  Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  Tcrud = class(TForm)
    EscolhaOpcao: TLabel;
    btnAlunos: TButton;
    btnProfessor: TButton;
    btnDisciplina: TButton;
    ImageList1: TImageList;
    btnTurma: TButton;
    btnMatricula: TButton;
    procedure btnAlunosClick(Sender: TObject);
    procedure btnProfessorClick(Sender: TObject);
    procedure btnDisciplinaClick(Sender: TObject);
    procedure btnTurmaClick(Sender: TObject);
    procedure btnMatriculaClick(Sender: TObject);


  end;

var
  crud: Tcrud;

implementation

{$R *.dfm}



procedure Tcrud.btnAlunosClick(Sender: TObject);
 var
  formAluno : TfrmAlunoCadastro;
begin
  formAluno := TfrmAlunoCadastro.create(nil);
  try
    formAluno.ShowModal;
  finally
    formAluno.free;
  end;
end;

procedure Tcrud.btnProfessorClick(Sender: TObject);
 var
  formProfessor : TfrmProfessorCadastro;
begin
  formProfessor := TfrmProfessorCadastro.create(nil);
  try
    formProfessor.ShowModal;
  finally
    formProfessor.free;
  end;
end;


procedure Tcrud.btnTurmaClick(Sender: TObject);
var formTurma : TuTurmaCadastro;
begin
  formTurma := TuTurmaCadastro.Create(nil);
  try
    formTurma.ShowModal;
  finally
    formTurma.free;
  end;

end;

procedure Tcrud.btnDisciplinaClick(Sender: TObject);
var
  formDisciplina : TfrmDisciplinaCadastro;
begin
  formDisciplina := TfrmDisciplinaCadastro.create(nil);
  try
    formDisciplina.ShowModal;
  finally
    formDisciplina.free;
  end;

end;





procedure Tcrud.btnMatriculaClick(Sender: TObject);
var
 formMatricula : TfrmCadastroMatriculas;
begin
  formMatricula := TfrmCadastroMatriculas.Create(nil);
  try
    formMatricula.ShowModal;
  finally
    formMatricula.Free;
  end;
end;

end.
