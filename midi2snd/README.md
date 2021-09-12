# midi2snd
A small utility to synthesize midi files to sound files.  For more info visit the [git repo](https://github.com/matthewcpp/midi2snd). 

Build the docker image by running the following command:
```shell
cd docker
docker build -t matthewcpp/midi2snd .
```

To run the container, first bind mount three directories:
- The directory containing the midi file you want to convert to `/src`
- The directory containing to sf2 soundfont to `/sf2`
- The output directory to `/dest`

Then pass file paths relative to the directories that you mounted above.

```shell
docker run --rm -v /path/to/midi_folder:/src -v /path/to/sf2_folder:/sf2 -v /path/to/output_dir:/dest matthewcpp/midi2snd wakening.mid weedsgm3.sf2 wakening_docker.ogg
```
