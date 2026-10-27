# Modelo de Gobierno de Datos para el Sistema Integrado de Matrícula (SIMAT)

## Descripción

Este proyecto implementa un prototipo de **Gobierno de Datos** para el Sistema Integrado de Matrícula (SIMAT), empleando una arquitectura basada en tecnologías de código abierto para la generación, integración, transformación, aseguramiento de la calidad y visualización de la información.

La solución fue desarrollada como parte del **Trabajo Fin de Máster (TFM)** del Máster Universitario en Análisis Masivo de Información de la Universidad Europea de Madrid.

---

# Objetivos

El proyecto tiene como objetivo diseñar e implementar una plataforma que permita:

- Generar datos sintéticos con estructura similar a SIMAT.
- Ejecutar procesos ETL para poblar un Data Warehouse.
- Aplicar transformaciones analíticas mediante dbt.
- Implementar mecanismos de calidad y gobierno de datos.
- Aplicar controles de seguridad mediante Row-Level Security (RLS).
- Visualizar indicadores mediante Metabase.
- Mantener trazabilidad del desarrollo mediante Git y GitHub.

---

# Arquitectura de la solución


<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/f27cb0f7-d278-4a03-b55c-a6c940dfd0cb" />


---

# Tecnologías utilizadas

| Tecnología | Versión |
|------------|---------|
| Python | 3.13 |
| PostgreSQL | 17 |
| dbt | 1.12 |
| dbt-postgres | 1.11 |
| Metabase | 0.64 |
| Git | Última |
| GitHub | Repositorio remoto |

---

# Estructura del proyecto

```text
TFM/
│
├── data/                 Datos de entrada y archivos generados
├── dbt/                  Proyecto dbt
├── docs/                 Diagramas y documentación
├── generators/           Scripts de generación y ETL
├── logs/                 Registros de ejecución
├── Metabase/             Configuración de Metabase
├── notebooks/            Análisis exploratorios
├── sql/                  Scripts SQL
├── tests/                Validaciones
├── utils/                Funciones auxiliares
├── requirements.txt
└── README.md
```

---

# Modelo de datos

El proyecto implementa un esquema dimensional compuesto por:

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/5a2fee3d-37f1-4db8-b72e-5415c885a8a7" />


## Dimensiones

- dim_estudiantes
- dim_sedes
- dim_municipios
- dim_etc

## Hechos

- fact_matriculas

## Esquemas

- staging
- curado
- gobierno
- informe

---

# Funcionalidades implementadas

## Generación de datos

Se generan automáticamente:

- Entidades Territoriales Certificadas (ETC)
- Municipios
- Sedes educativas
- Estudiantes
- Matrículas

con diferentes escenarios de calidad para pruebas.

---

## ETL

El proceso ETL realiza:

- Extracción
- Limpieza
- Transformación
- Carga

hacia el modelo dimensional implementado en PostgreSQL.

---

## Calidad de datos

Se implementan indicadores relacionados con:

- Cobertura
- Completitud
- Integridad
- Operación

publicados mediante la vista:

```
informe.vw_calidad_datos
```

---

## Auditoría

Se registra información relacionada con:

- Fecha de ejecución
- Número de registros cargados
- Duración
- Estado del proceso

mediante la vista:

```
informe.vw_auditoria_carga
```

---

## Gobierno de datos

Se implementan controles de gobierno mediante:

- Row-Level Security (RLS)
- Roles por Entidad Territorial Certificada (ETC)
- Enmascaramiento de información sensible
- Control de acceso basado en perfiles

---

## Visualización

Los indicadores se publican mediante Metabase.

Entre los tableros implementados se incluyen:

- Calidad de datos
- Cobertura
- Estado de matrículas
- Auditoría de procesos


---

# Instalación

## 1. Clonar el repositorio

```bash
git clone https://github.com/AlejoRochaC/TFM-Gobierno-Datos-SIMAT.git
```

---

## 2. Crear entorno virtual

```bash
python -m venv .venv
```

Windows

```bash
.venv\Scripts\activate
```

Linux

```bash
source .venv/bin/activate
```

---

## 3. Instalar dependencias

```bash
pip install -r requirements.txt
```

---

## 4. Configurar PostgreSQL

Crear la base de datos:

```
simat_demo
```

Ejecutar los scripts ubicados en:

```
sql/
```

---

## 5. Ejecutar ETL

```bash
python generators/etl.py
```

---

## 6. Ejecutar dbt

```bash
cd dbt/simat_dbt

dbt deps

dbt run

dbt test
```

---

## 7. Iniciar Metabase

Descargar Metabase desde:

https://www.metabase.com/

Ejecutar:

```bash
java -jar metabase.jar
```

Acceder desde:

```
http://localhost:3000
```

---

# Resultados obtenidos

El proyecto permite:

- Centralizar información educativa.
- Evaluar la calidad de los datos.
- Gestionar accesos mediante RLS.
- Disponer de indicadores analíticos.
- Visualizar resultados mediante dashboards.
- Mantener trazabilidad mediante Git.

---

# Repositorio

Código fuente:

https://github.com/AlejoRochaC/TFM-Gobierno-Datos-SIMAT

---

# Autor

**Alejandro Rocha**

Máster Universitario en Análisis Masivo de Información (BIGDATA)

Universidad Europea de Madrid

2026

---

# Licencia

Este proyecto fue desarrollado con fines académicos como parte del Trabajo Fin de Máster (TFM).

El uso del código queda sujeto a las condiciones definidas por su autor.
