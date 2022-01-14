CREATE OR REPLACE FUNCTION insertar_instrumentos()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
  
  INSERT INTO estadoinstrumento values(NEW.instrumentos_id, NEW.mision_id, NEW.instrumentos_id,NEW.instrumentos_cantidad, 0);
  INSERT INTO reporteinstrumento values(DEFAULT, NEW.instrumentos_id, now(), 'AGREGADOS');
  RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER insertar_instrumentos
  AFTER INSERT
  ON instrumentos
  FOR EACH ROW
  EXECUTE PROCEDURE insertar_instrumentos();