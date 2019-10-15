# Here is the program to create your own genus database inside Prokka

prokka-genbank_to_fasta_db bifidobacterium1.gbk (add as many .gbk files as you want - download then from NCBI) > Bifidobacterium.faa
cd-hit -i Bifidobacterium.faa -o Bifidobacterium -T 0 -M 0 -g 1 -s 0.8 -c 0.9
rm -fv Bifidobacterium.faa Bifidobacterium.bak.clstr Bifidobacterium.clstr
makeblastdb -dbtype prot -in Bifidobacterium
mv Bifidobacterium.p* /path/to/prokka/db/genus/


More detailed information can be found here:

https://github.com/tseemann/prokka
