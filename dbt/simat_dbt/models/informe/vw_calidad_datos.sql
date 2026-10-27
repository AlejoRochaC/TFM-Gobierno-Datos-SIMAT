{{ config(materialized='view') }}

WITH indicadores AS (

    SELECT
        'Cobertura' AS dimension,
        'Total estudiantes' AS indicador,
        COUNT(*)::numeric AS valor,
        'Registros' AS unidad
    FROM {{ ref('dim_estudiantes') }}

    UNION ALL

    SELECT
        'Cobertura',
        'Total matriculas',
        COUNT(*)::numeric,
        'Registros'
    FROM {{ ref('fact_matriculas') }}

    UNION ALL

    SELECT
        'Cobertura',
        'Total sedes',
        COUNT(*)::numeric,
        'Registros'
    FROM {{ ref('dim_sedes') }}

    UNION ALL

    SELECT
        'Cobertura',
        'Total municipios',
        COUNT(*)::numeric,
        'Registros'
    FROM {{ ref('dim_municipios') }}

    UNION ALL

    SELECT
        'Cobertura',
        'Total ETC',
        COUNT(*)::numeric,
        'Registros'
    FROM {{ ref('dim_etc') }}

    UNION ALL

    SELECT
        'Completitud',
        'Estudiantes con documento',
        ROUND(
            100.0 * COUNT(numero_documento) / NULLIF(COUNT(*),0),
            2
        ),
        '%'
    FROM {{ ref('dim_estudiantes') }}

    UNION ALL

    SELECT
        'Integridad',
        'Estudiantes con sede valida',
        ROUND(
            100.0 * COUNT(s.codigo_sede) / NULLIF(COUNT(*),0),
            2
        ),
        '%'
    FROM {{ ref('dim_estudiantes') }} e
    LEFT JOIN {{ ref('dim_sedes') }} s
        ON e.codigo_sede = s.codigo_sede

    UNION ALL

    SELECT
        'Operacion',
        'Matriculas activas',
        ROUND(
            100.0 * COUNT(*) FILTER (
                WHERE estado_matricula = 'ACTIVA'
            ) / NULLIF(COUNT(*),0),
            2
        ),
        '%'
    FROM {{ ref('fact_matriculas') }}

    UNION ALL

    SELECT
        'Operacion',
        'Matriculas canceladas',
        ROUND(
            100.0 * COUNT(*) FILTER (
                WHERE estado_matricula = 'CANCELADA'
            ) / NULLIF(COUNT(*),0),
            2
        ),
        '%'
    FROM {{ ref('fact_matriculas') }}

)

SELECT
    dimension,
    indicador,
    valor,
    unidad
FROM indicadores
ORDER BY
    dimension,
    indicador