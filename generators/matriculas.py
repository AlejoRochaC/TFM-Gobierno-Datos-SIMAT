import pandas as pd
import random

from config import TOTAL_MATRICULAS

random.seed(2026)


def generar_matriculas(estudiantes):

    grados = [
        "Transición",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11"
    ]

    jornadas = [
        "Mañana",
        "Tarde",
        "Única"
    ]

    estados = [
        "ACTIVA",
        "ACTIVA",
        "ACTIVA",
        "ACTIVA",
        "CANCELADA"
    ]

    registros = []

    estudiantes_lista = estudiantes.to_dict("records")

    total_estudiantes = len(estudiantes_lista)

    for i in range(1, TOTAL_MATRICULAS + 1):

        estudiante = estudiantes_lista[(i - 1) % total_estudiantes]

        registros.append({

            "id_matricula": f"MAT{i:08}",

            "id_estudiante": estudiante["id_estudiante"],

            "anio": 2026,

            "grado": random.choice(grados),

            "jornada": random.choice(jornadas),

            "estado_matricula": random.choice(estados),

            "fecha_matricula": pd.Timestamp("2026-01-15"),

            "codigo_sede": estudiante["codigo_sede"],

            "codigo_municipio": estudiante["codigo_municipio"],

            "codigo_etc": estudiante["codigo_etc"],

            "fecha_carga": pd.Timestamp.now(),

            "origen": "SIMAT_SINTETICO",

            "version_dato": 1

        })

    return pd.DataFrame(registros)