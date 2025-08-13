unit uCadastroMatricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uMatricula, dataBase, FireDAC.Comp.Client, Data.DB,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmCadastroMatriculas = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    lsvMatricula: TListView;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    btnConfirmar: TButton;
    ImageList1: TImageList;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnListar: TButton;
    cbAluno: TComboBox;
    cbTurma: TComboBox;
    cbEditarAluno: TComboBox;
    cbEditarTurma: TComboBox;
    procedure btnAdicionarClick(Sender: TObject);
    procedure ListarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
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
  aluno:String;
  turma:String;
begin
var
   matricula := TMatricula.Create;
  try
    if (cbAluno.text = '') or (cbTurma.text = '') then begin
      ShowMessage('Preencha todos os campos para fazer a matricula!');
    end else begin

    aluno := cbAluno.text;
    aluno := aluno.Remove(aluno.IndexOf('-')-1);
    turma := cbTurma.text;
    matricula.setCodigoAluno(StrToInt(aluno));
    matricula.setCodigoTurma(StrToInt(turma));
    matricula.adicionar(DataModule1.FDConnection1);

    ShowMessage('Matricula feita com sucesso!');

    cbAluno.SetFocus;
    end;
  finally
    atualizarTabela;
    matricula.Free;

  end;
end;


procedure TfrmCadastroMatriculas.btnEditarClick(Sender: TObject);
begin
    if lsvMatricula.Selected = nil then
  begin
    ShowMessage('Selecione uma matricula na lista para editar.');
    Exit;
  end else begin
    panel1.visible := true;
    cbEditarAluno.SetFocus;
  end;

end;

procedure TfrmCadastroMatriculas.btnConfirmarClick(Sender: TObject);
var
  codigoParaEditar: Integer;
  aluno :String;
  turma :String;
begin
  codigoParaEditar := StrToInt(lsvMatricula.Selected.Caption);

  matricula := TMatricula.Create;
  try
    matricula.setCodigo(codigoParaEditar);

    aluno := cbEditarAluno.text;
    aluno := aluno.Remove(aluno.IndexOf('-'));
    turma := cbEditarTurma.text;
    matricula.setCodigoAluno(StrToInt(aluno));
    matricula.setCodigoTurma(StrToInt(turma));
    matricula.atualizar(DataModule1.FDConnection1);

    ShowMessage('Matricula atualizada com sucesso!');
    panel1.Visible := false;
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

      ShowMessage('Matricula excluída com sucesso!');
    finally
      atualizartabela;
      matricula.free;
    end;
  end;

end;

procedure TfrmCadastroMatriculas.btnListarClick(Sender: TObject);
begin
  atualizarTabela;
end;

procedure TfrmCadastroMatriculas.FormShow(Sender: TObject);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  atualizarTabela;
  try
    query.Connection := DataModule1.FDConnection1;

    query.SQL.Text := 'SELECT codigo, nome FROM aluno ORDER BY codigo';
    query.Open;
    while not query.Eof do begin
      cbAluno.Items.Add(query.FieldByName('codigo').AsString+' - '+query.FieldByName('nome').AsString);
      cbEditarAluno.Items.Add(query.FieldByName('codigo' ).AsString+ '-' + query.FieldByName('nome').AsString);
      query.Next;
    end;
    query.Close;

    query.SQL.Text := 'SELECT codigo FROM turma ORDER BY codigo';
    query.Open;
    while not query.Eof do begin
      cbTurma.Items.Add(query.FieldByName('codigo').AsString);
      cbEditarTurma.Items.Add(query.FieldByName('codigo').AsString);
      query.Next;
    end;
    cbAluno.ItemIndex:=0;
    cbTurma.ItemIndex:=0;
    cbEditarAluno.ItemIndex:=0;
    cbEditarTurma.ItemIndex:=0;
    query.Close;

  finally
    query.Free;
  end;
end;

end.
