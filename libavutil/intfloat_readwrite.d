/*
 * copyright (c) 2005 Michael Niedermayer <michaelni@gmx.at>
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
module ffmpeg.libavutil.intfloat_readwrite;
import std.stdint;

extern(C) {
/* IEEE 80 bits extended float */
struct AVExtFloat {
      uint8_t exponent[2];
      uint8_t mantissa[8];
}
  
deprecated double av_int2dbl(int64_t v);
deprecated float av_int2flt(int32_t v);
deprecated double av_ext2dbl(const AVExtFloat ext);
deprecated int64_t av_dbl2int(double d);
deprecated int32_t av_flt2int(float d);
deprecated AVExtFloat av_dbl2ext(double d);
}
