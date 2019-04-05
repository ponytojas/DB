INSERT INTO MUSICOS
VALUES ('25801802B', 'Jim', 'Magger', 'Calle Piedras', '581392', 'Valencia', 673858, 'GRUP00002');

INSERT INTO INSTRUMENTOS(NOMBRE_INSTRUMENTO, TIPO_INSTRUMENTO)
VALUES('Gibson Les Paul', 'GUITARRA ELECTRICA');

INSERT INTO INSTRUMENTO_MUSICO(DNI_MUSICO, ID_INSTRUMENTO)
(
	WITH
	t1 as (SELECT MUSICOS.DNI_MUSICO FROM MUSICOS WHERE DNI_MUSICO = '25801802B'),
	t2 as (SELECT INSTRUMENTOS.ID_INSTRUMENTO FROM INSTRUMENTOS WHERE NOMBRE_INSTRUMENTO = 'Gibson Les Paul')
	select * from t1 cross join t2
)

SELECT * from musicos where musicos.dni_musico in 
(
	select instrumento_musico.dni_musico from instrumento_musico inner join 
	(
		select * from instrumentos where instrumentos.tipo_instrumento = 'GUITARRA ELECTRICA'
	) as inst
	on instrumento_musico.id_instrumento = inst.id_instrumento
)