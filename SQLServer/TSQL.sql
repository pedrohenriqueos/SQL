

BEGIN
	PRINT 'PRIMEIRO BLOCO'
END
GO

USE AULA
GO

DECLARE
	@CONTADOR INT
BEGIN
	SET @CONTADOR = 5
	PRINT @CONTADOR
END

SELECT @CONTADOR
GO /* DETERMINA O BLOCO PARA PERMITIR O SELECT */

/* NO SQL SERVER CADA COLUNA, VARIVEL LOCAL, EXPRESSAO E PARAMETRO TEM UM TIPO. */

DECLARE
	@V_NUMERO NUMERIC(10,2) = 100.52,
	@V_DATA DATETIME = '20170207'
BEGIN
	PRINT 'VALOR NUMERICO: ' + CAST(@V_NUMERO AS VARCHAR)
	PRINT 'VALOR NUMERICO: ' + CONVERT(VARCHAR,@V_NUMERO)
	PRINT 'VALOR DE DATA: ' + CAST(@V_DATA AS VARCHAR)
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR,@V_DATA,121)
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR,@V_DATA,120)
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR,@V_DATA,105)
END
GO