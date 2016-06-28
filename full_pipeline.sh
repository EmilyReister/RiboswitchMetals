#!/bin/bash
#PBS -q generic 
#PBS -l nodes=1:ppn=12

module load python
module load CMfinder
module load clustal-omega
module load blast
module load infernal/1.1.1

DIR='/home7/ereister/Bioinformatics_Spring2016/scripts/'
BLAST_TEMP_PATH='/home7/ereister/Bioinformatics_Spring2016/blast_results'
OUTPUT_PATH='/home7/ereister/Bioinformatics_Spring2016/pipeline_results/blast.fasta'
INPUT_FILE='/home7/ereister/Bioinformatics_Spring2016/raw_data/test.txt'

cd $DIR

python blast_pipeline.py $BLAST_TEMP_PATH $OUTPUT_PATH < $INPUT_FILE

wait
echo "unloading python 2.."
wait
echo "loading python 3"

module unload python
module load python/3.4.4

out='/home7/ereister/Bioinformatics_Spring2016/pipeline_results/'
python3.4 $out/*

#cmscan cmdatabase.cm Test_Data/{file_from_clustal}