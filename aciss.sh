#!/bin/bash

module load blast
module load python
module load clustal-omega/1.2.1

#Change this directory to lead to the location of YOUR run.sh script
DIR='/home7/ereister/Bioinformatics_Spring2016/scripts'

cd $DIR
./run.sh
