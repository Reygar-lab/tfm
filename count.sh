#!/bin/bash
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno21/tfm/hisat-alignment/
#SBATCH -J featureCounts
#SBATCH --cpus-per-task 6
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es

# -M multimapping
# -T 5 single end

for file in $(ls *.gz.bam.sorted)
do
      /home/alumno21/subread-2.0.3-source/bin/featureCounts -M -T 5 -t exon -g gene_id -a /home/alumno21/tfm/samples/trimmed/genome.gtf -o /home/alumno21/tfm/hisat-alignment/hisatcounts/$file.counts  $file
done
