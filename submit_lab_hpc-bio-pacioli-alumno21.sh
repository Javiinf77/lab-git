#!/bin/bash

#SBATCH --job-name=submit_lab_hpc-bio-pacioli-alumno21.sh
#SBATCH --output=file_cut_parallel.out
#SBATCH --error=file_cut_parallel.err
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=02:00:00
#SBATCH --chdir=/home/alumno21/lab3
#SBATCH --partition=hpc-bio-pacioli

srun -n 4 ./file-cut.sh

echo "Trabajo finalizado."

