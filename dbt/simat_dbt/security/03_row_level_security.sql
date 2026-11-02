-- ==========================================================
-- TFM - Gobierno de Datos SIMAT
-- Implementación de Row Level Security (RLS)
-- ==========================================================

-- Habilitar Row Level Security
ALTER TABLE curado.fact_matriculas
ENABLE ROW LEVEL SECURITY;

-- Eliminar la política si ya existe
DROP POLICY IF EXISTS politica_etc001
ON curado.fact_matriculas;

-- Crear política para la ETC001
CREATE POLICY politica_etc001
ON curado.fact_matriculas
FOR SELECT
TO etc001
USING (
    codigo_etc = 'ETC001'
);