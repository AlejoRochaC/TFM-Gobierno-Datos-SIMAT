-- ==========================================================
-- Prueba de funcionamiento del RLS
-- ==========================================================

SET ROLE etc001;

-- El usuario únicamente visualiza información de la ETC001

SELECT DISTINCT codigo_etc
FROM curado.fact_matriculas;

SELECT COUNT(*)
FROM curado.fact_matriculas;

SELECT *
FROM informe.vw_matriculas_anonimizada
LIMIT 20;

RESET ROLE;