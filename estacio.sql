CREATE TABLE Produto (
  idProduto INTEGER   NOT NULL   IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(255)  NULL  ,
  quantidade INTEGER  NULL  ,
  precoVenda NUMERIC  NULL    ,
);


CREATE TABLE Pessoa (
  idPessoa INTEGER  NOT NULL  PRIMARY KEY,
  nome VARCHAR(255)  NULL  ,
  logradouro VARCHAR(255)  NULL  ,
  cidade VARCHAR(255)  NULL  ,
  estado CHAR(2)  NULL  ,
  telefone VARCHAR(255)  NULL  ,
  email VARCHAR(255)  NULL    ,
);

CREATE TABLE Usuario (
  idUsuario INTEGER NOT NULL   IDENTITY(1,1) PRIMARY KEY,
  login VARCHAR(255)  NULL  ,
  senha VARCHAR(255)  NULL    ,
);


CREATE TABLE Movimento (
  idMovimento INTEGER IDENTITY(1,1) PRIMARY KEY,
  Usuario_idUsuario INTEGER FOREIGN KEY REFERENCES Usuario(idUsuario)  ,
  Pessoa_idPessoa INTEGER   FOREIGN KEY REFERENCES Pessoa(idPessoa)  ,
  Produto_idProduto INTEGER   FOREIGN KEY REFERENCES Produto(idProduto)  ,
  quantidade INTEGER   NULL  ,
  tipo VARCHAR(2) NULL  ,
  valorUnitario NUMERIC  NULL    ,
);

CREATE TABLE PessoaFisica (
  Pessoa_idPessoa INTEGER FOREIGN KEY REFERENCES Pessoa(idPessoa)  ,
  CPF INTEGER NULL    ,
);


CREATE TABLE PessoaJuridica (
  Pessoa_idPessoa INTEGER FOREIGN KEY REFERENCES Pessoa(idPessoa)  ,
  CNPJ BigInt NULL    ,
);

CREATE SEQUENCE LOJA_SEQUENCE
AS INT
START WITH 1
INCREMENT BY 1;

  DECLARE @NextValue INT = NEXT VALUE FOR LOJA_SEQUENCE

  INSERT INTO [dbo].[Pessoa]
           (idPessoa
		   ,nome
           ,[logradouro]
           ,[cidade]
           ,[estado]
           ,[telefone]
           ,[email])
     VALUES
           (
		   @NextValue
		   ,'Joao'
           ,'Rua 12, Casa 3,Quitanda'
           ,'Riacho do Sul'
           ,'PA'
           ,'1111-1111'
           ,'joao@riacho.com'
		   )

	INSERT INTO [dbo].[PessoaFisica]
           ([Pessoa_idPessoa]
           ,[CPF])
     VALUES
           (@NextValue
           ,111111111)	

SET @NextValue = NEXT VALUE FOR LOJA_SEQUENCE
  INSERT INTO [dbo].[Pessoa]
           (idPessoa
		   ,nome
           ,[logradouro]
           ,[cidade]
           ,[estado]
           ,[telefone]
           ,[email])
     VALUES
           (
		   (@NextValue
		   ,'JJC'
		   ,'Rua 11, Centro'
		   ,'Riacho do Norte'
		   ,'PA'
		   ,'1212-1212'
		   ,'jjc@riacho.com' )
		   	
INSERT INTO [dbo].[PessoaJuridica]
           ([Pessoa_idPessoa]
           ,[CNPJ])
     VALUES
           ( @NextValue
		   , 22222222222222)



INSERT INTO [dbo].[Produto]
           ([nome]
           ,[quantidade]
           ,[precoVenda])
     VALUES
           ('Banana',100,5)
		   ,('Laranja',500,2)
		   ,('Manga',800,4)
INSERT INTO [dbo].[Usuario]
           ([login]
           ,[senha])
     VALUES
           ( 'op1','op2')
		   ,( 'op2','op2')

INSERT INTO [dbo].[Movimento]
           ([Usuario_idUsuario]
           ,[Pessoa_idPessoa]
           ,[Produto_idProduto]
           ,[quantidade]
           ,[tipo]
           ,[valorUnitario])
     VALUES
           (1,1,1,20,'S',4)
		   ,(1,1,2,15,'S',2)
		   ,(2,1,2,10,'S',3)
		   ,(1,2,2,15,'E',5)
		   ,(1,2,3,20,'E',4)
