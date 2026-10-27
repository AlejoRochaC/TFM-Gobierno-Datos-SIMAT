SELECT

    id_matricula,
    id_estudiante,
    codigo_sede,
    codigo_municipio,
    codigo_etc,
    anio,
    grado,
    jornada,
    estado_matricula,
    fecha_matricula,
    fecha_carga,
    origen,
    version_dato

FROM {{ ref('stg_matriculas') }}

WHERE id_matricula IS NOT NULL