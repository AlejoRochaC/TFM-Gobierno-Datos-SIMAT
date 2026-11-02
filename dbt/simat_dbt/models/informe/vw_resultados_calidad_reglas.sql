WITH resultados AS (

-- ==========================================
-- RQ-001 Tipo de documento
-- ==========================================
SELECT
    'RQ-001' AS regla,
    'Tipo de documento válido' AS descripcion,
    COUNT(*) AS registros_evaluados,
    COUNT(*) FILTER (
        WHERE tipo_documento NOT IN ('CC','TI','RC')
    ) AS registros_fallan
FROM {{ ref('stg_estudiantes') }}

UNION ALL

-- ==========================================
-- RQ-002 Documento obligatorio
-- ==========================================
SELECT
    'RQ-002',
    'Número de documento obligatorio',
    COUNT(*),
    COUNT(*) FILTER (
        WHERE numero_documento IS NULL
    )
FROM {{ ref('stg_estudiantes') }}

UNION ALL

-- ==========================================
-- RQ-003 Documento único
-- ==========================================
SELECT
    'RQ-003',
    'Documento único',

    (
        SELECT COUNT(*)
        FROM {{ ref('stg_estudiantes') }}
    ) AS registros_evaluados,

    (
        SELECT COALESCE(SUM(duplicados - 1),0)
        FROM (
            SELECT
                tipo_documento,
                numero_documento,
                COUNT(*) AS duplicados
            FROM {{ ref('stg_estudiantes') }}
            WHERE numero_documento IS NOT NULL
            GROUP BY
                tipo_documento,
                numero_documento
            HAVING COUNT(*) > 1
        ) d
    ) AS registros_fallan

UNION ALL

-- ==========================================
-- RQ-006 ETC válida
-- ==========================================
SELECT
    'RQ-006',
    'Código ETC válido',
    COUNT(*),
    COUNT(*) FILTER (
        WHERE codigo_etc NOT IN (
            SELECT codigo_etc
            FROM {{ ref('stg_etc') }}
        )
    )
FROM {{ ref('stg_estudiantes') }}

UNION ALL

-- ==========================================
-- RQ-009 Jornada válida
-- ==========================================
SELECT
    'RQ-009',
    'Jornada válida',
    COUNT(*),
    COUNT(*) FILTER (
        WHERE jornada NOT IN
        ('Mañana','Tarde','NOCTURNA','Única')
    )
FROM {{ ref('stg_matriculas') }}

UNION ALL

-- ==========================================
-- RQ-010 Grado válido
-- ==========================================
SELECT
    'RQ-010',
    'Grado válido',
    COUNT(*),
    COUNT(*) FILTER (
        WHERE grado NOT IN (
            'PREJARDIN',
            'JARDIN',
            'TRANSICIÓN',
            'Transición',
            '1','2','3','4','5','6',
            '7','8','9','10','11'
        )
    )
FROM {{ ref('stg_matriculas') }}

UNION ALL

-- ==========================================
-- RQ-011 Estado válido
-- ==========================================
SELECT
    'RQ-011',
    'Estado matrícula válido',
    COUNT(*),
    COUNT(*) FILTER (
        WHERE estado_matricula NOT IN
        ('ACTIVA','CANCELADA')
    )
FROM {{ ref('stg_matriculas') }}

)

SELECT
    regla,
    descripcion,
    registros_evaluados,
    registros_fallan,
    ROUND(
        (registros_evaluados - registros_fallan)::numeric
        * 100
        / registros_evaluados,
        3
    ) AS porcentaje_cumplimiento
FROM resultados
ORDER BY regla