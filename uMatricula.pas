unit uMatricula;

interface
uses
  System.Classes, System.SysUtils, FireDAC.Comp.Client, Data.DB;
  type TMatricula = class
    codigo, codigoTurma, codigoAluno : Integer;

    procedure setCodigoAluno(aCodigoAluno: Integer);
    procedure setCodigoTurma(aCodigoTurma: Integer);
    procedure setCodigo(aCodigo: Integer);

    function getCodigoAluno: Integer;
    function getCodigoTurma: Integer;
    function getCodigo: Integer;

    procedure adicionar(connection: TFDConnection);
    procedure atualizar(connection: TFDConnection);
    procedure excluir(connection: TFDConnection);
  end;


implementation
{ TMatricula }

procedure TMatricula.adicionar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;

    query.SQL.Text := 'INSERT INTO matricula ( codigo_aluno, codigo_turma) VALUES ('+intToStr(self.getCodigoAluno) + ', ' +
      intToStr(self.getCodigoTurma) + ')';

    query.ExecSQL;
  finally
    query.Free;
  end;
end;

procedure TMatricula.atualizar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
    query.SQL.Text := 'UPDATE matricula SET codigo_aluno = ' + IntToStr(self.getCodigoAluno) +
                      ', codigo_turma = ' + IntToStr(self.getCodigoTurma) +
                      ' WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

procedure TMatricula.excluir(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
    query.SQL.Text := 'DELETE FROM matricula WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;
function TMatricula.getCodigo: Integer;
begin
result:= self.codigo;
end;

function TMatricula.getCodigoAluno: Integer;
begin
result := self.codigoAluno;
end;

function TMatricula.getCodigoTurma: Integer;
begin
result := self.codigoTurma;
end;

procedure TMatricula.setCodigo(aCodigo: Integer);
begin
self.codigo := aCodigo;
end;

procedure TMatricula.setCodigoAluno(aCodigoAluno: Integer);
begin
self.codigoAluno := aCodigoAluno;
end;

procedure TMatricula.setCodigoTurma(aCodigoTurma: Integer);
begin
self.codigoTurma := aCodigoTurma;
end;

end.
