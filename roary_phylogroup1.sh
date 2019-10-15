#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="roaryphylogroup1"
#SBATCH --error="roaryphylogroup1.%J.error"
#SBATCH --output="roaryphylogroup1.%J.out"

#module load

module load python/3.7
module load roary/3.12

DATAIN=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup1
DATAOUT=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup1

cd $DATAIN


roary -e --mafft -p 12 -i 95 -cd 100 *.gff -f $DATAOUT

