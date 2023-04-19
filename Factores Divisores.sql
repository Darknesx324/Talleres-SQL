DECLARE
    numero NUMBER;
    i NUMBER := 1;
BEGIN
    
    numero:=:numero;
 
    WHILE i <= numero LOOP
        
        IF MOD(numero, i) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;

        i := i + 1;
    END LOOP;
END;



DECLARE
num NUMBER;
BEGIN

num:=:num

FOR i IN 1..num LOOP
   
    IF MOD(num, i) = 0 THEN
       
        DBMS_OUTPUT.PUT_LINE(i);
    END IF;
END LOOP;
