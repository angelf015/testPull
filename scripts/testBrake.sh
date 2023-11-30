#!/bin/bash

STR="scripts/Accion/Comercio.sql\ndos\ntres\ncuatro"


ARR_ACCION=()
while IFS= read -r line; do
  ARR_ACCION+=("$line")
done < <(echo -e "$STR")

for path in "${!ARR_ACCION[@]}";do
  echo "Elemento: ${ARR_ACCION[path]}"
  if [ "${ARR_ACCION[path]}" != "scripts/Accion/Comercio.sql" ] && [ "${ARR_ACCION[path]}" != "scripts/Accion/Comercio.sql.UT" ]; then
    echo "Son diferentes"
  else
    echo "Son iguales"
    break
  fi
done