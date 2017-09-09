# FFmpeg API 

[![Join the chat at https://gitter.im/ljubobratovicrelja/ffmpeg-d](https://badges.gitter.im/ljubobratovicrelja/ffmpeg-d.svg)](https://gitter.im/ljubobratovicrelja/ffmpeg-d?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Dub package](https://img.shields.io/badge/dub-package-FF4081.svg)](http://code.dlang.org/packages/ffmpeg-d)

This is a D port of the FFmpeg C headers. Please check [FFmpeg website](https://www.ffmpeg.org/) for more information on the application and libraries 


## Usage

_NOTE: This branch is compatible with ffmpeg 3.2.x, for other versions please see the other branches for usage information._

### Adding to DUB

To include `ffmpeg-d` in your dub project add the following dependency to your dub.json file.

```
"ffmpeg-d": "~>3.2.0"
```

---

The main configuration of the project is set up as a source library. Linking to FFmpeg libraries is defined
in the dub.json. If FFmpeg libraries are not visible in your build system, provide the library directory with ```ldflags``` 
argument in your project's configuration as:

```json
"lflags": ["-L/path/to/ffmpegLibs"],
```


### Examples

There are a few examples in the examples directory, these can be compiled to working executables using DUB:

```
dub build -c remux_example
```

Other examples written in C can be found on the main FFMpeg site: [https://www.ffmpeg.org/doxygen/3.2/examples.html](https://www.ffmpeg.org/doxygen/3.2/examples.html)


### OS X

It is noted that FFmpeg compiled on OS X with clang fails linking with DMD. Workaround is to install the FFmpeg libraries using **Homebrew**. See the [issue #1](https://github.com/ljubobratovicrelja/ffmpeg-d/issues/1) for more info.


## Testing

Running D unit tests with dub:
```
dub test
```

... will print the associated FFmpeg library versions. This is useful for checking versions expected by this binding and the actual library.


## FFmpeg Version

Currently the library has been tested with FFmpeg 2.7.6, 2.8.0, 3.0.9, 3.1.10, 3.2.7 libraries.

Please use the branch of this repo that corresponds to the same major.minor version of FFmpeg. For example use `release/3.2` with FFmpeg 3.2.7.

Newer versions should be tested in future. If you've already tested this library with newer FFmpeg, please let us know in the gitter chat room!


## Contributing

Any contribution is most welcome! Also, any feedback is very valuable - please give us a hint about the system your using this library on, and
the version of the FFmpeg libraries your linking to your program, so other people could know what configuration will work for them!


## License

This library is licensed under LGPL v2.1 license, as are most files in the FFmpeg libraries. Any use of this library
also follows license rules of the original FFmpeg library. For additional info refer to the 
[FFmpeg license file](https://github.com/FFmpeg/FFmpeg/blob/master/LICENSE.md)

