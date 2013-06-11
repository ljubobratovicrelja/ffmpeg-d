/*
 * Version macros.
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

module ffmpeg.libavfilter.avfilter_version;
/**
 * @file
 * Libavfilter version macros
 */

import ffmpeg.libavutil.avutil;

enum LIBAVFILTER_VERSION_MAJOR = 3;
enum LIBAVFILTER_VERSION_MINOR = 32;
enum LIBAVFILTER_VERSION_MICRO = 103;

enum LIBAVFILTER_VERSION_INT = AV_VERSION_INT!(LIBAVFILTER_VERSION_MAJOR, LIBAVFILTER_VERSION_MINOR, LIBAVFILTER_VERSION_MICRO);
enum LIBAVFILTER_VERSION =    AV_VERSION!(LIBAVFILTER_VERSION_MAJOR, LIBAVFILTER_VERSION_MINOR, LIBAVFILTER_VERSION_MICRO);
enum LIBAVFILTER_BUILD   =    LIBAVFILTER_VERSION_INT;
enum LIBAVFILTER_IDENT  = "Lavfi" ~ LIBAVFILTER_VERSION;

enum FF_API_AVFILTERPAD_PUBLIC =         (LIBAVFILTER_VERSION_MAJOR < 4);
enum FF_API_FOO_COUNT =                  (LIBAVFILTER_VERSION_MAJOR < 4);
enum FF_API_FILL_FRAME =                 (LIBAVFILTER_VERSION_MAJOR < 4);
enum FF_API_BUFFERSRC_BUFFER =           (LIBAVFILTER_VERSION_MAJOR < 4);
