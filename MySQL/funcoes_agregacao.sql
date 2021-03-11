
CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO ENUM('F','M'),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',76234.74,43543.12,7753.90);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',12313.28,53253.56,2345.30);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO','M',74322.18,12312.76,9999.80);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',23412.28,436351.12,5324.70);
INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',42321.28,346436.87,7546.60);
INSERT INTO VENDEDORES VALUES(NULL,'IVONE','F',32524.71,34326.81,6855.50);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',13124.18,63466.27,9665.99);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',3123156.68,43666.87,7456.10);

SELECT MAX(FEVEREIRO) AS MAIOR_FEV
FROM VENDEDORES;

SELECT MIN(MARCO) AS MENOR_MARCO
FROM VENDEDORES;

SELECT AVG(FEVEREIRO) AS MEDIA_FEV
FROM VENDEDORES;

SELECT MAX(JANEIRO) AS MAX_JAN,
	   MIN(JANEIRO) AS MIN_JAN,
	   AVG(JANEIRO) AS MEDIA_JAN
FROM VENDEDORES;

/* TEM CEIL E FLOOR TBM */

SELECT TRUNCATE(MAX(JANEIRO),2) AS MAX_JAN,
	   TRUNCATE(MIN(JANEIRO),2) AS MIN_JAN,
	   TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
FROM VENDEDORES;

SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEVEREIRO,
	   SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES;


SELECT SEXO ,
       SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;

