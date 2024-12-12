#!/bin/bash
#SBATCH --job-name=file_cut
#SBATCH --output=output_%j.txt
#SBATCH --error=error_%j.txt
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=01:00:00
#SBATCH --partition=hpc-bio-pacioli


# Crear una lista de archivos fastq
file_list=$(ls *.fastq)

# Usar GNU Parallel para ejecutar el script file-cut.sh en paralelo
echo "$file_list" | parallel -j 4 ./file-cut.sh {}

