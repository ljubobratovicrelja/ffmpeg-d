# FFmpeg API 

This is a D port of the FFmpeg C headers. Please check https://www.ffmpeg.org/ (FFmpeg website) for more information on the application and libraries 

### Usage

The main configuration to use this a source library is the `include` configuration. Use the following to get the correct include

    "dependencies": {
        "ffmpeg-d": ">=2.4.3"
    },
    "subConfigurations": {
        "somepackage": "include"
    },
    "libs": [
        "avcodec",
        "avformat",
        "avutil",
        "avfilter"
    ]

If your FFmpeg libav* libraries are not installed in the place usually used for libraries you will need additional build configuration
to use ffmpeg-d properly.

E.g. here is the configuration for a Posix OS that installs to `/usr/local/lib`

    "configurations": [
        {
                "name": "posix",
                "targetType": "executable",
                "platforms": ["Posix"],
                "lflags": ["-L$LD_LIBRARY_PATH"],
        }
    ]

The other two configurations build an executable (in Posix and Windows environments) that prints the associated library versions.
This is useful for checking the versions expected by this binding and the actual library.

