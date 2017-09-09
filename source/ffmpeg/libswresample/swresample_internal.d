/*
 * Copyright (C) 2011-2013 Michael Niedermayer (michaelni@gmx.at)
 *
 * This file is part of libswresample
 *
 * libswresample is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libswresample is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with libswresample; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */
module ffmpeg.libswresample.swresample_internal;

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



