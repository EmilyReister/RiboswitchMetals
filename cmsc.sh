#!/bin/bash                                                                                                                             
OUTPUT_PATH='/home7/ereister/Bioinformatics_Spring2016/pipeline_results'
CM='/home7/ereister/Bioinformatics_Spring2016/motifs/motif_files/riboswitch/main/cmdatabase/cmdatabase.cm'

module load CMfinder
module load infernal/1.1.1

cd $OUTPUT_PATH
for file in **/**.sto
do
    cmscan --tblout $file.cmsc_out.txt $CM $file
done

##Remove all leftover  cm files                                                                                                          

cd $OUTPUT_PATH
for file in **/*cm*
do
    rm $file
done

cd $OUTPUT_PATH
for file in **/*.h*
do
    rm $file
done

cd $OUTPUT_PATH
find ./* -type f -empty