unit uAlunoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAluno, Vcl.ComCtrls;

type
  TfrmAlunoCadastro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    btnAdicionar: TButton;
    lsvAlunos: TListView;
    btnListar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    lista: TStringList;
  end;

var
  frmAlunoCadastro: TfrmAlunoCadastro;

implementation

{$R *.dfm}



procedure TfrmAlunoCadastro.btnAdicionarClick(Sender: TObject);
var
  aluno: TAluno;
  codigo: Integer;
begin

  aluno := TAluno.Create;
  try
    codigo := StrToIntDef(edtCodigo.Text, 0);

    aluno.setCodigo(codigo);
    aluno.setNome(edtNome.Text);

    aluno.adicionar(self.lista);

    ShowMessage('Aluno cadastrado com sucesso!');

    edtCodigo.Clear;
    edtNome.Clear;
    edtCodigo.SetFocus;

  finally

    aluno.Free;
  end;
end;

procedure TfrmAlunoCadastro.btnEditarClick(Sender: TObject);
var
  indiceSelecionado: Integer;
  novaLinhaCompleta: string;
begin

  if lsvAlunos.Selected = nil then
  begin
    ShowMessage('Por favor, selecione um aluno na lista para editar.');
    Exit;
  end;

  if (edtCodigo.Text = '') and (edtNome.Text = '') then
  begin

    edtCodigo.Text := lsvAlunos.Selected.Caption;

    edtNome.Text := lsvAlunos.Selected.SubItems[0];

    ShowMessage('Dados carregados. Altere e clique em Editar novamente para salvar.');
  end
  else

  begin
    indiceSelecionado := lsvAlunos.Selected.Index;

    novaLinhaCompleta := edtCodigo.Text + '=' + edtNome.Text;

    lista[indiceSelecionado] := novaLinhaCompleta;

    lsvAlunos.Selected.Caption := edtCodigo.Text;
    lsvAlunos.Selected.SubItems[0] := edtNome.Text;

    edtCodigo.Clear;
    edtNome.Clear;
    ShowMessage('Aluno atualizado com sucesso!');
  end;
end;

procedure TfrmAlunoCadastro.btnExcluirClick(Sender: TObject);
var
  indiceSelecionado: Integer;
begin

  if lsvAlunos.Selected = nil then
  begin
    ShowMessage('Por favor, selecione um aluno na lista para excluir.');
    Exit;
  end;

  indiceSelecionado := lsvAlunos.Selected.Index;

  lista.Delete(indiceSelecionado);

  lsvAlunos.Items.Delete(indiceSelecionado);

  ShowMessage('Aluno excluído com sucesso!');
end;

procedure TfrmAlunoCadastro.btnListarClick(Sender: TObject);
  var
  i: Integer;
  item: TListItem;
  dadosDoAluno: TStringList;
begin
  lsvAlunos.Items.Clear;

  dadosDoAluno := TStringList.Create;
  try
    dadosDoAluno.Delimiter := '=';

    for i := 0 to lista.Count - 1 do
    begin

      dadosDoAluno.DelimitedText := lista[i];

      item := lsvAlunos.Items.Add;
      item.Caption := dadosDoAluno[0];
      item.SubItems.Add(dadosDoAluno[1]);
    end;
  finally

    dadosDoAluno.Free;
  end;
end;

end.
