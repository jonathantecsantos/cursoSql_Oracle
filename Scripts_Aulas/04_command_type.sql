DECLARE
    v_ID segmercado.ID%type := 3;
    v_DESCRICAO segmercado.descricao%type := 'Teste';
BEGIN
    INSERT INTO segmercado (ID,DESCRICAO) VALUES (v_ID, v_DESCRICAO);
    COMMIT;
END;

SELECT * FROM segmercado;
