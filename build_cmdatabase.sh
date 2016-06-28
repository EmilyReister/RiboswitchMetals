#!/bin/bash
#PBS -q fatnodes
#PBS -N build_cmdatabase

module load infernal/1.1.1

filepath=/home7/ereister/Bioinformatics_Spring2016/motifs/motif_files/riboswitch/main

cat $filepath/* >> $filepath/combined_riboswitches.sto

mkdir $filepath/cmdatabase

cmbuild $filepath/cmdatabase/cmdatabase.cm $filepath/combined_riboswitches.sto

cmcalibrate $filepath/cmdatabase/cmdatabase.cm

cmpress $filepath/cmdatabase/cmdatabase.cm