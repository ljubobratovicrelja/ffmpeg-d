# FFmpeg API 

[![Join the chat at https://gitter.im/ljubobratovicrelja/ffmpeg-d](https://badges.gitter.im/ljubobratovicrelja/ffmpeg-d.svg)](https://gitter.im/ljubobratovicrelja/ffmpeg-d?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Dub package](https://img.shields.io/badge/dub-package-FF4081.svg)](http://code.dlang.org/packages/ffmpeg-d)


This is a D port of the FFmpeg C headers. Please check [FFmpeg website](https://www.ffmpeg.org/) for more information on the application and libraries 


## Usage

The main configuration of the project is set up as a source library. Linking to FFmpeg libraries is defined
in the dub.json. If FFmpeg libraries are not visible in your build system, provide the library directory with ```ldflags``` 
argument in your project's configuration as:

```json
"lflags": ["-L/path/to/ffmpegLibs"],
```

The other two configurations - ```posix-test-executable``` and ```windows-test-executable```, build an executable (in Posix and Windows environments) that prints the associated library versions.
This is useful for checking the versions expected by this binding and the actual library.

## FFmpeg Version

Currently the library is tested with FFmpeg 2.7.6 and 2.8.0 libraries. Newer versions should be tested in future. If you've
already tested this library with newer FFmpeg, please let us know in the gitter chat room!


## Contributing

Any contribution is most welcome! Also, any feedback is very valuable - please give us a hint about the system your using this library on, and
the version of the FFmpeg libraries your linking to your program, so other people could know what configuration will work for them!


## License

This library is licensed under LGPL v2.1 license, as are most files in the FFmpeg libraries. Any use of this library
also follows license rules of the original FFmpeg library. For additional info refer to the 
[FFmpeg license file](https://github.com/FFmpeg/FFmpeg/blob/master/LICENSE.md)

