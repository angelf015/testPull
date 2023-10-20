#!/bin/bash

# Nombre del archivo de entrada
input_file="scripts/code/test6.sql\nscripts/code/test5.sql\nscripts/code/test2.sql"

ARR_ACCION=()
while IFS= read -r line; do
  ARR_ACCION+=("$line")
done < <(echo -e "$input_file")

# Crear un archivo temporal único
temp_file=$(mktemp)

# Función para detectar la codificación actual del archivo
for i in "${ARR_ACCION[@]}"; do
  original_encoding=$(file -bi "$i" | sed 's/.*charset=//')
  echo "$original_encoding"

  if [ "$original_encoding" != "UTF-8" ]; then
      # Convertir a UTF-8 y guardar en el archivo temporal
      # iconv -f "$original_encoding" -t UTF-8 "$i" >> "$temp_file"
      iconv -f "$original_encoding" -t UTF-8 "$i" | tr -cd '\11\12\15\40-\176' > "$temp_file"

      echo "El archivo $i se ha convertido a UTF-8 y se ha guardado en el archivo temporal."
  else
      echo "El archivo $i ya está en UTF-8, no se requiere conversión."
      echo "$i" >> "$temp_file"
  fi
done

# Puedes acceder al contenido convertido en el archivo temporal
# o realizar más operaciones según tus necesidades.
cat $temp_file >> "generalsql.sql"

# Limpia el archivo temporal cuando hayas terminado.
# rm "$temp_file"