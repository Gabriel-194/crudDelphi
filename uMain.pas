unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAluno, uProfessor, uDisciplina, uTurma, uMatricula,
  Vcl.ExtCtrls;

type
  Tcrud = class(TForm)
    EscolhaOpcao: TLabel;
    btnAlunos: TButton;
    procedure btnAlunosClick(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  crud: Tcrud;
  ListaAluno: TStringList;

implementation

{$R *.dfm}



{ Tcrud }


procedure Tcrud.btnAlunosClick(Sender: TObject);
begin
  TAluno.Create;
  aluno = new TAluno;

end;

end.
