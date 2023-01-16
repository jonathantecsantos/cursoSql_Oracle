SET SERVEROUTPUT ON;

DECLARE
    v_ID NUMBER(5);
    
BEGIN
    v_id := 4;
    dbms_output.put_line (v_ID); 
END;

DECLARE
    v_ID NUMBER(5) := 2;
    v_DESCRICAO VARCHAR2(100) := 'Atacado';
BEGIN
    INSERT INTO segmercado (ID,DESCRICAO) VALUES (v_ID, v_DESCRICAO);
    COMMIT;
END;
