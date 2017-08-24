#!/bin/bash

rm -rf $JBROWSE_DATA;
mkdir -p $JBROWSE_DATA/raw/;

prepare-refseqs.pl --fasta $DATA_DIR/maize/GCA_000005005.6_B73_RefGen_v4_genomic.fna --out $JBROWSE_DATA;

generate-names.pl --safeMode -v --out $JBROWSE_DATA;

if [ ! -e $JBROWSE_DATA/raw/volvox ]; then
    ln -s $DATA_DIR/maize/ $JBROWSE_DATA/raw/maize;
fi;
