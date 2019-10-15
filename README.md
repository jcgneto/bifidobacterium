# Bifidobacterium dataset
Finding candidate genes for qPCR 

# Objective

Identifying phylogroup/phylotype specific genes that can be used in a real-time qPCR assay to quantifying their abundance
in fecal samples.

# Common steps taken:

1. Fastqc paired-ended Illumina reads (see fastqc_raw_files.sh)
2. Trimming reads using trimmomatic (see fastqc_trimmed_files.sh)
3. De novo assembly with Spades (see spades.sh)
4. Using Quast for quality control by eliminating contigs that were equal to 0 or >= 300 in length, or had a N50 <= 25000
        (see quast.sh)
        python(pandas) script used to filter out quality assemblies:
        data.loc[(data['# contigs'] == 0) | (data['# contigs'] >= 300) | (data['N50'] <= 25000)]
5. Genome annotation with prokka (see prokka.sh)

# Phylogroup analysis:

Phylogroup determination was done using a GTR model-based phylogeny that had as input the core-genome alignment produced
by roary, and here are the computational steps:

1. First, the common steps above were used to produce the .gff files with prokka as input for roary
2. Roary was used to produce the core-genome alignment and pangenome file (gene_presence_absence.csv) (see roary.sh)
3. Phylogenetic tree was constructed using Fastree using a GTR model (see fasttree.sh)
4. Phylogenetic tree visualization was done with Phandango using the bifidobacterium.tree by Fastree and
    gene_presence_absence.csv as input files (https://jameshadfield.github.io/phandango/#/)
5. Phylogroups were determined by inspection of the phylogram and pangenome heatmap. In total, there were 5 phylogroups in
    the dataset containing 18 genomes.

# Phylotype analysis



# Identification of candidate genes that are phylogroup/phylotype specific 




