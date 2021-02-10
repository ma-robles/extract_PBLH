#!/bin/bash
MYPATH="/KRAKEN/DATOS3/"
count=0
DEST="/home/mroldan/PBLHv3/"
cd $MYPATH
pwd
find ./ -name "wrfout_c1h*" | while read line; do
    count=$((count+1))
    echo "line: $(dirname "${line}")"
    fpath=$(dirname "${line}")
    fpath="${fpath:2}"
    echo "path '$fpath'"
    echo "'$count' Processing file '$line' on '$DEST$fpath'"
    mkdir $DEST${fpath}
    cdo -selname,PBLH $line $DEST$line
done
