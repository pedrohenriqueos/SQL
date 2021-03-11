
/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO - TUDO QUE QUEREMOS PROJETAR NA TELA */

SELECT NOW() AS "DATA";

SELECT NOME, NOW() AS "DATA" /* PROJECAO */
FROM CLIENTE;

/* SELECAO - TEORIA DOS CONJUNTOS - WHERE É A CLAUSULA DE SELECAO */

SELECT NOME, SEXO 
FROM CLIENTE
WHERE SEXO = 'M';

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE=5;


/* JUNCAO DE TABELAS */

SELECT NOME,SEXO,BAIRRO,CIDADE, IDCLIENTE,ID_CLIENTE
FROM CLIENTE,ENDERECO
WHERE IDCLIENTE = ID_CLIENTE; /* SELECAO DOS DADOS APÓS O PRODUTO DAS TABELAS */

/* JOIN */
SELECT NOME,SEXO,BAIRRO,CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE=ID_CLIENTE;

SELECT NOME,SEXO,BAIRRO,CIDADE /* PROJECAO */
FROM CLIENTE
INNER JOIN ENDERECO /* JUNCAO */
ON IDCLIENTE=ID_CLIENTE
WHERE BAIRRO='CENTRO'; /* SELECAO */

SELECT NOME,SEXO,BAIRRO,CIDADE,TIPO,DDD, NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = TELEFONE.ID_CLIENTE;

SELECT CLIENTE.NOME, CLIENTE.SEXO, 
ENDERECO.BAIRRO, ENDERECO.CIDADE, 
TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

SELECT C.NOME, C.SEXO, 
ENDE.BAIRRO, ENDE.CIDADE, 
TEL.TIPO, TEL.NUMERO
FROM CLIENTE C 
INNER JOIN ENDERECO ENDE
ON C.IDCLIENTE = ENDE.ID_CLIENTE
INNER JOIN TELEFONE TEL
ON C.IDCLIENTE = TEL.ID_CLIENTE;
