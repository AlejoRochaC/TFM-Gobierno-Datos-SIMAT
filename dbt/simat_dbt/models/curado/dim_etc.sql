SELECT

    codigo_etc,
    nombre_etc,
    fecha_carga,
    origen,
    version_dato

FROM {{ ref('stg_etc') }}

WHERE codigo_etc IS NOT NULL