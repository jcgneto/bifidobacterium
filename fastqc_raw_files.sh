#!/bin/bash

#SBATCH --partition=benson
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=72:00:00
#SBATCH --mem=100GB
#SBATCH --job-name="fastqcraw"
#SBATCH --error="fastaqcraw.%J.error"
#SBATCH --output="fastaqcraw.%J.out"

# Module load 

module load fastqc/0.11

# Enter directory

DATAIN=/work/benson/netogomes/bifido/data

cd $DATAIN

# Run fastqc

fastqc *.fastq
