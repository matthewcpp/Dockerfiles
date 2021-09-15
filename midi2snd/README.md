# midi2snd
A small utility to synthesize midi files to sound files.  For more info visit the [git repo](https://github.com/matthewcpp/midi2snd). 

Build the docker image by running the following command:
```shell
docker build -t matthewcpp/midi2snd .
```

To run the container, bind mount two directories:
1. The directory containing the midi file you want to convert to `/src`
1. The output directory to `/dest`

Additionally, pass file paths for the source and output files relative to the directories that you mounted above.

```shell
docker run --rm -v /path/to/midi_folder:/src -v /path/to/output_dir:/dest matthewcpp/midi2snd source.mid converted.ogg
```


### Credits

The soundfont bundled with this package was created by Rich Weed.  For additional information visit [Rich's website](http://www.simpilot.net/~richnagel/#information).