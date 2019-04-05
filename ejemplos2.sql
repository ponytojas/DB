INSERT INTO MUSICO
VALUES ('25801802B', 'Jim', 'Magger', 'Calle Piedras', '581392', 'Valencia', 673858);


INSERT INTO INSTRUMENTO(NOMBRE_INSTRUMENTO, TIPO_INSTRUMENTO)
VALUES('Gibson Les Paul', 'GUITARRA ELECTRICA');


INSERT INTO INSTRUMENTO_MUSICO(DNI_MUSICO, ID_INSTRUMENTO)
(
	WITH
	t1 as (SELECT MUSICO.DNI_MUSICO FROM MUSICO WHERE DNI_MUSICO = '25801802B'),
	t2 as (SELECT INSTRUMENTO.ID_INSTRUMENTO FROM INSTRUMENTO WHERE NOMBRE_INSTRUMENTO = 'Gibson Les Paul')
	select * from t1 cross join t2
);


INSERT INTO COMPOSITOR(DNI_MUSICO) VALUES ('25801802B');

INSERT INTO GRUPO(GENERO_GRUPO, NOMBRE_GRUPO) VALUES ('ROCK', 'THE ROLLIN'' STONES' );


SELECT * from musico where musico.dni_musico in 
(
	select instrumento_musico.dni_musico from instrumento_musico inner join 
	(
		select * from instrumento where instrumento.tipo_instrumento = 'GUITARRA ELECTRICA'
	) as inst
	on instrumento_musico.id_instrumento = inst.id_instrumento
);


SELECT DISTINCT * FROM MUSICO INNER JOIN COMPOSITOR ON COMPOSITOR.DNI_MUSICO = MUSICO.DNI_MUSICO;

