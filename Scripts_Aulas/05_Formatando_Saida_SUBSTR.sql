CREATE OR REPLACE PROCEDURE formata_cnpj
(p_CNPJ IN CLIENTE.CNPJ%TYPE, p_CNPJ_SAIDA OUT CLIENTE.CNPJ%TYPE)
IS
BEGIN
    p_CNPJ_SAIDA := SUBSTR(p_CNPJ,1,3) || '/' || SUBSTR(p_CNPJ,4,2);
END;

VARIABLE g_CNPJ varchar2(10);
VARIABLE g_CNPJ_SAIDA varchar2(10);

EXECUTE :g_CNPJ := '12133';

EXECUTE formata_cnpj(:g_CNPJ, :g_CNPJ_SAIDA);

PRINT :g_CNPJ_SAIDA;