SELECT

    codigo_sede,
    nombre_sede,
    codigo_municipio,
    codigo_etc,
    UPPER(TRIM(estado)) AS estado,
    fecha_carga,
    origen,
    version_dato

FROM raw.sedes