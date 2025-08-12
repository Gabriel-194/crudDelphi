unit uTurma;

interface
  uses
  System.Classes, System.SysUtils, FireDAC.Comp.Client, Data.DB;
type TTurma = class
  codigo, codigoProfessor, codigoDisciplina : Integer;

    procedure setCodigoProfessor(aCodigoProfessor: Integer);
    procedure setCodigoDisciplina(aCodigoDisciplina: Integer);
    procedure setCodigo(aCodigo: Integer);

    function getCodigoProfessor: Integer;
    function getCodigoDisciplina: Integer;
    function getCodigo: Integer;


    procedure adicionar(connection: TFDConnection);
    procedure atualizar(connection: TFDConnection);
    procedure excluir(connection: TFDConnection);
end;
implementation

procedure TTurma.adicionar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;

    query.SQL.Text := 'INSERT INTO turma ( codigo_professor, codigo_disciplina) VALUES ('+intToStr(self.getCodigoProfessor) + ', ' +
      intToStr(self.getCodigoDisciplina) + ')';

    query.ExecSQL;
  finally
    query.Free;
  end;
end;


procedure TTurma.atualizar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
    query.SQL.Text := 'UPDATE turma SET codigo_professor = ' + IntToStr(self.getCodigoProfessor) +
                      ', codigo_disciplina = ' + IntToStr(self.getCodigoDisciplina) +
                      ' WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;


procedure TTurma.excluir(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;

    query.SQL.Text :='SELECT COUNT(*) AS total FROM matricula where codigo_turma = :id_turma';
    query.ParamByName('id_turma').AsInteger := self.getCodigo;
    query.Open;

    if query.FieldByName('total').AsInteger > 0 then begin
      raise Exception.Create('A turma selecionada esta cadastrada ha uma matricula,tente editar a matricula ou exclui-la antes de remover essa turma');
    end;
    query.close;

    query.SQL.Text := 'DELETE FROM turma WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;


function TTurma.getCodigo: Integer;
begin
 result := self.codigo;
end;

function TTurma.getCodigoDisciplina: Integer;
begin
  result := self.codigoDisciplina;
end;

function TTurma.getCodigoProfessor: Integer;
begin
  result := self.codigoProfessor;
end;

procedure TTurma.setCodigo(aCodigo: Integer);
begin
 self.codigo := aCodigo;
end;

procedure TTurma.setCodigoDisciplina(aCodigoDisciplina: Integer);
begin
 self.codigoDisciplina := aCodigoDisciplina;
end;

procedure TTurma.setCodigoProfessor(aCodigoProfessor: Integer);
begin
 self.codigoProfessor := aCodigoProfessor;
end;



end.
