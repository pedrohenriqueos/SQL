/* TRIGGERS */


CREATE TABLE PRODUTOS(
	IDPRODUTO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL,
	CATEGORIA VARCHAR(30) NOT NULL,
	PRECO NUMERIC(10,2) NOT NULL
)
GO

CREATE TABLE HISTORICO(
	IDOPERACAO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL,
	CATEGORIA VARCHAR(30) NOT NULL,
	PRECOANTIGO NUMERIC(10,2) NOT NULL,
	PRECONOVO NUMERIC(10,2) NOT NULL,
	DATA DATETIME,
	USUARIO VARCHAR(30),
	MENSAGEM VARCHAR(100)
)
GO


INSERT INTO PRODUTOS VALUES('LIVRO SQL SERVER','LIVROS',98.00)
INSERT INTO PRODUTOS VALUES('LIVRO ORACLE','LIVROS',50.00)
INSERT INTO PRODUTOS VALUES('LICEN?A POWERCENDER','SOFTWARES',45000.00)
INSERT INTO PRODUTOS VALUES('NOTEBOOK I7','COMPUTADORES',3150.00)
INSERT INTO PRODUTOS VALUES('LIVRO BUSINESS INTELIGENT','LIVROS',90.00)
GO

SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO
GO


SELECT SUSER_NAME() GO

/* DATA MANIPULATION LANGUAGE */

CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE
AS
	DECLARE @IDPRODUTO INT
	DECLARE @PRODUTO VARCHAR(30)
	DECLARE @CATEGORIA VARCHAR(10)
	DECLARE @PRECO NUMERIC(10,2)
	DECLARE @PRECONOVO NUMERIC(10,2)
	DECLARE @DATA DATETIME
	DECLARE @USUARIO VARCHAR(30)
	DECLARE @ACAO VARCHAR(100)

	SELECT @IDPRODUTO = IDPRODUTO FROM inserted
	SELECT @PRODUTO = NOME FROM inserted
	SELECT @CATEGORIA = CATEGORIA FROM inserted
	SELECT @PRECO = PRECO FROM deleted
	SELECT @PRECONOVO = PRECO FROM inserted
	
	/* POR BOA PRATICA:
		VALORES VINDOS DE TABELAS S?O INSERIDOS COM SELECT
		VALORES VINDOS DE FUN??ES OU VALORES LITERAIS DEVEM
		SER ATRIBUTOS COM SET
	*/
	SET @DATA = GETDATE()
	SET @USUARIO = SUSER_NAME()
	SET @ACAO = 'VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO'

	INSERT INTO HISTORICO
	(NOME,CATEGORIA,PRECOANTIGO,PRECONOVO,DATA,USUARIO,MENSAGEM)
	VALUES
	(@PRODUTO,@CATEGORIA,@PRECO,@PRECONOVO,@DATA,@USUARIO,@ACAO)
	
	PRINT 'TRIGGER EXECUTADA COM SUCESSO'
GO


UPDATE PRODUTOS SET PRECO = 100.00
WHERE IDPRODUTO = 1
GO

SELECT * FROM PRODUTOS
GO
SELECT * FROM HISTORICO
GO

UPDATE PRODUTOS SET NOME ='LIVRO C#'
WHERE IDPRODUTO=1
GO

DROP TRIGGER TRG_ATUALIZA_PRECO
GO

CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE AS
IF UPDATE(PRECO)
BEGIN
	DECLARE @IDPRODUTO INT
	DECLARE @PRODUTO VARCHAR(30)
	DECLARE @CATEGORIA VARCHAR(10)
	DECLARE @PRECO NUMERIC(10,2)
	DECLARE @PRECONOVO NUMERIC(10,2)
	DECLARE @DATA DATETIME
	DECLARE @USUARIO VARCHAR(30)
	DECLARE @ACAO VARCHAR(100)

	SELECT @IDPRODUTO = IDPRODUTO FROM inserted
	SELECT @PRODUTO = NOME FROM inserted
	SELECT @CATEGORIA = CATEGORIA FROM inserted
	SELECT @PRECO = PRECO FROM deleted
	SELECT @PRECONOVO = PRECO FROM inserted
	
	/* POR BOA PRATICA:
		VALORES VINDOS DE TABELAS S?O INSERIDOS COM SELECT
		VALORES VINDOS DE FUN??ES OU VALORES LITERAIS DEVEM
		SER ATRIBUTOS COM SET
	*/
	SET @DATA = GETDATE()
	SET @USUARIO = SUSER_NAME()
	SET @ACAO = 'VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO'

	INSERT INTO HISTORICO
	(NOME,CATEGORIA,PRECOANTIGO,PRECONOVO,DATA,USUARIO,MENSAGEM)
	VALUES
	(@PRODUTO,@CATEGORIA,@PRECO,@PRECONOVO,@DATA,@USUARIO,@ACAO)
	
	PRINT 'TRIGGER EXECUTADA COM SUCESSO'
