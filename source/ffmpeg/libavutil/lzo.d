/*
 * LZO 1x decompression
 * copyright (c) 2006 Reimar Doeffinger
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
module ffmpeg.libavutil.lzo;
extern (C) @nogc nothrow:

/**
 * @defgroup lavu_lzo LZO
 * @ingroup lavu_crypto
 *
 * @{
 */

/** @name Error flags returned by av_lzo1x_decode
 * @{ */
/// end of the input buffer reached before decoding finished
enum AV_LZO_INPUT_DEPLETED = 1;
/// decoded data did not fit into output buffer
enum AV_LZO_OUTPUT_FULL = 2;
/// a reference to previously decoded data was wrong
enum AV_LZO_INVALID_BACKPTR = 4;
/// a non-specific error in the compressed bitstream
enum AV_LZO_ERROR = 8;
/** @} */

enum AV_LZO_INPUT_PADDING = 8;
enum AV_LZO_OUTPUT_PADDING = 12;

/**
 * @brief Decodes LZO 1x compressed data.
 * @param out output buffer
 * @param outlen size of output buffer, number of bytes left are returned here
 * @param in input buffer
 * @param inlen size of input buffer, number of bytes left are returned here
 * @return 0 on success, otherwise a combination of the error flags above
 *
 * Make sure all buffers are appropriately padded, in must provide
 * AV_LZO_INPUT_PADDING, out must provide AV_LZO_OUTPUT_PADDING additional bytes.
 */
int av_lzo1x_decode (void* out_, int* outlen, const(void)* in_, int* inlen);

/**
 * @}
 */

/* AVUTIL_LZO_H */
