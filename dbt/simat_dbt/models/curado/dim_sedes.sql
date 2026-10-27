SELECT
    codigo_sede,
    nombre_sede,
    codigo_municipio,
    codigo_etc,
    estado,
    fecha_carga,
    origen,
    version_dato

FROM {{ ref('stg_sedes') }}

WHERE codigo_sede IS NOT NULL
  AND codigo_municipio IS NOT NULL
  AND codigo_etc IS NOT NULL