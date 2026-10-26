import pandas as pd

from config import TOTAL_ETC, TOTAL_MUNICIPIOS


def generar_etc():

    registros = []

    for i in range(1, TOTAL_ETC + 1):

        registros.append({

            "codigo_etc": f"ETC{i:03}",

            "nombre_etc": f"Entidad Territorial {i}",

            "fecha_carga": pd.Timestamp.now(),

            "origen": "SIMAT_SINTETICO",

            "version_dato": 1

        })

    return pd.DataFrame(registros)

from config import TOTAL_ETC, TOTAL_MUNICIPIOS


def generar_municipios():

    registros = []

    for i in range(1, TOTAL_MUNICIPIOS + 1):

        codigo_etc = f"ETC{((i - 1) % TOTAL_ETC) + 1:03}"

        registros.append({

            "codigo_municipio": f"MUN{i:04}",

            "nombre_municipio": f"Municipio {i}",

            "codigo_etc": codigo_etc,

            "fecha_carga": pd.Timestamp.now(),

            "origen": "SIMAT_SINTETICO",

            "version_dato": 1

        })

    return pd.DataFrame(registros)