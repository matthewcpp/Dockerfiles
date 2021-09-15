#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Expected parameters: source_file output_file"
    exit 1
fi

source_file_path="/src/$1"
output_file_path="/dest/$2"

/opt/midi2snd "$source_file_path" "/sf2/soundfont.sf2" "$output_file_path"
