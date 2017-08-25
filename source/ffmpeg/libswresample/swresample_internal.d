module ffmpeg.libswresample.swresample_internal;

import ffmpeg.libswresample.swresample_version;
import ffmpeg.libavutil.channel_layout;

@nogc nothrow extern(C):

enum SWR_CH_MAX = 64;

enum SQRT3_2 = 1.22474487139158904909;  /* sqrt(3/2) */

enum NS_TAPS = 20;





