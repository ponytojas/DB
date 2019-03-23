/*
select nombre_grupo from grupos where genero_grupo = 'Jazz';
select musicos.nombre_musico, musicos.apellidos_musico from musicos where codigo_instrumento_musico in (select instrumentos.codigo_instrumento from instrumentos where codigo_instrumento like 'INSBA%')
select musicos.nombre_musico, musicos.apellidos_musico from musicos where codigo_instrumento_musico in(select instrumentos.codigo_instrumento from instrumentos where codigo_instrumento like 'INSSX%') and musicos.codigo_grupo_musico in (select codigo_grupo from grupos where genero_grupo = 'Jazz')

*/
