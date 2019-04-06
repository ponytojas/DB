-- Consulta 1
select grupo.nombre_grupo from grupo where genero_grupo = 'Jazz';

--Consulta 2
SELECT DISTINCT * FROM MUSICO 
INNER JOIN INSTRUMENTO_MUSICO ON INSTRUMENTO_MUSICO.DNI_MUSICO = MUSICO.DNI_MUSICO 
INNER JOIN INSTRUMENTO ON INSTRUMENTO_MUSICO.ID_INSTRUMENTO = INSTRUMENTO.ID_INSTRUMENTO 
WHERE INSTRUMENTO.TIPO_INSTRUMENTO = 'Bateria';

-- Consulta 3
select musico.dni_musico, musico.nombre_musico, musico.apellidos_musico from musico
inner join instrumento_musico on instrumento_musico.dni_musico = musico.dni_musico
inner join instrumento on instrumento.id_instrumento = instrumento_musico.id_instrumento
inner join musico_grupo on musico.dni_musico = musico_grupo.dni_musico
inner join grupo on musico_grupo.id_grupo = grupo.id_grupo
where grupo.genero_grupo = 'Jazz' and instrumento.tipo_instrumento = 'Saxofon';

-- Consulta 4
select grupo.nombre_grupo from grupo 
inner join concierto on concierto.id_grupo = grupo.id_grupo
where concierto.pais_concierto = 'ESPAÑA';

-- Consulta 5
select disco.titulo_disco from disco
inner join cancion_disco on cancion_disco.id_disco = disco.id_disco
group by disco.titulo_disco
having count(id_cancion) >= 10;

-- Consulta 6
select grupo.nombre_grupo from grupo
inner join musico_grupo on grupo.id_grupo = musico_grupo.id_grupo
group by grupo.nombre_grupo
having count (musico_grupo.dni_musico) > 3;

-- Consulta 7


-- Consulta 8
select disco.titulo_disco from disco
inner join cancion_disco on cancion_disco.id_disco = disco.id_disco
inner join cancion on cancion.id_cancion = cancion_disco.id_cancion
inner join disco_grupo on disco_grupo.id_disco = disco.id_disco
inner join grupo on grupo.id_grupo = disco_grupo.id_grupo
where disco.es_fisico = true and grupo.genero_grupo = 'Rock'
group by disco.titulo_disco, cancion.duracion
having cancion.duracion > 5;

-- Consulta 9
select musico.nombre_musico, musico.apellidos_musico from musico
inner join musico_grupo on musico_grupo.dni_musico = musico.dni_musico
inner join grupo on grupo.id_grupo = musico_grupo.id_grupo
inner join concierto on concierto.id_grupo = grupo.id_grupo
inner join entrada on concierto.codigo_concierto = entrada.codigo_concierto
where entrada.precio_entrada >= cast(100 as money);

-- Consulta 10
select usuario_compra.opinion from usuario_compra
inner join compra on usuario_compra.codigo_compra = compra.codigo_compra
inner join concierto on concierto.codigo_concierto = compra.codigo_concierto
inner join entrada on concierto.codigo_concierto = entrada.codigo_concierto
where entrada.precio_entrada >= cast(100 as money);

-- Consulta 11
select cancion.nombre_cancion, musico.nombre_musico, musico.apellidos_musico from cancion
inner join compositor_cancion on compositor_cancion.id_cancion = cancion.id_cancion
inner join compositor on compositor.id_compositor = compositor_cancion.id_compositor
inner join musico on musico.dni_musico = compositor.dni_musico
inner join cancion_disco on cancion_disco.id_cancion = cancion.id_cancion
inner join disco on cancion_disco.id_disco = disco.id_disco
where disco.genero_disco = 'Heavy Metal' 
group by cancion.nombre_cancion, musico.nombre_musico, musico.apellidos_musico, disco.fecha_edicion
having
disco.fecha_edicion >= '2018-01-01' and disco.fecha_edicion <= '2018-12-31';

-- Consulta 12


-- Consulta 13
select distinct usuario.nombre_usuario, usuario.apellidos_usuario from usuario
inner join usuario_compra on usuario_compra.dni_usuario_compra = usuario.dni_usuario
inner join compra on compra.codigo_compra = usuario_compra.codigo_compra
inner join concierto on concierto.codigo_concierto = compra.codigo_concierto
inner join grupo on grupo.id_grupo = concierto.id_grupo
where fecha_concierto >= '2018-01-01' and fecha_concierto <= '2018-12-31'
and
grupo.genero_grupo = 'Rock';

-- Consulta 14
select disco.titulo_disco, cancion.nombre_cancion from cancion
inner join cancion_disco on cancion.id_cancion = cancion_disco.id_cancion
inner join disco on disco.id_disco = cancion_disco.id_disco
inner join compra on compra.id_disco = disco.id_disco
inner join usuario_compra on usuario_compra.codigo_compra = compra.codigo_compra
group by disco.titulo_disco, cancion.nombre_cancion
having avg(opinion) > 8;

-- Consulta 15




