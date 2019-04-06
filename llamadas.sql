/*
select grupo.nombre_grupo from grupo where genero_grupo = 'Jazz';
SELECT DISTINCT * FROM MUSICO INNER JOIN INSTRUMENTO_MUSICO ON INSTRUMENTO_MUSICO.DNI_MUSICO = MUSICO.DNI_MUSICO INNER JOIN INSTRUMENTO ON INSTRUMENTO_MUSICO.ID_INSTRUMENTO = INSTRUMENTO.ID_INSTRUMENTO WHERE INSTRUMENTO.TIPO_INSTRUMENTO = 'Bateria'


*/


select musicos.nombre_musico, musicos.apellidos_musico 
from musicos 
where codigo_instrumento_musico 
in(
	select instrumentos.codigo_instrumento 
	from instrumentos 
	where codigo_instrumento 
	like 'INSSX%'
) and 
musicos.codigo_grupo_musico in 
(
	select codigo_grupo 
	from grupos 
	where genero_grupo = 'Jazz'
)