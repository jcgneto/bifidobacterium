#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="roaryp1p2"
#SBATCH --error="roaryp1p2.%J.error"
#SBATCH --output="roaryp1p2.%J.out"

#module load

module load python/3.7
module load roary/3.12

DATAIN=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup1/phylotype2
DATAOUT=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup1/phylotype2

cd $DATAIN

query_pan_genome -a difference --input_set_one 4B7.gff,6M2.gff --input_set_two 8B3.gff,3M6.gff,5B2.gff,5B8.gff,9B2.gff,9B6.gff,8B4.gff,8B9.gff,10M9.gff,8M5.gff,8B6.gff,3B9.gff,5B9.gff,1B5.gff,4B6.gff,4M3.gff