END
GO

UPDATE PRODUTOS SET PRECO = 300.00
WHERE IDPRODUTO=2
GO

UPDATE PRODUTOS SET NOME ='LIVRO JAVA'
WHERE IDPRODUTO=1
GO


CREATE TABLE RESULTADO(
	IDRESULTADO INT PRIMARY KEY IDENTITY,
	RESULTADO INT
)
GO

INSERT INTO RESULTADO VALUES((SELECT 10+10))
GO

SELECT * FROM RESULTADO
GO

DECLARE
	@RESULTADO INT
	SET @RESULTADO = (SELECT 50+50)
	INSERT INTO RESULTADO VALUES
	(@RESULTADO)
	GO

CREATE TABLE EMPREGADO(
	IDEMP INT PRIMARY KEY,
	NOME VARCHAR(30),
	SALARIO MONEY,
	IDGERENTE INT
)
GO

ALTER TABLE EMPREGADO ADD CONSTRAINT FK_GERENTE
FOREIGN KEY(IDGERENTE) REFERENCES EMPREGADO(IDEMP)
GO

INSERT INTO EMPREGADO VALUES(1,'CLARA',5000.00,NULL)
INSERT INTO EMPREGADO VALUES(2,'CELIA',4000.00,1)
INSERT INTO EMPREGADO VALUES(3,'JOAO',4000.00,1)
GO

SELECT * FROM EMPREGADO
GO

CREATE TABLE HIST_SALARIO(
	IDEMPREGADO INT,
	ANTIGOSAL MONEY,
	NOVOSAL MONEY,
	DATA DATETIME
)
GO

CREATE TRIGGER TG_SALARIO
ON DBO.EMPREGADO
FOR UPDATE AS
IF UPDATE(SALARIO)
BEGIN
	INSERT INTO HIST_SALARIO
	(IDEMPREGADO,ANTIGOSAL,NOVOSAL,DATA)
	SELECT D.IDEMP,D.SALARIO,I.SALARIO,GETDATE()
	FROM DELETED D, INSERTED I
	WHERE D.IDEMP=I.IDEMP

END
GO

SELECT * FROM EMPREGADO
GO

UPDATE EMPREGADO SET SALARIO= SALARIO*1.1
GO

SELECT * FROM HIST_SALARIO
GO

SELECT * FROM EMPREGADO
SELECT NOME,
       ANTIGOSAL,
	   NOVOSAL,
	   DATA
FROM EMPREGADO
INNER JOIN HIST_SALARIO
ON IDEMP=IDEMPREGADO
GO


CREATE TABLE SALARIO_RANGE(
	MINSAL MONEY,
	MAXSAL MONEY
)
GO

INSERT INTO SALARIO_RANGE VALUES(3000.00,6000.00)
GO


CREATE TRIGGER TG_RANGE
ON DBO.EMPREGADO
FOR INSERT,UPDATE
AS
	DECLARE
		@MINSAL MONEY,
		@MAXSAL MONEY,
		@ATUALSAL MONEY

	SELECT @MINSAL = MINSAL,@MAXSAL=MAXSAL
	FROM SALARIO_RANGE

	SELECT @ATUALSAL = I.SALARIO
	FROM INSERTED I

	IF(@ATUALSAL < @MINSAL)
	BEGIN
		RAISERROR('SALARIO MENOR QUE O PISO',16,1)
		ROLLBACK TRANSACTION
	END
	IF(@ATUALSAL > @MAXSAL)
	BEGIN
		RAISERROR('SALARIO MAIOR QUE O TETO',16,1)
		ROLLBACK TRANSACTION
	END
GO

UPDATE EMPREGADO SET SALARIO = 9000.00
WHERE IDEMP = 1
GO

SP_HELPTEXT TG_RANGE