# Bifidobacterium dataset
In silico steps to find candidate genes for qPCR 

# Objective

Identifying phylogroup/phylotype specific genes that can be used in a real-time qPCR assay to quantifying their abundance
in fecal samples.

# Common steps taken:

1. Fastqc paired-ended Illumina reads (see fastqc_raw_files.sh)
2. Trimming reads using trimmomatic (see trimming.sh) and fastqc using Fastqc (see fastqc_trimmed_files.sh)
3. De novo assembly with Spades (see spades.sh)
4. Using Quast for quality control by eliminating contigs that were equal to 0 or >= 300 in length, or had a N50 <= 25000
        (see quast.sh)
        python(pandas) script used to filter out quality assemblies:
        data.loc[(data['# contigs'] == 0) | (data['# contigs'] >= 300) | (data['N50'] <= 25000)]
5. Genome annotation with Prokka (see prokka.sh)

Note: with the exception of Prokka, all other analyses were done on the HCC at UNL. Prokka was done on AWS. Please refer to this repository for instruction of how to install Prokka on AWS (https://github.com/jcgneto/installing_conda_and_prokka_aws). The reason to use Prokka on AWS is that it allowed us to customized the reference genome database inside the program to contain a Bifidobacterium genus folder that used specific assemblies chosen by us (the list of assemblies can be found here (https://github.com/jcgneto/bifidobacterium/blob/master/list_reference_bifido_genomes.txt).
See prokka_genus.sh for the program used to create the genus database. Genomes were selected based on the status of the project - it had to be completed!

# Phylogroup analysis:

Phylogroup determination was done using a GTR model-based phylogeny that had as input the core-genome alignment produced
by Roary, and here are the computational steps:

1. First, the common steps above were used to produce the .gff files with Prokka as input for Roary
2. Roary was used to produce the core-genome alignment and pangenome file (gene_presence_absence.csv) (see roary.sh)
3. Phylogenetic tree was constructed using FasTree using a GTR model (see fasttree.sh)
4. Phylogenetic tree visualization was done with Phandango using the bifidobacterium.tree by Fastree and
    gene_presence_absence.csv as input files (https://jameshadfield.github.io/phandango/#/)
5. Phylogroups were determined by inspection of the phylogram and pangenome heatmap. In total, there were 5 phylogroups in
    the dataset containing 18 genomes.

# Phylotype analysis

After defining the phylogroup structure, we have accessed the potential for phylogroup sub-division into phylotypes.
In order to do that the following steps were taken:

1. Run the common (general) steps in the analysis
2. Within each phylogroup (see phylogroup analysis above) we ran the snp-sites analysis using the roary output core_geneme_alignment.aln file 
    as input (see scripts named as snp_sites*.sh),
    followed by filtering putative recombination regions with Gubbins (see scripts named as gubbins*.sh) using the 
    .aln file from snp_sites as input
3. Gubbins not only filter recombination regions but generates a FasTree-based phylogenetic tree using the default         parameters chosen by Gubbins
4. Phylogenetic tree was visualized using Phandango, with the input files being .tree output from Gubbins plus
    gene_presence_absence.csv file from Roary to access the pangenome within each phylogroup
5. The combination of phylogenetic positioning and pangenome repertoire were used to define how many phylotypes existed
    within each phylogroup
    
# Identification of candidate genes that are phylogroup/phylotype specific 

The ultimate goal of the entire analysis was to identifying candidate genes that are uniquely present in either a
phylogroup or phylotype. If the phylogroup could not be broken down into phylotypes, then a candidate gene was defined as
phylogroup specific. Otherwise, phylotype specific genes were found by contrasting the phylotype pangenome data against the remainder genomes belonging to either the same phylogroup or others. Steps taken for that:

1. Run common steps, phylogroup and phylotype analyses as described above
2. Candidate gene identification was done combining the query_pan_genome function inside Roary and customed python/pandas scripts. The query_pan_genome function basically seeks to find genes uniquely present, or shared, between two sets of isolates or genomes. Our customed python scripts does virtually the same. We basically filter out all the shared genes from a pangenome matrix, identify candidates unquely present in each group, and lastly, we cross-check the presence of that gene across all phylogroups using crosstabs. The best candidates were selected on the followinng criteria: 1) Be present only in the target group; 2) Longer contigs or sequences; and 3) By avoinding core functions.

## References

1. Andrews S. (2010). FastQC: a quality control tool for high throughput sequence data. Available online at: http://www.bioinformatics.babraham.ac.uk/projects/fastqc
2. Bolger A.M., et al. (2014). Trimmomatic: a flexible trimmer for Illumina sequence data. Bioinformatics, 30(15):2114-20. 
3. Bankevich A., et al. (2012). SPAdes: A New Genome Assembly Algorithm and Its Applications to Single-Cell Sequencing. Journal of Computational Biology, 19(5): 455–477.
4. Seemann T. (2014). Prokka: rapid prokaryotic genome annotation. Bioinformatics, 30(14):2068-9.
5. Andrew J., et al. (2015). Roary: rapid large-scale prokaryote pan genome analysis. Bioinformatics, 31(22):3691–3693.
6. Croucher N.J. (2014). Rapid phylogenetic analysis of large samples of recombinant bacterial whole genome sequences using Gubbins. Nucleic Acids Research, 43(3): e15. 
7. Page A.J., et al. (2016). SNP-sites: rapid efficient extraction of SNPs from multi-FASTA alignments. Microbial Genomics, 2(4).
8. Price M.N., et al. (2010). FastTree 2--approximately maximum-likelihood trees for large alignments.PLoS One, 5(3):e9490.
