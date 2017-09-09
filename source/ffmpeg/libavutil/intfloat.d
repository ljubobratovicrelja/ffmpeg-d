/*
 * Copyright (c) 2011 Mans Rullgard
 *
 * This file is part of Libav.
 *
 * Libav is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * Libav is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with Libav; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */
module ffmpeg.libavutil.intfloat;

import std.stdint;
import std.math : floor;

@nogc nothrow extern(C):

union av_intfloat32 {
    uint32_t i;
    float    f;
};

union av_intfloat64 {
    uint64_t i;
    double   f;
};

/**
 * Reinterpret a 32-bit integer as a float.
 */
static float av_int2float(uint32_t i)
{
    return float(i);
}



/**
 * Reinterpret a float as a 32-bit integer.
 */
static uint32_t av_float2int(float f)
{
    return cast(uint32_t)floor(f);
}



/**
 * Reinterpret a 64-bit integer as a double.
 */
static double av_int2double(uint64_t i)
{
    return double(i);
}



/**
 * Reinterpret a double as a 64-bit integer.
 */
static uint64_t av_double2int(double f)
{
    return cast(uint64_t)floor(f);
}



//#endif /* AVUTIL_INTFLOAT_H */
