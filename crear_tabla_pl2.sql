SET DATESTYLE TO 'dmy, dmy';


BEGIN TRANSACTION;
	DROP TABLE IF EXISTS  MUSICOS CASCADE;
	DROP TABLE IF EXISTS INSTRUMENTOS CASCADE;
	DROP TABLE IF EXISTS COMPOSITORES CASCADE;
	DROP TABLE IF EXISTS ENTRADAS CASCADE;
	DROP TABLE IF EXISTS CONCIERTOS CASCADE;
	DROP TABLE IF EXISTS USUARIOS CASCADE;
	DROP TABLE IF EXISTS GRUPOS CASCADE;
	DROP TABLE IF EXISTS DISCOS CASCADE;
	DROP TABLE IF EXISTS CANCIONES CASCADE;
	DROP TABLE IF EXISTS USUARIO_COMPRA CASCADE;
	DROP TABLE IF EXISTS COMPRA_ENTRADA CASCADE;
	DROP TABLE IF EXISTS COMPRAS CASCADE;
END TRANSACTION;


CREATE TABLE INSTRUMENTOS (
	CODIGO_INSTRUMENTO varchar (10) PRIMARY KEY,
	NOMBRE_INSTRUMENTO varchar (20)
);

CREATE TABLE COMPOSITORES(
	CODIGO_COMPOSITOR varchar(10) PRIMARY KEY
);

CREATE TABLE GRUPOS(
	CODIGO_GRUPO varchar(10) PRIMARY KEY,
	GENERO_GRUPO varchar(20),
	NOMBRE_GRUPO varchar(30)
);

CREATE TABLE USUARIOS (
	DNI_USUARIO varchar (10) PRIMARY KEY ,
	EMAIL_USUARIO varchar (30),
	NOMBRE_USUARIO varchar (15),
	APELLIDOS_USUARIO varchar (30),
	PUNTOS_TOTALES smallint 
);

CREATE TABLE CONCIERTOS (
	CODIGO_CONCIERTO varchar(10) PRIMARY KEY,
	CODIGO_GRUPO_CONCIERTO varchar(10),
	PAIS_CONCIERTO varchar(20),
	CIUDAD_CONCIERTO varchar (20),

	CONSTRAINT FK_CODIGO_GRUPO_CONCIERTO FOREIGN KEY (CODIGO_GRUPO_CONCIERTO) REFERENCES GRUPOS (CODIGO_GRUPO)
);

CREATE TABLE MUSICOS (
	DNI_MUSICO varchar (10) PRIMARY KEY,
	NOMBRE_MUSICO varchar (10),
	APELLIDOS_MUSICO varchar (30),
	DIRECCION_MUSICO varchar (30),
	CODIGO_POSTAL int,
	PROVINCIA varchar (30),
	NUMERO_TELEFONO int,
	CODIGO_GRUPO_MUSICO varchar (10),
	
	ES_INSTRUMENTISTA boolean,
	ES_COMPOSITOR boolean,
	
	CODIGO_INSTRUMENTO_MUSICO varchar (20),
	CODIGO_COMPOSITOR_MUSICO varchar (10),

	
	CONSTRAINT IS_COMPOSITOR_FALSE  CHECK ( (NOT ES_COMPOSITOR) OR (CODIGO_COMPOSITOR_MUSICO IS NOT NULL)),
	CONSTRAINT IS_INSTRUMENTISTA_FALSE  CHECK ( (NOT ES_INSTRUMENTISTA) OR (CODIGO_INSTRUMENTO_MUSICO  IS NOT NULL)),
	
	CONSTRAINT FK_INSTRUMENTO_MUSICO FOREIGN KEY (CODIGO_INSTRUMENTO_MUSICO) REFERENCES INSTRUMENTOS(CODIGO_INSTRUMENTO),
	CONSTRAINT FK_COMPOSITOR_MUSICO FOREIGN KEY (CODIGO_COMPOSITOR_MUSICO) REFERENCES COMPOSITORES(CODIGO_COMPOSITOR),
	CONSTRAINT FK_GRUPO_MUSICO FOREIGN KEY (CODIGO_GRUPO_MUSICO) REFERENCES GRUPOS(CODIGO_GRUPO)
);

