# matthewcpp/framework64-audio

This file will build a compiled version of labmerjamesd's [sfz2n64](https://github.com/lambertjamesd/sfz2n64) tool and provide audio conversion functionality for [framework64](https://github.com/matthewcpp/framework64).

### Creating a Sound Bank

The source file should have a `.ins` file as well as accompanying `.aiff` that will be compressed and built into a sound bank.

```
docker run --rm -v /path/to/files:/workspace -u $(id -u):$(id -g) matthewcpp/sfz2n64 sh /make_sound_effect_bank.sh
```

The resulting `.ctl` and `.tbl` will be placed in the mounted directory.

### Building
```
docker build -t matthewcpp/sfz2n64 .
```
