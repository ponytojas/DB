select * from musicos where codigo_grupo_musico in (select codigo_grupo from grupos where genero_grupo = 'Heavy Metal');
select nombre_musico, apellidos_musico, direccion_musico from musicos where direccion_musico = 'Calle Piedras';
select distinct direccion_musico from musicos;
select * from grupos;
select * from musicos where codigo_grupo_musico in (select codigo_grupo from grupos where genero_grupo = 'Jazz');
