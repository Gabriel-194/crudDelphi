unit uProfessorCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uProfessor, dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls;

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
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edtEditarNome: TEdit;
    edtEditarCpf: TEdit;
    btnConfirmar: TButton;

    procedure btnAdicionarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);


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

procedure TfrmProfessorCadastro.btnAdicionarClick(Sender: TObject);
var
  codigo: Integer;
begin
var
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

procedure TfrmProfessorCadastro.btnEditarClick(Sender: TObject);
begin
    panel1.visible := true;
end;

procedure TfrmProfessorCadastro.btnListarClick(Sender: TObject);
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
    btnListar.Click;
  finally
    professor.Free;
  end;
end;

procedure TfrmProfessorCadastro.btnExcluirClick(Sender: TObject);
var codigoParaExcluir: Integer;
begin

  if lsvProfessor.Selected = nil then
  begin
    ShowMessage('Nenhum professor foi selecionado na lista.');
    Exit;
  end;

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

end.
