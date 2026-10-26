from pathlib import Path


def exportar_csv(df, nombre_archivo):

    ruta = Path("../data/raw")

    ruta.mkdir(parents=True, exist_ok=True)

    archivo = ruta / f"{nombre_archivo}.csv"

    df.to_csv(
        archivo,
        index=False,
        encoding="utf-8-sig"
    )

    print(f"Archivo exportado: {archivo}")