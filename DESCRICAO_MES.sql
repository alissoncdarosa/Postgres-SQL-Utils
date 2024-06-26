CREATE OR REPLACE FUNCTION DESCRICAO_MES(XCODIGOMES INTEGER, XANO INTEGER)
RETURNS TABLE(
    MES 		  VARCHAR(20),
    ABREV 		  VARCHAR(20),
    MES_ANO 	  VARCHAR(20),
    MES_ANO_ABREV VARCHAR(20))
AS $$
DECLARE
   TEXTO_MES TEXT := LPAD(CAST(XCODIGOMES AS TEXT),2,'0');
   DATA_BASE DATE := CAST('1900-'||TEXTO_MES||'-01' AS DATE);
BEGIN
    MES           := TO_CHAR(DATA_BASE, 'TMMONTH');
    ABREV         := LEFT(MES, 3); 
    MES_ANO       := MES  ||'/'||XANO;
    MES_ANO_ABREV := ABREV||'/'||XANO;
    RETURN NEXT;
END; 
$$ LANGUAGE PLPGSQL;
