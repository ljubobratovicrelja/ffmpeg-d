# FFmpeg API 

- This is a D port of the FFmpeg C headers, created with dstep with some manual fixes.
- The targeted ffmpeg version: 4.4.1.
- The binding is mainly untested, but I believe it is near to a complete binding.

This is a D port of the FFmpeg C headers. Please check [FFmpeg website](https://www.ffmpeg.org/) for more information on the application and libraries 


## Usage

_NOTE: This branch is compatible with ffmpeg 4.4.x, for other versions please see the other branches for usage information._


The main configuration of the project is set up as a source library. Linking to FFmpeg libraries is defined
in the dub.json. If FFmpeg libraries are not visible in your build system, provide the library directory with ```ldflags``` 
argument in your project's configuration as:

```json
"lflags": ["-L/path/to/ffmpegLibs"],
```

## Contributing

Any contribution is most welcome! Also, any feedback is very valuable - please give us a hint about the system your using this library on, and
the version of the FFmpeg libraries your linking to your program, so other people could know what configuration will work for them!


## License

This library is licensed under LGPL v2.1 license, as are most files in the FFmpeg libraries. Any use of this library
also follows license rules of the original FFmpeg library. For additional info refer to the 
[FFmpeg license file](https://github.com/FFmpeg/FFmpeg/blob/master/LICENSE.md)

