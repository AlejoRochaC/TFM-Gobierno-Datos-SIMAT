SELECT
    tipo_documento,
    numero_documento,
    COUNT(*) cantidad
FROM {{ ref('stg_estudiantes') }}
GROUP BY
    tipo_documento,
    numero_documento
HAVING COUNT(*) > 1