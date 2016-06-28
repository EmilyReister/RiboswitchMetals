#!/bin/bash

BLAST_TEMP_PATH='/home7/ereister/Bioinformatics_Spring2016/blast_results'
OUTPUT_PATH='/home7/ereister/Bioinformatics_Spring2016/pipeline_results'
INPUT_FILE='/home7/ereister/Bioinformatics_Spring2016/raw_data/test.txt'
CLUSTER_SIZE=23
CM='/home7/ereister/Bioinformatics_Spring2016/motifs/motif_files/riboswitch/cmdatabase/riboswitch_cmdatabase.cm'

#python blast_pipeline.py $BLAST_TEMP_PATH $OUTPUT_PATH $CLUSTER_SIZE < $INPUT_FILE

module load CMfinder
module load infernal/1.1.1

##Run first round of CMfinder, searching for single stem loops, then run second

cd $OUTPUT_PATH
for file in **/*.fasta
do
    cmfinder.pl -b -s 1 -n 5 $file
    cmfinder.pl -b -s 2 -n 5 $file
done


for file in **/*.fasta
do
    CombMotif.pl $file $file.motif*
done


##For each cluster set, combine their stockholm files into one    
cd $OUTPUT_PATH

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_0*motif*
    do
	cat $x >> $file/cluster_0.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_1*motif*
    do
        cat $x >> $file/cluster_1.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_2*motif*
    do
        cat $x >> $file/cluster_2.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_3*motif*
    do
        cat $x >> $file/cluster_3.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_4*motif*
    do
        cat $x >> $file/cluster_4.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_5*motif*
    do
        cat $x >> $file/cluster_5.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_6*motif*
    do
        cat $x >> $file/cluster_6.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_7*motif*
    do
        cat $x >> $file/cluster_7.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_8*motif*
    do
        cat $x >> $file/cluster_8.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*cluster_9*motif*
    do
        cat $x >> $file/cluster_9.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*.1.*motif*
    do
        cat $x >> $file/unclustered.combined_motifs.sto
    done
done

for file in $OUTPUT_PATH/*
do
    for x in $file/*.2.*motif*
    do
        cat $x >> $file/unclustered2.combined_motifs.sto
    done
done


##Run stockholm files into cmscan

#cd $OUTPUT_PATH 
#for file in **/**.sto
#do
#    cmscan --tblout $file.cmsc_out.txt $CM $file
#done

##Remove all leftover  cm files

#cd $OUTPUT_PATH
#for file in **/*cm*
#do
#    rm $file
#done

#cd $OUTPUT_PATH
#for file in **/*.h*
#do
#    rm $file
#done

#find ./* -type f -empty