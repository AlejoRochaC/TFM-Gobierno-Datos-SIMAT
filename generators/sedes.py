import pandas as pd

from config import TOTAL_SEDES


def generar_sedes(municipios):

    registros = []

    municipios_lista = municipios.to_dict("records")

    total_municipios = len(municipios_lista)

    for i in range(1, TOTAL_SEDES + 1):

        municipio = municipios_lista[(i - 1) % total_municipios]

        registros.append({

            "codigo_sede": f"SED{i:05}",

            "nombre_sede": f"Institución Educativa {i}",

            "codigo_municipio": municipio["codigo_municipio"],

            "codigo_etc": municipio["codigo_etc"],

            "estado": "ACTIVA",

            "fecha_carga": pd.Timestamp.now(),

            "origen": "SIMAT_SINTETICO",

            "version_dato": 1

        })

    return pd.DataFrame(registros)