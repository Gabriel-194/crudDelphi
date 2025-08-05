unit uProfessor;

interface
  uses System.Classes,  System.SysUtils,  Firedac.Comp.Client;
type TProfessor = class
  protected
   codigo : Integer;
   nome, cpf : String;
  public
   function getNome: String;
   procedure setNome(aNome:String);

   function getCodigo:Integer;
   procedure setCodigo(aCodigo:Integer);

   function getCpf: String;
   procedure setCpf(aCpf:String);

   procedure adicionar(connection: TFDconnection);
end;
   var listaProfessor :TStringList;

implementation

{ TProfessor }



{ TProfessor }

procedure TProfessor.adicionar(connection: TFDconnection);
begin
//insert into professor (codigo,nome,cpf) values (getCodigo, getNome, getCpf)
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
