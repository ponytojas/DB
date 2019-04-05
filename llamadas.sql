/*
select grupo.nombre_grupo from grupo where genero_grupo = 'Jazz';
select musicos.nombre_musico, musicos.apellidos_musico from musicos where codigo_instrumento_musico in (select instrumentos.codigo_instrumento from instrumentos where codigo_instrumento like 'INSBA%')
select musicos.nombre_musico, musicos.apellidos_musico from musicos where codigo_instrumento_musico in(select instrumentos.codigo_instrumento from instrumentos where codigo_instrumento like 'INSSX%') and musicos.codigo_grupo_musico in (select codigo_grupo from grupos where genero_grupo = 'Jazz')
select grupos.nombre_grupo from grupos where codigo_grupo in (select conciertos.codigo_grupo_concierto from conciertos where conciertos.pais_concierto = 'ESPAÑA')
select discos.titulo_disco from discos inner join canciones  on canciones.codigo_disco_cancion = discos.codigo_disco group by discos.titulo_disco  having count(*) >= 10;
select t1.nombre_grupos, t1.musicos from (select grupos.nombre_grupo as nombre_grupos, count(musicos) as musicos from grupos left join musicos on grupos.codigo_grupo = musicos.codigo_grupo_musico group by grupos.nombre_grupo) as t1 where t1.musicos > 3 order by t1.nombre_grupos
*/

select musicos.nombre_musico, musicos.apellidos_musico 
from musicos 
where codigo_instrumento_musico 
in (select instrumentos.codigo_instrumento from instrumentos where codigo_instrumento like 'INSBA%')
