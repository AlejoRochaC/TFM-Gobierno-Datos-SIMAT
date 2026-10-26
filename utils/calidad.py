import random

random.seed(2026)


def insertar_errores(estudiantes, matriculas):

    estudiantes = estudiantes.copy()
    matriculas = matriculas.copy()

    ##########################################
    # Documento duplicado
    ##########################################

    estudiantes.loc[10, "numero_documento"] = estudiantes.loc[0, "numero_documento"]

    ##########################################
    # Documento nulo
    ##########################################

    estudiantes.loc[20, "numero_documento"] = None

    ##########################################
    # Código de sede inexistente
    ##########################################

    matriculas.loc[30, "codigo_sede"] = "SED99999"

    ##########################################
    # Jornada inválida
    ##########################################

    matriculas.loc[40, "jornada"] = "NOCTURNA"

    ##########################################
    # Estado inválido
    ##########################################

    matriculas.loc[50, "estado_matricula"] = "DESCONOCIDO"

    ##########################################
    # ETC inexistente
    ##########################################

    matriculas.loc[60, "codigo_etc"] = "ETC999"

    return estudiantes, matriculas