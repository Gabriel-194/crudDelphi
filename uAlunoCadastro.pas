unit uAlunoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAluno, Vcl.ComCtrls,  dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Mask;

type
  TfrmAlunoCadastro = class(TForm)
    Label2: TLabel;
    edtNome: TEdit;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    btnConfirmar: TButton;
    edtEditarNome: TEdit;
    lsvAluno: TListView;
    btnListar: TButton;
    ImageList1: TImageList;
    Label3: TLabel;
    edtCpf: TMaskEdit;
    edtEditarCpf: TMaskEdit;

    procedure btnAdicionarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure atualizarTabela;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmAlunoCadastro: TfrmAlunoCadastro;
  aluno: TAluno;

implementation

{$R *.dfm}



procedure TfrmAlunoCadastro.atualizarTabela;
 var
  query: TFDQuery;
  item: TListItem;
begin
  lsvAluno.Items.Clear;
  query := TFDQuery.Create(nil);
  try
    query.Connection := DataModule1.FDConnection1;

    query.SQL.Text := 'SELECT * FROM aluno ORDER BY codigo';

    query.Open;

    while not query.Eof do
    begin
      item := lsvAluno.Items.Add;

      item.Caption := query.FieldByName('CODIGO').AsString;
      item.SubItems.Add(query.FieldByName('NOME').AsString);
      item.SubItems.Add(query.FieldByName('CPF').AsString);

      query.Next;
    end;
  finally
  query.Free;
  end;
end;

procedure TfrmAlunoCadastro.btnAdicionarClick(Sender: TObject);
begin
var
   aluno := TAluno.Create;
  try
    if (edtNome.text = '') or (edtCpf.text = '') then begin
      ShowMessage('Preencha todos os campos para adicioar o aluno!');
    end else begin


    aluno.setNome(edtNome.Text);
    aluno.setCPF(edtCpf.Text);
    aluno.adicionar(DataModule1.FDConnection1);

    ShowMessage('Aluno cadastrado com sucesso!');

    edtNome.Clear;
    edtCPF.Clear;
    edtNome.SetFocus;
    end;
  finally
    atualizarTabela;
    aluno.Free;

  end;
end;

procedure TfrmAlunoCadastro.btnEditarClick(Sender: TObject);
begin
  if lsvAluno.Selected = nil then
  begin
    ShowMessage('Selecione um aluno na lista para editar.');
    Exit;
  end else begin
    panel1.visible := true;
    edtEditarNome.SetFocus;
    edtEditarNome.text := lsvAluno.Selected.SubItems[0];
    edtEditarCpf.text := lsvAluno.Selected.SubItems[1];

  end;

  end;

procedure TfrmAlunoCadastro.btnConfirmarClick(Sender: TObject);
var
  codigoParaEditar: Integer;
begin
  codigoParaEditar := StrToInt(lsvAluno.Selected.Caption);

  aluno := TAluno.Create;
  try
    aluno.setCodigo(codigoParaEditar);
    aluno.setNome(edtEditarNome.Text);
    aluno.setCPF(edtEditarCpf.Text);

    aluno.atualizar(DataModule1.FDConnection1);

    ShowMessage('Aluno atualizado com sucesso!');
    panel1.Visible := false;
    edtEditarNome.Clear;
    edtEditarCpf.Clear;
  finally
    atualizarTabela;
    aluno.Free;
  end;
end;



procedure TfrmAlunoCadastro.btnExcluirClick(Sender: TObject);
var codigoParaExcluir: Integer;
begin

  if lsvAluno.Selected = nil then
  begin
    ShowMessage('Selecione um aluno para excluir.');
    Exit;
  end else begin

    codigoParaExcluir := StrToInt(lsvAluno.Selected.caption);
    aluno := TAluno.Create;

    try
      aluno.setCodigo(codigoParaExcluir);
      aluno.excluir(DataModule1.FDConnection1);

      ShowMessage('Aluno excluído com sucesso!');
    finally
      atualizartabela;
      Aluno.free;
    end;

  end;
end;

procedure TfrmAlunoCadastro.btnListarClick(Sender: TObject);
begin
  atualizarTabela;
end;

procedure TfrmAlunoCadastro.FormShow(Sender: TObject);
begin
  atualizarTabela;
end;

end.
