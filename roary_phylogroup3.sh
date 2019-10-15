#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="roaryphylogroup3"
#SBATCH --error="roaryphylogroup3.%J.error"
#SBATCH --output="roaryphylogroup3.%J.out"

#module load

module load python/3.7
module load roary/3.12

DATAIN=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup3
DATAOUT=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup3

cd $DATAIN


roary -e --mafft -p 12 -i 95 -cd 100 *.gff -f $DATAOUT

