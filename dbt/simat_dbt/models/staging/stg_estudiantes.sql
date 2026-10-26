SELECT

    id_estudiante,
    tipo_documento,
    TRIM(numero_documento) AS numero_documento,
    UPPER(TRIM(nombres)) AS nombres,
    UPPER(TRIM(apellidos)) AS apellidos,
    UPPER(TRIM(genero)) AS genero,
    fecha_nacimiento,
    direccion,
    telefono,
    codigo_sede,
    codigo_municipio,
    codigo_etc,
    fecha_carga,
    origen,
    version_dato

FROM raw.estudiantes