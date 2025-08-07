unit uProfessorCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uProfessor, dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls;

type
  TfrmProfessorCadastro = class(TForm)
    Label2: TLabel;
    edtNome: TEdit;
    btnAdicionar: TButton;
    lsvProfessor: TListView;
    btnEditar: TButton;
    btnExcluir: TButton;
    edtCpf: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edtEditarNome: TEdit;
    edtEditarCpf: TEdit;
    btnConfirmar: TButton;
    labelInstrucao: TLabel;

    procedure btnAdicionarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure atualizarTabela;
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProfessorCadastro: TfrmProfessorCadastro;
  professor: TProfessor;

implementation

{$R *.dfm}

procedure TfrmProfessorCadastro.atualizarTabela;
 var
  query: TFDQuery;
  item: TListItem;
begin
  lsvProfessor.Items.Clear;
  query := TFDQuery.Create(nil);
  try
    query.Connection := DataModule1.FDConnection1;

    query.SQL.Text := 'SELECT * FROM professor ORDER BY NOME';

    query.Open;

    while not query.Eof do
    begin
      item := lsvProfessor.Items.Add;

      item.Caption := query.FieldByName('CODIGO').AsString;
      item.SubItems.Add(query.FieldByName('NOME').AsString);
      item.SubItems.Add(query.FieldByName('CPF').AsString);

      query.Next;
    end;
  finally
  query.Free;
  end;
end;

procedure TfrmProfessorCadastro.btnAdicionarClick(Sender: TObject);
var
  codigo: Integer;
begin
var
   professor := TProfessor.Create;
  try
    if (edtNome.text = '') or (edtCpf.text = '') then begin
      ShowMessage('Preencha todos os campos para adicioar o professor!');
    end else begin


    professor.setNome(edtNome.Text);
    professor.setCPF(edtCpf.Text);
    professor.adicionar(DataModule1.FDConnection1);

    ShowMessage('Professor cadastrado com sucesso!');

    edtNome.Clear;
    edtCPF.Clear;
    edtNome.SetFocus;
    end;
  finally
    atualizarTabela;
    professor.Free;

  end;
end;

procedure TfrmProfessorCadastro.btnEditarClick(Sender: TObject);
begin
    panel1.visible := true;

    edtEditarNome.text := lsvProfessor.Selected.SubItems[0];
    edtEditarCpf.text := lsvProfessor.Selected.SubItems[1];
    edtEditarNome.SetFocus;
end;

procedure TfrmProfessorCadastro.btnListarClick(Sender: TObject);
begin
   atualizarTabela;
end;

procedure TfrmProfessorCadastro.FormShow(Sender: TObject);
begin
  atualizarTabela;
end;

procedure TfrmProfessorCadastro.btnConfirmarClick(Sender: TObject);
var
  codigoParaEditar: Integer;
begin

  if lsvProfessor.Selected = nil then
  begin
    ShowMessage('Nenhum professor foi selecionado na lista.');
    Exit;
  end;

  codigoParaEditar := StrToInt(lsvProfessor.Selected.Caption);


  professor := TProfessor.Create;
  try
    professor.setCodigo(codigoParaEditar);
    professor.setNome(edtEditarNome.Text);
    professor.setCPF(edtEditarCpf.Text);

    professor.atualizar(DataModule1.FDConnection1);

    ShowMessage('Professor atualizado com sucesso!');
    panel1.Visible := false;
    edtEditarNome.Clear;
    edtEditarCpf.Clear;
  finally
    atualizarTabela;
    professor.Free;
  end;
end;

procedure TfrmProfessorCadastro.btnExcluirClick(Sender: TObject);
var codigoParaExcluir: Integer;
begin
  labelInstrucao.Caption := 'selecione um professor da lista e clique em excluir novamente para remover o professor selecionado';

  if lsvProfessor.Selected = nil then
  begin
    ShowMessage('Nenhum professor foi selecionado na lista.');
    Exit;
  end else begin
      codigoParaExcluir := StrToInt(lsvProfessor.Selected.caption);
  professor := TProfessor.Create;

    try
      professor.setCodigo(codigoParaExcluir);
      professor.excluir(DataModule1.FDConnection1);

      lsvProfessor.Items.Delete(lsvProfessor.Selected.Index);

      ShowMessage('Professor excluído com sucesso!');
    finally
      professor.free;
    end;

  end;



end;

end.
