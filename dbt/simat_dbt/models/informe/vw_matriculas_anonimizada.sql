{{ config(materialized='view') }}

SELECT

    id_matricula,
    2026 AS vigencia,

    grado,
    jornada,
    estado_matricula,
    fecha_matricula,

    id_estudiante,

    tipo_documento,

    -- Documento anonimizado
    CONCAT(
        LEFT(numero_documento,2),
        '******',
        RIGHT(numero_documento,2)
    ) AS numero_documento,

    -- Nombre anonimizado
    CONCAT(
        LEFT(nombres,1),
        '***'
    ) AS nombres,

    CONCAT(
        LEFT(apellidos,1),
        '***'
    ) AS apellidos,

    genero,
    fecha_nacimiento,

    codigo_sede,
    nombre_sede,

    codigo_municipio,
    nombre_municipio,

    codigo_etc,
    nombre_etc

FROM {{ ref('vw_matriculas') }}