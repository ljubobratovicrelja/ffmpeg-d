/*
 * audio conversion
 * Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>
 * Copyright (c) 2008 Peter Ross
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

module ffmpeg.libswresample.audioconvert;


import std.stdint;

import ffmpeg.libavutil.avutil;
import ffmpeg.libavutil.samplefmt;
import ffmpeg.libswresample.swresample_version;
import ffmpeg.libswresample.swresample_internal;


@nogc nothrow extern(C):

alias conv_func_type = void function (ubyte* po, const(ubyte)* pi, int is_, int os, ubyte* end);
alias simd_func_type = void function (ubyte** dst, const(ubyte*)* src, int len);

struct AudioConvert {
    int channels;
    int in_simd_align_mask;
    int out_simd_align_mask;
    void function () conv_f;
    void function () simd_f;
    const(int)* ch_map;
    ubyte[8] silence; ///< silence input sample
}

/**
 * Create an audio sample format converter context
 * @param out_fmt Output sample format
 * @param in_fmt Input sample format
 * @param channels Number of channels
 * @param flags See AV_CPU_FLAG_xx
 * @param ch_map list of the channels id to pick from the source stream, NULL
 *               if all channels must be selected
 * @return NULL on error
 */
AudioConvert *swri_audio_convert_alloc(AVSampleFormat out_fmt,
                                       AVSampleFormat in_fmt,
                                       int channels, const int *ch_map,
                                       int flags);

/**
 * Free audio sample format converter context.
 * and set the pointer to NULL
 */
void swri_audio_convert_free(AudioConvert **ctx);

/**
 * Convert between audio sample formats
 * @param[in] out array of output buffers for each channel. set to NULL to ignore processing of the given channel.
 * @param[in] in array of input buffers for each channel
 * @param len length of audio frame size (measured in samples)
 */
int swri_audio_convert(AudioConvert *ctx, AudioData *out_a_b, AudioData *in_a_b, int len);

//#endif /* SWRESAMPLE_AUDIOCONVERT_H */
