
EXECUTE INCLUIR_SEGMERCADO(NULL, 'Farmaceuticos');

select * from segmercado;

EXECUTE ATUALIZAR_CLI_SEGMERCADO(4,5);

create or replace NONEDITIONABLE PROCEDURE atualizar_cli_segmercado
(p_ID CLIENTE.ID%TYPE, p_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%TYPE)
IS
    e_CLIENTE_ID_INEXISTENTE exception;
BEGIN
    UPDATE CLIENTE SET SEGMERCADO_ID = p_SEGMERCADO_ID
    WHERE ID = p_ID;
    -- SQL%NOTFOUND retorna a saida (No de linhas)
    IF SQL%NOTFOUND THEN
        -- Forcar erro  se o update retorna 0 linhas
        RAISE e_CLIENTE_ID_INEXISTENTE;
    END IF;
    COMMIT;
EXCEPTION
    WHEN e_CLIENTE_ID_INEXISTENTE THEN
        raise_application_error(-20100,'Cliente inexistente');
END;