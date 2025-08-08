unit uDisciplina;

interface
uses
  System.Classes, System.SysUtils, FireDAC.Comp.Client, Data.DB;

type TDisciplina = class
protected
  codigo : Integer;
  nome : String;
public
    function getNome: String;
    procedure setNome(aNome: String);

    function getCodigo: Integer;
    procedure setCodigo(aCodigo: Integer);


    procedure adicionar(connection: TFDConnection);
    procedure atualizar(connection: TFDConnection);
    procedure excluir(connection: TFDConnection);
end;

implementation

{ TDisciplinas }

procedure TDisciplina.adicionar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
      query.SQL.Text := 'INSERT INTO disciplina ( NOME) VALUES ('+
                      QuotedStr(self.getNome) +')';

    query.ExecSQL;
  finally
    query.Free;
  end;
end;

procedure TDisciplina.atualizar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
    query.SQL.Text := 'UPDATE disciplina SET NOME = ' + QuotedStr(self.getNome)
      +' WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

procedure TDisciplina.excluir(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
    query.SQL.Text := 'DELETE FROM disciplina WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

function TDisciplina.getCodigo: Integer;
begin
  result := self.codigo;
end;

function TDisciplina.getNome: String;
begin
  result := self.nome;
end;

procedure TDisciplina.setCodigo(aCodigo: Integer);
begin
  self.codigo := aCodigo;
end;

procedure TDisciplina.setNome(aNome: String);
begin
  self.nome := aNome;
end;

end.
