DECLARE
  v_tipo_maximo inmuebles.tipo_inmueble%TYPE;
  v_tipo_inmueble VARCHAR2(50);
  v_num_inmuebles NUMBER(10);
BEGIN

FOR r IN (SELECT tipo_inmueble, COUNT(*) AS num_inmuebles FROM inmuebles GROUP BY tipo_inmueble)
  LOOP
    v_tipo_inmueble := r.tipo_inmueble;
    v_num_inmuebles := r.num_inmuebles;
      DBMS_OUTPUT.PUT_LINE('Tipo de inmueble: ' || v_tipo_inmueble || ', cantidad: ' || v_num_inmuebles);
    
  END LOOP;
  SELECT tipo_inmueble INTO v_tipo_maximo
  FROM (
    SELECT tipo_inmueble, COUNT(*) AS cantidad
    FROM inmuebles
    GROUP BY tipo_inmueble
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROW ONLY
  );
  DBMS_OUTPUT.PUT_LINE('El tipo de inmueble con mayor cantidad es: ' || v_tipo_maximo);

END;
