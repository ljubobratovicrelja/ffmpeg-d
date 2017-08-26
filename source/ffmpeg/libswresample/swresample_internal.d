module ffmpeg.libswresample.swresample_internal;

import ffmpeg.libswresample.swresample_version;

import std.stdint;

import ffmpeg.libavutil.channel_layout;
import ffmpeg.libavutil.samplefmt;

@nogc nothrow extern(C):

enum SWR_CH_MAX = 64;

enum SQRT3_2 = 1.22474487139158904909;  /* sqrt(3/2) */

enum NS_TAPS = 20;

struct AudioData{
    uint8_t[SWR_CH_MAX] *ch;    ///< samples buffer per channel
    uint8_t *data;              ///< samples buffer
    int ch_count;               ///< number of channels
    int bps;                    ///< bytes per sample
    int count;                  ///< number of samples
    int planar;                 ///< 1 if planar audio, 0 otherwise
    AVSampleFormat fmt;         ///< sample format
}



