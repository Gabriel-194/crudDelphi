unit uDisciplinaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uDisciplina, dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmDisciplinaCadastro = class(TForm)
    Label2: TLabel;
    edtNome: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    edtEditarNome: TEdit;
    btnConfirmar: TButton;
    lsvDisciplina: TListView;
    ImageList1: TImageList;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnListar: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure atualizarTabela;
    procedure btnConfirmarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisciplinaCadastro: TfrmDisciplinaCadastro;
  disciplina: TDisciplina;

implementation

{$R *.dfm}

procedure TfrmDisciplinaCadastro.atualizarTabela;
 var
  query: TFDQuery;
  item: TListItem;
begin
  lsvDisciplina.Items.Clear;
  query := TFDQuery.Create(nil);
  try
    query.Connection := DataModule1.FDConnection1;

    query.SQL.Text := 'SELECT * FROM disciplina ORDER BY codigo';

    query.Open;

    while not query.Eof do
    begin
      item := lsvDisciplina.Items.Add;

      item.Caption := query.FieldByName('CODIGO').AsString;
      item.SubItems.Add(query.FieldByName('NOME').AsString);

      query.Next;
    end;
  finally
  query.Free;
  end;
end;

procedure TfrmDisciplinaCadastro.btnAdicionarClick(Sender: TObject);
var
  codigo: Integer;
begin
var
   disciplina := TDisciplina.Create;
  try
    if (edtNome.text = '') then begin
      ShowMessage('Preencha todos os campos para adicioar a disciplina!');
    end else begin


    disciplina.setNome(edtNome.Text);
    disciplina.adicionar(DataModule1.FDConnection1);

    ShowMessage('disciplina cadastrada com sucesso!');

    edtNome.Clear;
    edtNome.SetFocus;
    end;
  finally
    atualizarTabela;
    disciplina.Free;

  end;
end;


procedure TfrmDisciplinaCadastro.btnListarClick(Sender: TObject);
begin
  atualizarTabela;
end;

procedure TfrmDisciplinaCadastro.btnEditarClick(Sender: TObject);
begin
  if lsvDisciplina.Selected = nil then
  begin
    ShowMessage('selecione uma disciplina na lista para editar');
    Exit;
  end else begin
    Panel1.Visible := True;
    edtEditarNome.Text := lsvDisciplina.Selected.SubItems[0];
    edtEditarNome.SetFocus;
  end;

end;

procedure TfrmDisciplinaCadastro.btnConfirmarClick(Sender: TObject);
var
  codigoParaEditar: Integer;
begin
  codigoParaEditar := StrToInt(lsvDisciplina.Selected.Caption);


  disciplina := TDisciplina.Create;
  try
    disciplina.setCodigo(codigoParaEditar);
    disciplina.setNome(edtEditarNome.Text);

    disciplina.atualizar(DataModule1.FDConnection1);

    ShowMessage('Disciplina atualizada com sucesso!');
    panel1.Visible := false;
    edtEditarNome.Clear;
  finally
    atualizarTabela;
    disciplina.Free;
  end;
end;

procedure TfrmDisciplinaCadastro.btnExcluirClick(Sender: TObject);
var codigoParaExcluir: Integer;
begin

  if lsvDisciplina.Selected = nil then
  begin
    ShowMessage('Selecione uma disciplina para excluir.');
    Exit;
  end else begin

    codigoParaExcluir := StrToInt(lsvDisciplina.Selected.caption);
    disciplina := TDisciplina.Create;

    try
      disciplina.setCodigo(codigoParaExcluir);
      disciplina.excluir(DataModule1.FDConnection1);

      lsvDisciplina.Items.Delete(lsvDisciplina.Selected.Index);

      ShowMessage('Disciplina excluída com sucesso!');
    finally
      atualizartabela;
      disciplina.free;
    end;

  end;
end;



end.
