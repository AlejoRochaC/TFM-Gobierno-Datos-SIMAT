SELECT
    codigo_municipio,
    nombre_municipio,
    codigo_etc,
    fecha_carga,
    origen,
    version_dato

FROM {{ ref('stg_municipios') }}

WHERE codigo_municipio IS NOT NULL
  AND codigo_etc IS NOT NULL