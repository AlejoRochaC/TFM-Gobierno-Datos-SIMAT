SELECT
    id_estudiante,
    tipo_documento,
    numero_documento,
    nombres,
    apellidos,
    genero,
    fecha_nacimiento,
    direccion,
    telefono,
    codigo_sede,
    codigo_municipio,
    codigo_etc,
    fecha_carga,
    origen,
    version_dato

FROM {{ ref('stg_estudiantes') }}

WHERE numero_documento IS NOT NULL
  AND codigo_etc IS NOT NULL
  AND codigo_sede IS NOT NULL