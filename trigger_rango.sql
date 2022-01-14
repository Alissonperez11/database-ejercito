CREATE OR REPLACE FUNCTION insertar_encargado()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
DECLARE
  actual INT4;
  anterior INT4;
BEGIN

  IF NEW.rango_id = 8 THEN
    INSERT INTO encargado VALUES(DEFAULT, NEW.batallon_id, NEW.soldado_id);
    RETURN NEW;
  END IF;
RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER insertar_encargado
  AFTER INSERT
  ON soldado
  FOR EACH ROW
  EXECUTE PROCEDURE insertar_encargado();