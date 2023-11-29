@echo off
:: Archivo con funciones de búsqueda específicas

:: Función para buscar archivos *_tipo.zip
:SearchTipoZip
for /r "%baseDir%" %%F in (*_tipo.zip) do (
    set "file=%%F"
    set "filePath=%%~dpF"
    if not "!filePath:tipo=!"=="!filePath!" (
        goto :eof
    )
)
goto :eof

:: Función para buscar el archivo archivo.json
:SearchArchivoJson
for /r "%baseDir%" %%F in (archivo.json) do (
    set "path=%%F"
    set "pathDir=%%~dpF"
    if not "!pathDir:tipo=!"=="!pathDir!" (
        goto :eof
    )
)
goto :eof