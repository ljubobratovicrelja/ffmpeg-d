/*
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
 * timestamp utils, mostly useful for debugging/logging purposes
 */

module ffmpeg.libavutil.timestamp;

import std.stdint;

public import ffmpeg.libavutil.common;
public import ffmpeg.libavutil.rational;
public import ffmpeg.libavutil.avutil_version;

extern(C):

/**
 * Fill the provided buffer with a string containing a timestamp time
 * representation.
 *
 * @param buf a buffer with size in bytes of at least AV_TS_MAX_STRING_SIZE
 * @param ts the timestamp to represent
 * @param tb the timebase of the timestamp
 * @return the buffer in input
 */
string av_ts_make_string(int64_t ts)
{
    import std.format : format;
  if (ts == 0x8000000000000000) {
    return "NOPTS";
  } else {
    return format!"%d"(ts);
  }
}

/**
 * Fill the provided buffer with a string containing a timestamp time
 * representation.
 *
 * @param buf a buffer with size in bytes of at least AV_TS_MAX_STRING_SIZE
 * @param ts the timestamp to represent
 * @param tb the timebase of the timestamp
 * @return the buffer in input
 */
string av_ts_make_time_string(int64_t ts, AVRational tb)
{
  import std.format : format;
  if (ts == 0x8000000000000000) {
    return "NOPTS";
  } else {
    return format!"%.6g"(av_q2d(tb) * ts);
  }
}

// end avutil.h
