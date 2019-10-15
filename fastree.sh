#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="fasttreeslow"
#SBATCH --error="fasttreeslow.%J.error"
#SBATCH --output="fasttreeslow.%J.out"

#module load

module load fasttree/2.1

DATAIN=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/roaryout_1567831858

cd $DATAIN

FastTree -nt -gtr < core_gene_alignment.aln > bifidophylogeny.tree
