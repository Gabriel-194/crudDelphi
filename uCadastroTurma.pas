unit uCadastroTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uTurma, dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls;

type
  TuTurmaCadastro = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    edtCodigoDisciplina: TEdit;
    btnAdicionar: TButton;
    lsvTurma: TListView;
    btnEditar: TButton;
    btnExcluir: TButton;
    edtCodigoProfessor: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edtEditarCodigoProfessor: TEdit;
    edtEditarCodigoDisciplina: TEdit;
    btnConfirmar: TButton;
    Listar: TButton;
    procedure ListarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure atualizarTabela;
  end;

var
  uTurmaCadastro: TuTurmaCadastro;
  turma: TTurma;

implementation

{$R *.dfm}

{ TuTurmaCadastro }

procedure TuTurmaCadastro.atualizarTabela;
 var
  query : TFDQuery;
  item : TListITem;
begin
  lsvTurma.Items.Clear;
  query := TFDQuery.Create(nil);

  try
    query.Connection := DataModule1.FDConnection1;
    query.SQL.Text := 'SELECT * FROM turma ORDER BY codigo';

    query.Open;
    while not query.Eof do begin
      item := lsvTurma.Items.Add;

      item.Caption := query.FieldByName('CODIGO').AsString;
      item.SubItems.Add(query.FieldByName('codigo_professor').AsString);
      item.SubItems.Add(query.FieldByName('codigo_disciplina').AsString);

      query.next;
    end;
  finally
    query.Free;
  end;
end;

procedure TuTurmaCadastro.btnAdicionarClick(Sender: TObject);
var
  codigo: Integer;
begin
var
   turma := TTurma.Create;
  try
    if (edtCodigoProfessor.text = '') or (edtCodigoDisciplina.text = '') then begin
      ShowMessage('Preencha todos os campos para adicionar a turma!');
    end else begin


    turma.setCodigoProfessor(StrToInt(edtCodigoProfessor.Text));
    turma.setCodigoDisciplina(StrToInt(edtCodigoDisciplina.Text));
    turma.adicionar(DataModule1.FDConnection1);

    ShowMessage('Turma cadastrada com sucesso!');

    edtCodigoProfessor.Clear;
    edtCodigoDisciplina.Clear;
    edtCodigoProfessor.SetFocus;
    end;
  finally
    atualizarTabela;
    turma.Free;

  end;
end;

procedure TuTurmaCadastro.btnEditarClick(Sender: TObject);
begin
  panel1.visible := true;

  edtEditarCodigoProfessor.text := lsvTurma.Selected.SubItems[0];
  edtEditarCodigoDisciplina.text := lsvturma.Selected.SubItems[1];
  edtEditarCodigoProfessor.SetFocus;
end;

procedure TuTurmaCadastro.btnConfirmarClick(Sender: TObject);
var
  codigoParaEditar: Integer;
begin

  if lsvTurma.Selected = nil then
  begin
    ShowMessage('Nenhum turma foi selecionado na lista.');
    Exit;
  end;

  codigoParaEditar := StrToInt(lsvTurma.Selected.Caption);

  turma := TTurma.Create;
  try
    turma.setCodigo(codigoParaEditar);
    turma.setCodigoProfessor(StrToInt(edtEditarCodigoProfessor.Text));
    turma.setCodigoDisciplina(StrToInt(edtEditarCodigoDisciplina.Text));
    turma.atualizar(DataModule1.FDConnection1);

    ShowMessage('turma atualizada com sucesso!');
    panel1.Visible := false;
    edtEditarCodigoProfessor.Clear;
    edtEditarCodigoDisciplina.Clear;
  finally
    atualizarTabela;
    turma.Free;
  end;
end;

procedure TuTurmaCadastro.ListarClick(Sender: TObject);
begin
  atualizarTabela;
end;

procedure TuTurmaCadastro.btnExcluirClick(Sender: TObject);
var codigoParaExcluir: Integer;
begin
  if lsvTurma.Selected = nil then begin
    ShowMessage('Selecione uma turma para excluir.');
    Exit;
  end else begin
    codigoParaExcluir := StrToInt(lsvTurma.Selected.caption);
    turma := TTurma.Create;

    try
      turma.setCodigo(codigoParaExcluir);
      turma.excluir(DataModule1.FDConnection1);

      lsvTurma.Items.Delete(lsvTurma.Selected.Index);

      ShowMessage('Turma excluída com sucesso!');
    finally
      atualizartabela;
      turma.free;
    end;
  end;

end;

end.
