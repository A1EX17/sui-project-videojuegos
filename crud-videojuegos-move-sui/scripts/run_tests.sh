#!/bin/bash

# Este script se utiliza para ejecutar las pruebas definidas en los archivos de pruebas.

# Compilar el proyecto antes de ejecutar las pruebas
./scripts/build.sh

# Ejecutar las pruebas unitarias
move test tests/unit_tests.move

# Ejecutar las pruebas de integración
move test tests/integration_tests.move

# Mensaje de finalización
echo "Pruebas ejecutadas con éxito."