
/* TRIGGER PARA CALCULO DE PUNTOS */

CREATE OR REPLACE FUNCTION FN_PUNTOS_GANADOS() RETURNS TRIGGER AS $FN_PUNTOS_GANADOS$
DECLARE
    BEGIN 
    UPDATE COMPRA
	SET PUNTOS_GANADOS = 60 * 0.1
	WHERE id_compra = 66;
    RETURN new;
    END;

$FN_PUNTOS_GANADOS$ LANGUAGE PLPGSQL;

CREATE TRIGGER TG_PUNTOS_GANADOS 
	AFTER INSERT OR UPDATE ON COMPRA
	FOR EACH ROW 
	EXECUTE PROCEDURE FN_PUNTOS_GANADOS();

CREATE OR REPLACE FUNCTION FN_PUNTOS_GASTADOS() RETURNS TRIGGER AS $FN_PUNTOS_GASTADOS$
   DECLARE
    BEGIN 
    UPDATE COMPRA 
	SET precio = precio - puntos_gastados * 0.05 * precio
	WHERE new.id_compra = id_compra;
    RETURN NULL;
    END;

$FN_PUNTOS_GASTADOS$ LANGUAGE PLPGSQL;

CREATE TRIGGER TG_PUNTOS_GASTADOS BEFORE INSERT OR UPDATE ON COMPRA 
FOR EACH ROW 

EXECUTE PROCEDURE FN_PUNTOS_GASTADOS();




