unit uCadastroTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uTurma, dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TuTurmaCadastro = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    lsvTurma: TListView;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    btnConfirmar: TButton;
    ImageList1: TImageList;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnListar: TButton;
    cbProfessor: TComboBox;
    cbDisciplina: TComboBox;
    cbEditarProfessor: TComboBox;
    cbEditarDisciplina: TComboBox;
    procedure ListarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
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
  professor:String;
  disciplina:String;
begin
var
   turma := TTurma.Create;
  try
    if (cbProfessor.text = '') or (cbDisciplina.text = '') then begin
      ShowMessage('Preencha todos os campos para adicionar a turma!');
    end else begin

    professor:=cbProfessor.text;
    professor:=professor.Remove(professor.IndexOf('-')-1);
    disciplina:=cbDisciplina.Text;
    disciplina:=disciplina.Remove(disciplina.IndexOf('-')-1);
    turma.setCodigoProfessor(StrToInt(professor));
    turma.setCodigoDisciplina(StrToInt(disciplina));
    turma.adicionar(DataModule1.FDConnection1);

    ShowMessage('Turma cadastrada com sucesso!');

    cbProfessor.SetFocus;
    end;
  finally
    atualizarTabela;
    turma.Free;

  end;
end;

procedure TuTurmaCadastro.btnEditarClick(Sender: TObject);
begin
    if lsvTurma.Selected = nil then
  begin
    ShowMessage('Selecione uma turma na lista para editar.');
    Exit;
  end else begin
    panel1.visible := true;
  end;

end;

procedure TuTurmaCadastro.btnConfirmarClick(Sender: TObject);
var
  codigoParaEditar: Integer;
  professor :String;
  disciplina :String;
begin
  codigoParaEditar := StrToInt(lsvTurma.Selected.Caption);

  turma := TTurma.Create;
  try
    turma.setCodigo(codigoParaEditar);

    professor := cbEditarProfessor.text;
    professor := professor.Remove(professor.IndexOf('-')-1);
    disciplina := cbEditarDisciplina.text;
    disciplina := disciplina.Remove(disciplina.IndexOf('-')-1);
    turma.setCodigoProfessor(StrToInt(professor));
    turma.setCodigoDisciplina(StrToInt(disciplina));
    turma.atualizar(DataModule1.FDConnection1);

    ShowMessage('Turma atualizada com sucesso!');
    panel1.Visible := false;
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

      ShowMessage('Turma excluída com sucesso!');
    finally
      atualizartabela;
      turma.free;
    end;
  end;

end;


procedure TuTurmaCadastro.btnListarClick(Sender: TObject);
begin
  atualizarTabela;
end;


procedure TuTurmaCadastro.Formshow(Sender: TObject);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  atualizarTabela;
  try
    query.Connection := DataModule1.FDConnection1;
    query.SQL.Text := 'SELECT codigo, nome FROM professor ORDER BY codigo';
    query.Open;
    while not query.Eof do begin
      cbProfessor.Items.Add(query.FieldByName('codigo').AsString+' - '+query.FieldByName('nome').AsString);
      cbEditarProfessor.Items.Add(query.FieldByName('codigo').AsString+' - '+query.FieldByName('nome').AsString);
      query.Next;
    end;
    query.Close;

    query.SQL.Text := 'SELECT codigo, nome FROM disciplina ORDER BY codigo';
    query.Open;
    while not query.Eof do begin
      cbDisciplina.Items.Add(query.FieldByName('codigo').AsString+' - '+query.FieldByName('nome').AsString);
      cbEditarDisciplina.Items.Add(query.FieldByName('codigo').AsString+' - '+query.FieldByName('nome').AsString);
      query.Next;
    end;
    cbDisciplina.ItemIndex:=0;
    cbProfessor.ItemIndex:=0;
    cbEditarDisciplina.ItemIndex:=0;
    cbEditarProfessor.ItemIndex:=0;
    query.Close;

  finally
    query.Free;
  end;
end;

end.
