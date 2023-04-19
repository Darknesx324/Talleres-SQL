DECLARE
   v_cod_x TABLA_X.COD%TYPE;
   v_valor_x TABLA_X.VALOR_X%TYPE;
   v_cod_y TABLA_Y.COD2%TYPE;
   v_max_registros NUMBER(10);

BEGIN
   SELECT MAX(total_registros)
   INTO v_max_registros
   FROM (
      SELECT COUNT(*) AS total_registros
      FROM TABLA_X
      UNION ALL
      SELECT COUNT(*) AS total_registros
      FROM TABLA_Y
   );

   DBMS_OUTPUT.PUT_LINE('La tabla con mayor registros tiene ' || v_max_registros || ' registros.');

   FOR x IN (SELECT COD, VALOR_X FROM TABLA_X)
   LOOP
      v_cod_x := x.COD;
      v_valor_x := x.VALOR_X;

      SELECT COUNT(*) INTO v_max_registros FROM TABLA_Y;

      IF v_max_registros > 0 THEN
         SELECT COD2 INTO v_cod_y FROM TABLA_Y WHERE ROWNUM = 1;

         UPDATE TABLA_Y SET VALOR_X = v_valor_x WHERE COD2 = v_cod_y;
      END IF;

      UPDATE TABLA_X SET VALOR_X = v_valor_x WHERE COD = v_cod_x;
   END LOOP;

   DBMS_OUTPUT.PUT_LINE('Los valores de la tabla X se han actualizado con los valores de la tabla Y.');
   DBMS_OUTPUT.PUT_LINE('Los valores de la tabla Y se han actualizado con los valores de la tabla X.');
END;
