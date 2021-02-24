# matthewcpp/framework64-audio

This file will build a compiled version of labmerjamesd's [sfz2n64](https://github.com/lambertjamesd/sfz2n64) tool and provide audio conversion functionality for [framework64](https://github.com/matthewcpp/framework64).

### Creating a Sound Bank

All sounds and the ins file should be placed in the root of the mounted directory.
Sounds can be in ogg, wav, aiff or aifc format.
Sounds in supported formats that are not in aifc will automatically be converted during processing.
The instrument file should reference files with an aifc extension only.
For example `soung.ogg` should be referenced in the .ins file as `sound.aifc`.

```
docker run --rm -v /path/to/files:/workspace -u $(id -u):$(id -g) matthewcpp/framework64-audio sh /make_sound_effect_bank.sh
```

The resulting `.ctl` and `.tbl` will be placed in the mounted directory.

### Building
```
docker build -t matthewcpp/framework64-audio .
```
