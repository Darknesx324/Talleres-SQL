DECLARE
  v_cod_x TABLA_X.COD%TYPE;
  v_valor_x TABLA_X.VALOR_X%TYPE;
  v_es_primo NUMBER(1);

  CURSOR c_x IS 
    SELECT COD, VALOR_X
    FROM TABLA_X;

BEGIN
  
  FOR r_x IN c_x LOOP
    v_cod_x := r_x.COD;
    v_valor_x := r_x.VALOR_X;
    v_es_primo := 1;

    
    FOR i IN 2..(v_valor_x/2) LOOP
      IF MOD(v_valor_x, i) = 0 THEN
        v_es_primo := 0;
        EXIT;
      END IF;
    END LOOP;

   
    IF v_es_primo = 1 THEN
      DBMS_OUTPUT.PUT_LINE('En la tabla X  ' || v_cod_x || ', estos valore son primos: ' || v_valor_x);
    END IF;
  END LOOP;
END;
