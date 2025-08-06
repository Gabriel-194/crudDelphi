unit uProfessorCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uProfessor, dataBase;

type
  TfrmProfessorCadastro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    btnAdicionar: TButton;
    lsvProfessor: TListView;
    btnListar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    edtCpf: TEdit;
    Label3: TLabel;

    procedure btnAdicionarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProfessorCadastro: TfrmProfessorCadastro;

implementation

{$R *.dfm}


procedure TfrmProfessorCadastro.btnAdicionarClick(Sender: TObject);
var
  professor: TProfessor;
  codigo: Integer;
begin
  professor := TProfessor.Create;
  try
    codigo := StrToIntDef(edtCodigo.Text, 0);

    professor.setCodigo(codigo);
    professor.setNome(edtNome.Text);
    professor.setCPF(edtCpf.Text);
    professor.adicionar(DataModule1.FDConnection1);

    ShowMessage('Professor cadastrado com sucesso!');

    edtCodigo.Clear;
    edtNome.Clear;
    edtCPF.Clear;
    edtCodigo.SetFocus;
  finally
    professor.Free;
  end;
end;



end.
