CREATE TABLE raw.etc (

    codigo_etc VARCHAR(10),
    nombre_etc VARCHAR(100),
    fecha_carga TIMESTAMP,
    origen VARCHAR(50),
    version_dato INTEGER

);

CREATE TABLE raw.municipios (

    codigo_municipio VARCHAR(10),
    nombre_municipio VARCHAR(100),
    codigo_etc VARCHAR(10),
    fecha_carga TIMESTAMP,
    origen VARCHAR(50),
    version_dato INTEGER

);

CREATE TABLE raw.sedes (

    codigo_sede VARCHAR(15),
    nombre_sede VARCHAR(200),
    codigo_municipio VARCHAR(10),
    codigo_etc VARCHAR(10),
    estado VARCHAR(20),
    fecha_carga TIMESTAMP,
    origen VARCHAR(50),
    version_dato INTEGER

);

CREATE TABLE raw.estudiantes (

    id_estudiante VARCHAR(20),
    tipo_documento VARCHAR(5),
    numero_documento VARCHAR(20),
    nombres VARCHAR(150),
    apellidos VARCHAR(150),
    genero VARCHAR(5),
    fecha_nacimiento DATE,
    direccion TEXT,
    telefono VARCHAR(50),
    codigo_sede VARCHAR(15),
    codigo_municipio VARCHAR(10),
    codigo_etc VARCHAR(10),
    fecha_carga TIMESTAMP,
    origen VARCHAR(50),
    version_dato INTEGER

);

CREATE TABLE raw.matriculas (

    id_matricula VARCHAR(20),
    id_estudiante VARCHAR(20),
    anio INTEGER,
    grado VARCHAR(20),
    jornada VARCHAR(30),
    estado_matricula VARCHAR(30),
    fecha_matricula DATE,
    codigo_sede VARCHAR(15),
    codigo_municipio VARCHAR(10),
    codigo_etc VARCHAR(10),
    fecha_carga TIMESTAMP,
    origen VARCHAR(50),
    version_dato INTEGER

);


