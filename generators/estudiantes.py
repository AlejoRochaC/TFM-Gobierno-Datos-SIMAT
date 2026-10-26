from faker import Faker
import pandas as pd
import random

from config import TOTAL_ESTUDIANTES

faker = Faker("es_CO")
random.seed(2026)


def generar_estudiantes(sedes):

    registros = []

    sedes_lista = sedes.to_dict("records")

    total_sedes = len(sedes_lista)

    tipos_documento = ["CC", "TI", "RC"]

    generos = ["M", "F"]

    for i in range(1, TOTAL_ESTUDIANTES + 1):

        sede = sedes_lista[(i - 1) % total_sedes]

        registros.append({

            "id_estudiante": f"EST{i:08}",

            "tipo_documento": random.choice(tipos_documento),

            "numero_documento": faker.unique.random_number(digits=10),

            "nombres": faker.first_name(),

            "apellidos": faker.last_name(),

            "genero": random.choice(generos),

            "fecha_nacimiento": faker.date_between(
                start_date="-18y",
                end_date="-5y"
            ),

            "direccion": faker.address(),

            "telefono": faker.phone_number(),

            "codigo_sede": sede["codigo_sede"],

            "codigo_municipio": sede["codigo_municipio"],

            "codigo_etc": sede["codigo_etc"],

            "fecha_carga": pd.Timestamp.now(),

            "origen": "SIMAT_SINTETICO",

            "version_dato": 1

        })

    return pd.DataFrame(registros)