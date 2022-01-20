CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	GENERO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(30) UNIQUE,
	CNH VARCHAR(12) UNIQUE NOT NULL
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(30) NOT NULL,
	ANO INT(4),
	PLACA VARCHAR(8),
	ID_CLIENTE INT
);


CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','COM','CEL'),
	NUMERO VARCHAR(10),
	ID_CLIENTE INT
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	ID_CARRO INT
);

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	ID_CARRO INT
);

ALTER TABLE CLIENTE 
ADD CONSTRAINT	PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CARRO) REFERENCES CARRO(IDCARRO);

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE MARCA
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_CARRO) REFERENCES CARRO(IDCARRO);

ALTER TABLE COR
ADD CONSTRAINT FK_CARRO_COR
FOREIGN KEY(ID_CARRO) REFERENCES CARRO(IDCARRO);