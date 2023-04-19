DECLARE
  valor_x NUMBER(10,0);
  TYPE num_tab IS TABLE OF NUMBER;
  comunes_tab num_tab := num_tab();
  
  CURSOR cursor_comunes IS
    SELECT tabla_x.valor_x
    FROM tabla_x
    WHERE tabla_x.valor_x IN (
      SELECT tabla_y.valor_x
      FROM tabla_y
    );
BEGIN
  OPEN cursor_comunes;
  LOOP
    FETCH cursor_comunes INTO valor_x;
    EXIT WHEN cursor_comunes%NOTFOUND;
    
 
    IF valor_x NOT MEMBER OF comunes_tab THEN
      comunes_tab.extend;
      comunes_tab(comunes_tab.count) := valor_x;
      DBMS_OUTPUT.PUT_LINE(valor_x);
    END IF;
  END LOOP;
  CLOSE cursor_comunes;
END;