CREATE TABLE DISCOS(
	CODIGO_DISCO varchar (10) PRIMARY KEY ,
	FECHA_EDICION date,
	TITULO_DISCO varchar(50),
	GENERO_DISCO varchar(15),
	CODIGO_GRUPO_DISCO varchar (10),

	ES_FISICO boolean,
	ES_DIGITAL boolean,
	
	TAMAÑO_DISCO smallint,

	CONSTRAINT FK_CODIGO_GRUPO_DISCO FOREIGN KEY (CODIGO_GRUPO_DISCO) REFERENCES GRUPOS (CODIGO_GRUPO),
	CONSTRAINT IS_DIGITAL_FALSE  CHECK ( (NOT ES_DIGITAL) OR (TAMAÑO_DISCO IS NOT NULL))
	

);

CREATE TABLE CANCIONES (
	CODIGO_CANCION varchar(10) PRIMARY KEY,
	DURACION float ,
	NOMBRE_CANCION varchar(40),
	ID_COMPOSITOR_CANCION varchar(10) ,
	CODIGO_DISCO_CANCION varchar(10),

	CONSTRAINT FK_ID_COMPOSITOR FOREIGN KEY (ID_COMPOSITOR_CANCION) REFERENCES COMPOSITORES (CODIGO_COMPOSITOR),
	CONSTRAINT FK_CODIGO_DISCO_CANCION FOREIGN KEY (CODIGO_DISCO_CANCION) REFERENCES DISCOS (CODIGO_DISCO)
);


CREATE TABLE COMPRAS(
	CODIGO_COMPRA SERIAL PRIMARY KEY not null,
	
	PUNTOS_GASTADOS smallint,
	PUNTOS_GANADOS smallint,
	
	ES_COMPRA_DISCO boolean default false,
	
	ES_COMPRA_ENTRADAS boolean default false,
	CANTIDAD_ENTRADAS smallint CHECK (CANTIDAD_ENTRADAS BETWEEN 1 AND 6),
	
	CODIGO_DISCO_COMPRA varchar(10) default null,
	CODIGO_CONCIERTO_COMPRA varchar(10) default null,

	CONSTRAINT IS_COMPRA_DISCO_FALSE  CHECK ( (NOT ES_COMPRA_DISCO) OR (CODIGO_DISCO_COMPRA IS NOT NULL)),
	CONSTRAINT IS_COMPRA_CONCIERTO_FALSE  CHECK ( (NOT ES_COMPRA_ENTRADAS) OR
												 (CODIGO_CONCIERTO_COMPRA  IS NOT NULL) AND 
												 (CANTIDAD_ENTRADAS IS NOT NULL)),
	
	CONSTRAINT FK_CODIGO_DISCO_COMPRA FOREIGN KEY (CODIGO_DISCO_COMPRA) REFERENCES DISCOS (CODIGO_DISCO),
	CONSTRAINT FK_CODIGO_CONCIERTO_COMPRA FOREIGN KEY (CODIGO_CONCIERTO_COMPRA) REFERENCES CONCIERTOS (CODIGO_CONCIERTO)
);

CREATE TABLE ENTRADAS (
	CODIGO_ENTRADA SERIAL PRIMARY KEY,
	PRECIO_ENTRADA money not null,
	CODIGO_CONCIERTO_ENTRADA varchar(10) not null,

	CONSTRAINT FK_CODIGO_CONCIERTO_ENTRADA FOREIGN KEY (CODIGO_CONCIERTO_ENTRADA) REFERENCES CONCIERTOS (CODIGO_CONCIERTO)
);

CREATE TABLE COMPRA_ENTRADA(
	CODIGO_COMPRA_ENTRADA SERIAL PRIMARY KEY,
	
	CODIGO_COMPRA int,
	CODIGO_ENTRADA SERIAL,
	
	CONSTRAINT FK_CODIGO_COMPRA FOREIGN KEY (CODIGO_COMPRA) REFERENCES COMPRAS (CODIGO_COMPRA),
	CONSTRAINT FK_CODIGO_ENTRADA FOREIGN KEY (CODIGO_ENTRADA) REFERENCES ENTRADAS (CODIGO_ENTRADA)
);

CREATE TABLE USUARIO_COMPRA (
	ID_USUARIO_COMPRA SERIAL PRIMARY KEY,
	
	DNI_USUARIO_COMPRA varchar(10),
	CODIGO_COMPRA int,
	
	OPINION smallint CHECK (OPINION BETWEEN 1 AND 10),
	
	CONSTRAINT FK_DNI_USUARIO_COMPRA FOREIGN KEY (DNI_USUARIO_COMPRA) REFERENCES USUARIOS (DNI_USUARIO),
	CONSTRAINT FK_CODIGO_COMPRA FOREIGN KEY (CODIGO_COMPRA) REFERENCES COMPRAS (CODIGO_COMPRA)
	
);
