#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="snpsitesphylogroup1"
#SBATCH --error="snpsitesphylogroup1.%J.error"
#SBATCH --output="snpsitesphylogroup1.%J.out"

#module load

module load snp-sites/2.4

DATAIN=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup1/phylogroup1_1568142739

cd $DATAIN

# Run snp-sites

snp-sites core_gene_alignment.aln -m -p -o core_gene_alignment_roary_snps_phylogroup1

