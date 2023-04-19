DECLARE
  v_sum NUMBER := 0;
  v_count NUMBER := 0;
  v_avg NUMBER := 0;
  v_value number := 0;
  CURSOR c_values IS
    SELECT valor_x FROM tabla_x;
BEGIN
  LOOP
    FETCH c_values INTO v_value;
    EXIT WHEN c_values%NOTFOUND;
    v_sum := v_sum + v_value;
    v_count := v_count + 1;
  END LOOP;
  IF v_count > 0 THEN
    v_avg := v_sum / v_count;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Average value: ' || v_avg);
END;
