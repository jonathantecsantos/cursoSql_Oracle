SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION obter_descricao_segmercado
(p_ID SEGMERCADO.ID%type)
RETURN SEGMERCADO.DESCRICAO%TYPE
IS
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
BEGIN
    SELECT DESCRICAO into v_DESCRICAO FROM SEGMERCADO WHERE ID = p_ID;
    RETURN v_descricao;
END;

-- Executando funcao com Sintax SQL Developer:
VARIABLE g_DESCRICAO varchar2(100);

EXECUTE :g_DESCRICAO:=obter_descricao_segmercado(1);

PRINT g_DESCRICAO;

-- Executando funcao com PL/SQL:

DECLARE
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
BEGIN
    v_DESCRICAO := obter_descricao_segmercado(2);
    dbms_output.put_line('Descricao: ' || v_DESCRICAO);
END;
