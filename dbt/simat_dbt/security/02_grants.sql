GRANT CONNECT ON DATABASE simat_demo TO etc001;

GRANT USAGE ON SCHEMA informe TO etc001;

GRANT SELECT
ON informe.vw_matriculas_anonimizada
TO etc001;