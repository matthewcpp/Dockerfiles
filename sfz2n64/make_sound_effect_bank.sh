#!/usr/bin/env bash

# First, Compress all aiff files into aifc

aiff_files=`ls workspace/*.aiff`
for aiff_file in $aiff_files
do
   echo "Compressing: $aiff_file --> ${aiff_file/aiff/aifc}"
   /sfz2n64 -o ${aiff_file/aiff/aifc} $aiff_file
done

# Build the sound bank from the instrument file
ins_files=`ls workspace/*.ins`
for ins_file in $ins_files
do
	basename="${ins_file%.*}"
	echo "building $ins_file --> ${basename}.ctl"
	/sfz2n64 -o "${basename}.ctl" $ins_file
	break
done
