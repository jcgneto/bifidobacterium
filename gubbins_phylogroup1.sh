#!/bin/bash
#SBATCH --partition=benson
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=100GB
#SBATCH --job-name="gubbinssnpsitesphy1"
#SBATCH --error="gubbinssnpsitesphy1.%J.error"
#SBATCH --output="gubbinssnpsitesphy1.%J.out"

#module load

module load anaconda/4.6
module load raxml/8.2
module load fasttree/2.1
module load biopython/py36/1.71
module load gubbins/2.3

DATAIN=/work/benson/netogomes/bifido/data/trimmed_files/paired/assemblies/contigs/prokkaoutput/roary/phylogroup1/phylogroup1_1568142739

cd $DATAIN

run_gubbins.py -t fasttree -i 100 -m 3 -v core_gene_alignment_roary_snps_phylogroup1.snp_sites.aln

