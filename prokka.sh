#!/bin/bash

DATAIN=/home/ubuntu/contigs
DATAOUT=/home/ubuntu/contigs/prokkaout
cd $DATAIN

for F in *.fa; do 
  N=$(basename $F .fa) ; 
  prokka --kingdom Bacteria --genus Bifidobacterium --locustag $N --outdir $DATAOUT/$N --prefix $N  $F ; 
done
