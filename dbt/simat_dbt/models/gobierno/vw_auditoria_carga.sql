SELECT

    CURRENT_DATE AS fecha_consulta,

    COUNT(*) AS total_matriculas,

    COUNT(DISTINCT id_estudiante) AS total_estudiantes,

    COUNT(DISTINCT codigo_sede) AS total_sedes,

    COUNT(DISTINCT codigo_municipio) AS total_municipios,

    COUNT(DISTINCT codigo_etc) AS total_etc,

    MAX(fecha_carga) AS ultima_carga

FROM curado.fact_matriculas