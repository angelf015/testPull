@echo off

:: Inicializar las variables
set "file="
set "path="

:: Definir la variable del directorio base
set "baseDir=folder\%i%"

:: Llamar a los scripts que contienen las funciones específicas
call :SearchTipoZip
call :SearchArchivoJson

:: Verificar si se encontraron los archivos
if not defined file (
    echo No se encontraron archivos *_tipo.zip.
) else (
    echo El archivo tipo es: %file%
)

if not defined path (
    echo No se encontró el archivo archivo.json.
) else (
    echo El archivo JSON es: %path%
)

:: Salir del script principal
exit /b