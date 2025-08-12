unit uAluno;

interface
  uses System.Classes,System.SysUtils, FireDAC.Comp.Client, Data.DB;
 type TAluno = class
  private
  protected
    nome, cpf : String;
    codigo : Integer;
  public
    function getNome: String;
    procedure setNome(aNome:String);

    function getCodigo:Integer;
    procedure setCodigo(aCodigo:Integer);

    function getCpf: String;
    procedure setCpf(aCpf: String);

    procedure adicionar(connection: TFDConnection);
    procedure atualizar(connection: TFDConnection);
    procedure excluir(connection: TFDConnection);
 end;


implementation

{ TAluno }

procedure TAluno.adicionar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
      query.SQL.Text := 'INSERT INTO aluno ( NOME, CPF) VALUES ('+
                      QuotedStr(self.getNome) + ', ' +
                      QuotedStr(self.getCpf) + ')';

    query.ExecSQL;
  finally
    query.Free;
  end;
end;


procedure TAluno.atualizar(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;
    query.SQL.Text := 'UPDATE aluno SET NOME = ' + QuotedStr(self.getNome) +
                      ', CPF = ' + QuotedStr(self.getCpf) +
                      ' WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;


procedure TAluno.excluir(connection: TFDConnection);
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := connection;

    query.SQL.Text :='SELECT COUNT(*) AS total FROM matricula where codigo_aluno = :id_aluno';
    query.ParamByName('id_aluno').AsInteger := self.getCodigo;
    query.Open;

    if query.FieldByName('total').AsInteger > 0 then begin
      raise Exception.Create('o aluno selecionado esta cadastrado ha uma matricula,tente editar a matricula ou exclui-la antes de remover esse aluno');
    end;
    query.Close;

    query.SQL.Text := 'DELETE FROM aluno WHERE CODIGO = ' + IntToStr(self.getCodigo);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

function TAluno.getCodigo: Integer;
begin
  result := self.codigo;
end;

function TAluno.getCpf: String;
begin
   result := self.cpf
end;

function TAluno.getNome: String;
begin
  result := self.nome;
end;


procedure TAluno.setCodigo(aCodigo: Integer);
begin
  self.codigo := aCodigo;
end;

procedure TAluno.setCpf(aCpf: String);
begin
  self.cpf := aCpf;
end;

procedure TAluno.setNome(aNome:String);
begin
  self.nome := aNome;
end;

end.
