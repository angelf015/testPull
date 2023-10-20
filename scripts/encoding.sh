#!/bin/bash

# Nombre del archivo de entrada
input_file="scripts/code/test1.sql"

# Función para detectar la codificación actual del archivo
detect_encoding() {
    encoding=$(file -bi "$input_file" | sed 's/.*charset=//')
    echo "$encoding"
}

# Función para convertir a UTF-8
convert_to_utf8() {
    original_encoding=$(detect_encoding)
    if [ "$original_encoding" != "utf-8" ]; then
        iconv -f "$original_encoding" -t UTF-8 -o "${input_file%.sql}.utf8.sql" "$input_file"
        echo "El archivo se ha convertido a UTF-8 y se ha guardado como '${input_file%.txt}.utf8.txt'."
    else
        echo "El archivo ya está en UTF-8, no se requiere conversión."
    fi
}

# Llama a la función para realizar la conversión
convert_to_utf8