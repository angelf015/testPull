const fs = require('fs');

const packageLockPath = './package-lock.json'; // Reemplaza con la ruta correcta
const dependencyToRemove = process.argv[2];

// Cargar el package-lock.json
let miObjeto = JSON.parse(fs.readFileSync(packageLockPath, 'utf8'));

// Parámetro que quieres eliminar
let parametrosAEliminar = [dependencyToRemove, 'node_modules/' + dependencyToRemove];

miObjeto = eliminarParametros(miObjeto, parametrosAEliminar);

// Convertir el objeto modificado a formato JSON
let nuevoJSON = JSON.stringify(miObjeto, null, 2);

// Especificar la ruta del archivo donde deseas guardar el resultado
let rutaArchivo = 'package-lock.json';

// Guardar el resultado en el archivo
fs.writeFileSync(rutaArchivo, nuevoJSON);

function eliminarParametros(objeto, parametrosAEliminar) {
    for (let parametroAEliminar of parametrosAEliminar) {
        objeto = eliminarParametro(objeto, parametroAEliminar);
    }
    return objeto;
}

function eliminarParametro(objeto, parametroAEliminar) {
    for (let clave in objeto) {
        if (objeto.hasOwnProperty(clave)) {
            if (typeof objeto[clave] === 'object' && objeto[clave] !== null) {
                // Si la propiedad es un objeto, aplica la función de manera recursiva
                if (clave === parametroAEliminar) {
                    delete objeto[clave];
                } else {
                    objeto[clave] = eliminarParametro(objeto[clave], parametroAEliminar);
                }
            } else if (clave === parametroAEliminar) {
                // Si encontramos el parámetro, lo eliminamos
                delete objeto[clave];
            }
        }
    }
    return objeto;
}