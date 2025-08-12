unit uProfessor;

interface

uses
  System.Classes, System.SysUtils, FireDAC.Comp.Client, Data.DB;

type
  TProfessor = class
  protected
    codigo: Integer;
    nome, cpf: String;
  public
    function getNome: String;
    procedure setNome(aNome: String);

    function getCodigo: Integer;
    procedure setCodigo(aCodigo: Integer);

    function getCpf: String;
    procedure setCpf(aCpf: String);

    procedure adicionar(connection: TFDConnection);
    procedure atualizar(connection: TFDConnection);
    procedure excluir(connection: TFDConnection);
  end;

implementation

{ TProfessor }


procedure TProfessor.adicionar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
      query.SQL.Text := 'INSERT INTO professor ( NOME, CPF) VALUES ('+
                      QuotedStr(self.getNome) + ', ' +
                      QuotedStr(self.getCpf) + ')';

    query.ExecSQL;
  finally
    query.Free;
  end;
end;


procedure TProfessor.atualizar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
    query.SQL.Text := 'UPDATE professor SET NOME = ' + QuotedStr(self.getNome) +
                      ', CPF = ' + QuotedStr(self.getCpf) +
                      ' WHERE CODIGO = ' + IntToStr(self.getCodigo);

  finally
    query.Free;
  end;
end;


procedure TProfessor.excluir(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);

  try
    query.Connection := connection;

    query.SQL.Text :='SELECT COUNT(*) AS total FROM turma where codigo_professor = :id_professor';
    query.ParamByName('id_professor').AsInteger := self.getCodigo;

    if query.FieldByName('total').AsInteger > 0 then begin
      raise Exception.Create('o professor selecionado esta cadastrado ha uma turma,tente editar a turma ou exclui-la antes de remover esse professor');
    end;

    query.SQL.Text := 'DELETE FROM professor WHERE CODIGO = :codigo';
    query.ParamByName('codigo').AsInteger := self.getCodigo;
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

function TProfessor.getCodigo: Integer;
begin
  result := self.codigo;
end;

function TProfessor.getCpf: String;
begin
  result := self.cpf;
end;

function TProfessor.getNome: String;
begin
  result := self.nome;
end;

procedure TProfessor.setCodigo(aCodigo: Integer);
begin
  self.codigo := aCodigo;
end;

procedure TProfessor.setCpf(aCpf: String);
begin
  self.cpf := aCpf;
end;

procedure TProfessor.setNome(aNome: String);
begin
  self.nome := aNome;
end;

end.
