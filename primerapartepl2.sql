SET DATESTYLE TO 'dmy,dmy';
BEGIN TRANSACTION; 
	DROP TABLE MUSICOS CASCADE;
	DROP TABLE INSTRUMENTOS CASCADE;
END TRANSACTION;


CREATE TABLE MUSICOS (
	dni_musico varchar (8) PRIMARY KEY ,
	nombre varchar (10) ,
	apellidos varchar (30) ,
	direccion varchar (30) ,
	codigo_postal smallint ,
	provincia varchar (30) ,
	numero_telefono smallint 
);

CREATE TABLE INSTRUMENTOS(
	id_instrumento smallint PRIMARY KEY,
	musico varchar(8),
	CONSTRAINT FK_INSTRUMENTO_MUSICO FOREIGN KEY (MUSICO) REFERENCES MUSICOS (dni_musico)
);
CREATE TABLE ENTRADA (
codigo_)

INSERT INTO MUSICOS VALUES ('1','1','1',1,'1',1);
INSERT INTO INSTRUMENTOS VALUES (2,'1');