create or replace PROCEDURE incluir_segmercado
(p_ID IN NUMBER, p_DESCRICAO IN VARCHAR2) -- PARAMETROS
IS
BEGIN
    INSERT INTO segmercado (ID,DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
    COMMIT;
    
EXCEPTION
    -- EXCECAO PARA CHAVE PRIMARIA DUPLICADA
    -- https://docs.oracle.com/database/121/TTPLS/exceptions.htm#TTPLS199
    -- Desta forma precisamos habilitar o SERVEROUTPUT para visualizar a saida
    WHEN dup_val_on_index THEN
        dbms_output.put_line('SEGMENTO JÁ EXISTENTE NA BASE');
END;


-- OUTRA OPCAO SEM USO DO SERVEROUTPUT

create or replace PROCEDURE incluir_segmercado
(p_ID IN NUMBER, p_DESCRICAO IN VARCHAR2) -- PARAMETROS
IS
BEGIN
    INSERT INTO segmercado (ID,DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
    COMMIT;
    
EXCEPTION
    -- Excecao personalizada
    WHEN dup_val_on_index THEN
        raise_application_error(-20010,'SEGMENTO JÁ EXISTENTE NA BASE');
END;


-- OUTRA OPCAO PARA UM ERRO ESPECIFICO

create or replace PROCEDURE incluir_segmercado
(p_ID IN NUMBER, p_DESCRICAO IN VARCHAR2) -- PARAMETROS
IS
    -- captura o erro com a variavel exception
    e_null exception;
    pragma exception_init(e_null, -1400);
BEGIN
    INSERT INTO segmercado (ID,DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
    COMMIT;
    
EXCEPTION
    -- Excecao personalizada
    WHEN dup_val_on_index THEN
        raise_application_error(-20010,'SEGMENTO JÁ EXISTENTE NA BASE');
    WHEN e_null THEN
        raise_application_error(-20015,'A COLUNA NAO PODE RECEBER VALOR NULL');
END;

-- OUTRA OPCAO PARA UM ERROS GERAIS

create or replace PROCEDURE incluir_segmercado
(p_ID IN NUMBER, p_DESCRICAO IN VARCHAR2) -- PARAMETROS
IS
    -- captura o erro com a variavel exception
    e_null exception;
    pragma exception_init(e_null, -1400);
BEGIN
    INSERT INTO segmercado (ID,DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
    COMMIT;
    
EXCEPTION
    -- Excecao personalizada
    WHEN dup_val_on_index THEN
        raise_application_error(-20010,'SEGMENTO JÁ EXISTENTE NA BASE');
    -- NULO NO CODIGO
    WHEN e_null THEN
        raise_application_error(-20015,'A COLUNA NAO PODE RECEBER VALOR NULL');
    WHEN others THEN
        raise_application_error(-20016,'Erro genérico:  ' || sqlerrm());
END;