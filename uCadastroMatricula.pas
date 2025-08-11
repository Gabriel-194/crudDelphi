unit uCadastroMatricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uMatricula, dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls;

type
  TfrmCadastroMatriculas = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    edtCodigoTurma: TEdit;
    btnAdicionar: TButton;
    lsvMatricula: TListView;
    btnEditar: TButton;
    btnExcluir: TButton;
    edtCodigoAluno: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edtEditarCodigoAluno: TEdit;
    edtEditarCodigoTurma: TEdit;
    btnConfirmar: TButton;
    Listar: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure ListarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure atualizarTabela;
  end;

var
  frmCadastroMatriculas: TfrmCadastroMatriculas;
  matricula: TMatricula;

implementation

{$R *.dfm}

{ TfrmCadastroMatriculas }

procedure TfrmCadastroMatriculas.atualizarTabela;
 var
  query : TFDQuery;
  item : TListITem;
begin
  lsvMatricula.Items.Clear;
  query := TFDQuery.Create(nil);

  try
    query.Connection := DataModule1.FDConnection1;
    query.SQL.Text := 'SELECT * FROM matricula ORDER BY codigo';

    query.Open;
    while not query.Eof do begin
      item := lsvMatricula.Items.Add;

      item.Caption := query.FieldByName('codigo').AsString;
      item.SubItems.Add(query.FieldByName('codigo_aluno').AsString);
      item.SubItems.Add(query.FieldByName('codigo_turma').AsString);

      query.next;
    end;
  finally
    query.Free;
  end;
end;

procedure TfrmCadastroMatriculas.btnAdicionarClick(Sender: TObject);
var
  codigo: Integer;
begin
var
   matricula := TMatricula.Create;
  try
    if (edtCodigoAluno.text = '') or (edtCodigoTurma.text = '') then begin
      ShowMessage('Preencha todos os campos para fazer a matricula!');
    end else begin


    matricula.setCodigoAluno(StrToInt(edtCodigoAluno.Text));
    matricula.setCodigoTurma(StrToInt(edtCodigoTurma.Text));
    matricula.adicionar(DataModule1.FDConnection1);

    ShowMessage('Matricula feita com sucesso!');

    edtCodigoAluno.Clear;
    edtCodigoTurma.Clear;
    edtCodigoAluno.SetFocus;
    end;
  finally
    atualizarTabela;
    matricula.Free;

  end;
end;


procedure TfrmCadastroMatriculas.btnEditarClick(Sender: TObject);
begin
  panel1.visible := true;

  edtEditarCodigoAluno.text := lsvMatricula.Selected.SubItems[0];
  edtEditarCodigoTurma.text := lsvMatricula.Selected.SubItems[1];
  edtEditarCodigoAluno.SetFocus;
end;

procedure TfrmCadastroMatriculas.btnConfirmarClick(Sender: TObject);
var
  codigoParaEditar: Integer;
begin

  if lsvMatricula.Selected = nil then
  begin
    ShowMessage('Nenhuma matricula foi selecionada na lista.');
    Exit;
  end;

  codigoParaEditar := StrToInt(lsvMatricula.Selected.Caption);

  matricula := TMatricula.Create;
  try
    matricula.setCodigo(codigoParaEditar);
    matricula.setCodigoAluno(StrToInt(edtEditarCodigoAluno.Text));
    matricula.setCodigoTurma(StrToInt(edtEditarCodigoTurma.Text));
    matricula.atualizar(DataModule1.FDConnection1);

    ShowMessage('matricula atualizada com sucesso!');
    panel1.Visible := false;
    edtEditarCodigoAluno.Clear;
    edtEditarCodigoTurma.Clear;
  finally
    atualizarTabela;
    matricula.Free;
  end;
end;


procedure TfrmCadastroMatriculas.ListarClick(Sender: TObject);
begin
 atualizarTabela;
end;

procedure TfrmCadastroMatriculas.btnExcluirClick(Sender: TObject);
var codigoParaExcluir: Integer;
begin
  if lsvMatricula.Selected = nil then begin
    ShowMessage('Selecione uma matricula para excluir.');
    Exit;
  end else begin
    codigoParaExcluir := StrToInt(lsvMatricula.Selected.caption);
    matricula := TMatricula.Create;

    try
      matricula.setCodigo(codigoParaExcluir);
      matricula.excluir(DataModule1.FDConnection1);

      lsvMatricula.Items.Delete(lsvMatricula.Selected.Index);

      ShowMessage('Matricula excluída com sucesso!');
    finally
      atualizartabela;
      matricula.free;
    end;
  end;

end;

end.
