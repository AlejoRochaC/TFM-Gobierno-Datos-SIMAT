SELECT

    /* Hechos */
    f.id_matricula,
    f.anio,
    f.grado,
    f.jornada,
    f.estado_matricula,
    f.fecha_matricula,

    /* Estudiante */
    e.id_estudiante,
    e.tipo_documento,
    e.numero_documento,
    e.nombres,
    e.apellidos,
    e.genero,
    e.fecha_nacimiento,

    /* Sede */
    s.codigo_sede,
    s.nombre_sede,

    /* Municipio */
    m.codigo_municipio,
    m.nombre_municipio,

    /* ETC */
    etc.codigo_etc,
    etc.nombre_etc

FROM {{ ref('fact_matriculas') }} f

LEFT JOIN {{ ref('dim_estudiantes') }} e
       ON f.id_estudiante = e.id_estudiante

LEFT JOIN {{ ref('dim_sedes') }} s
       ON f.codigo_sede = s.codigo_sede

LEFT JOIN {{ ref('dim_municipios') }} m
       ON f.codigo_municipio = m.codigo_municipio

LEFT JOIN {{ ref('dim_etc') }} etc
       ON f.codigo_etc = etc.codigo_etc