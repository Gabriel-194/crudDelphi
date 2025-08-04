unit uAluno;

interface
  uses System.Classes;
 type TAluno = class
  protected
    nome : String;
    codigo : Integer;

  function getNome: String;
  procedure setNome(aNome:String);

  function getCodigo:Integer;
  procedure setCodigo(aCodigo:Integer);

  procedure adicionar;
  procedure listar;
  procedure editar;
  procedure excluir;
 end;

  var listaAluno: TStringList;

implementation

{ TAluno }

procedure TAluno.adicionar;
  var aluno : String;
begin
  listaAluno.Add(getNome + IntToStr(getCodigo));
end;

procedure TAluno.listar;
begin

end;

procedure TAluno.editar;
begin

end;

procedure TAluno.excluir;
begin

end;



function TAluno.getCodigo: Integer;
begin
  result := self.codigo;
end;

function TAluno.getNome: String;
begin
  result := self.nome;
end;



procedure TAluno.setCodigo(aCodigo: Integer);
begin
  self.codigo := aCodigo;
end;

procedure TAluno.setNome(aNome:String);
begin
  self.nome := aNome;
end;

end.
