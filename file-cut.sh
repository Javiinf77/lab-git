#!/bin/bash

# Comprobar que existen archivos .fastq en el directorio
shopt -s nullglob
files=(*.fastq)

if [ ${#files[@]} -eq 0 ]; then
    echo "No se encontraron archivos .fastq en el directorio."
    exit 1
fi

# Obtener el número del usuario a partir del nombre de usuario
login="alumno21"
num=$(echo "$login" | grep -o -E '[0-9]+')

# Procesar cada archivo .fastq en el directorio actual
for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "El archivo $file no existe."
        continue
    fi

    # Calcular el número de líneas a cortar
    total_lines=$(wc -l < "$file")
    cut_lines=$((total_lines / num))

    head -n "$cut_lines" "$file" >> "$file"
    echo "Procesado $file: guardadas $cut_lines líneas superiores."
done
