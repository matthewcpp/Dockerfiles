#!/bin/sh

cd workspace

types_needing_conversion="ogg wav"
ins_file="NONE"

sound_files=`ls`
for sound_file in $sound_files ; do
	extension="${sound_file##*.}"

	for file_type in $types_needing_conversion ; do
		if [ "$extension" = "$file_type" ]; then
			/snd2aiff ${sound_file}
			filename="${sound_file%.*}"
			/sfz2n64 -o ${filename}.aifc ${filename}.aiff
		fi
	done

	if [ "$extension" = "aiff" ]; then
		/sfz2n64 -o ${sound_file/aiff/aifc} $sound_file
	fi

	if [ "$extension" = "ins" ]; then
		ins_file=$sound_file
	fi
done

if [ "$ins_file" != "NONE" ]; then
	basename="${ins_file%.*}"
	echo "building sound effect bank: $ins_file --> ${basename}.ctl"
	/sfz2n64 -o "${basename}.ctl" $ins_file
else
	echo "Unable to create sound effect bank: No .ins file present"
	exit 1
fi
