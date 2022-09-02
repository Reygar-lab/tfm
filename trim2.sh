#!/bin/bash

#SBATCH -p ledley-q
#SBATCH --chdir=/home/alumno21/tfm/samples
#SBATCH -J Trim_Galore
#SBATCH --cpus-per-task 3
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es

for sample in  $(ls)
do 
  /home/alumno21/TrimGalore-0.6.0/trim_galore -j 3 --illumina ${sample} --output_dir /home/alumno21/tfm/samples/trimmed/
done