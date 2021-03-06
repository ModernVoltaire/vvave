USE MASTER 
GO

IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME = 'DB_VVAVE')
	DROP DATABASE DB_VVAVE
GO

CREATE DATABASE DB_VVAVE 
GO

USE DB_VVAVE
GO

CREATE TABLE WEB_USER(
	IDWEB_USER INT PRIMARY KEY IDENTITY,
	UUID NVARCHAR(100),
	NOME_COMPLETO NVARCHAR(100),
	USERNAME NVARCHAR(45),
	EMAIL NVARCHAR(50),
	TELEFONE NVARCHAR(20),
	SENHA NVARCHAR(100)
)
GO

CREATE TABLE PUBLICATION(
	IDPUBLICATION INT PRIMARY KEY IDENTITY,
	CONTEUDO NVARCHAR(200),
	TITULO NVARCHAR(30),
	LEGENDA NVARCHAR(100),
	IDWEB_USER INT FOREIGN KEY REFERENCES WEB_USER(IDWEB_USER)
)
GO

CREATE TABLE COMMENTS(
	IDCOMMENTS INT PRIMARY KEY IDENTITY,
	COMMENT NVARCHAR(100),
	IDWEB_USER INT FOREIGN KEY REFERENCES WEB_USER(IDWEB_USER),
	IDPUBLICATION INT FOREIGN KEY REFERENCES PUBLICATION(IDPUBLICATION)
)
GO

CREATE INDEX INDEX_ID_WEB_USER ON WEB_USER(IDWEB_USER)
GO

CREATE INDEX INDEX_IDPUBLICATION ON PUBLICATION(IDPUBLICATION)
GO

CREATE INDEX INDEX_IDCOMMENT ON COMMENTS(IDCOMMENTS)

SELECT * FROM WEB_USER