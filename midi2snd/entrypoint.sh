#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Expected parameters: source_file soundfont output_file"
    exit 1
fi

source_file_path="/src/$1"
soundfont_path="/sf2/$2"
output_file_path="/dest/$3"

/opt/midi2snd "$source_file_path" "$soundfont_path" "$output_file_path"
