/*
 * copyright (c) 2010 Michael Niedermayer <michaelni@gmx.at>
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

/**
 * @file
 * simple assert() macros that are a bit more flexible than ISO C assert().
 * @author Michael Niedermayer <michaelni@gmx.at>
 */
module ffmpeg.libavutil.avassert;

extern (C) @nogc nothrow:

/**
 * assert() equivalent, that is always enabled.
 */

/**
 * assert() equivalent, that does not lie in speed critical code.
 * These asserts() thus can be enabled without fearing speed loss.
 */

extern (D) auto av_assert1(T)(auto ref T cond)
{
    return cast(void) 0;
}

/**
 * assert() equivalent, that does lie in speed critical code.
 */

extern (D) auto av_assert2(T)(auto ref T cond)
{
    return cast(void) 0;
}

extern (D) auto av_assert2_fpu()
{
    return cast(void) 0;
}

/**
 * Assert that floating point operations can be executed.
 *
 * This will av_assert0() that the cpu is not in MMX state on X86
 */
void av_assert0_fpu ();

/* AVUTIL_AVASSERT_H */
