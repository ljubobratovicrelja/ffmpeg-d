/*
 * copyright (c) 2003 Fabrice Bellard
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
module ffmpeg.libavutil.avutil;

import std.stdint;
import std.format;
import std.array;
import core.vararg;

public import ffmpeg.libavutil.common;
public import ffmpeg.libavutil.rational;
public import ffmpeg.libavutil.samplefmt;
public import ffmpeg.libavutil.frame;
public import ffmpeg.libavutil.pixfmt;
public import ffmpeg.libavutil.log;
public import ffmpeg.libavutil.dict;
public import ffmpeg.libavutil.error;
public import ffmpeg.libavutil.mathematics;
public import ffmpeg.libavutil.channel_layout;
public import ffmpeg.libavutil.avutil_version;

extern(C): 
/*
 * @mainpage
 *
 * @section libav_intro Introduction
 *
 * This document describes the usage of the different libraries
 * provided by FFmpeg.
 *
 * @li @ref libavc "libavcodec" encoding/decoding library
 * @li @subpage libavfilter graph based frame editing library
 * @li @ref libavf "libavformat" I/O and muxing/demuxing library
 * @li @ref lavd "libavdevice" special devices muxing/demuxing library
 * @li @ref lavu "libavutil" common utility library
 * @li @subpage libpostproc post processing library
 * @li @subpage libswscale  color conversion and scaling library
 */

/**
 * @defgroup lavu Common utility functions
 *
 * @brief
 * libavutil contains the code shared across all the other FFmpeg
 * libraries
 *
 * @note In order to use the functions provided by avutil you must include
 * the specific header.
 *
 * @{
 *
 * @defgroup lavu_crypto Crypto and Hashing
 *
 * @{
 * @}
 *
 * @defgroup lavu_math Maths
 * @{
 *
 * @}
 *
 * @defgroup lavu_string String Manipulation
 *
 * @{
 *
 * @}
 *
 * @defgroup lavu_mem Memory Management
 *
 * @{
 *
 * @}
 *
 * @defgroup lavu_data Data Structures
 * @{
 *
 * @}
 *
 * @defgroup lavu_audio Audio related
 *
 * @{
 *
 * @}
 *
 * @defgroup lavu_error Error Codes
 *
 * @{
 *
 * @}
 *
 * @defgroup lavu_misc Other
 *
 * @{
 *
 * @defgroup lavu_internal Internal
 *
 * Not exported functions, for internal usage only
 *
 * @{
 *
 * @}
 */

/**
 * @addtogroup lavu_ver
 * @{
 */

/**
 * Return the LIBAVUTIL_VERSION_INT constant.
 */
uint avutil_version();

/**
 * Return the libavutil build-time configuration.
 */
char *avutil_configuration();

/**
 * Return the libavutil license.
 */
char *avutil_license();

/**
 * @}
 */

/**
 * @addtogroup lavu_media Media Type
 * @brief Media Type
 */

enum AVMediaType {
    AVMEDIA_TYPE_UNKNOWN = -1,  ///< Usually treated as AVMEDIA_TYPE_DATA
    AVMEDIA_TYPE_VIDEO,
    AVMEDIA_TYPE_AUDIO,
    AVMEDIA_TYPE_DATA,          ///< Opaque data information usually continuous
    AVMEDIA_TYPE_SUBTITLE,
    AVMEDIA_TYPE_ATTACHMENT,    ///< Opaque data information usually sparse
    AVMEDIA_TYPE_NB
} 

/**
 * Return a string describing the media_type enum, NULL if media_type
 * is unknown.
 */
char* av_get_media_type_string(AVMediaType media_type);

/**
 * @defgroup lavu_const Constants
 * @{
 *
 * @defgroup lavu_enc Encoding specific
 *
 * @note those definition should move to avcodec
 * @{
 */

enum FF_LAMBDA_SHIFT = 7;
enum FF_LAMBDA_SCALE = (1<<FF_LAMBDA_SHIFT);
enum FF_QP2LAMBDA = 118; ///< factor to convert from H.263 QP to lambda
enum FF_LAMBDA_MAX = (256*128-1);

enum FF_QUALITY_SCALE = FF_LAMBDA_SCALE; //FIXME maybe remove

/**
 * @}
 * @defgroup lavu_time Timestamp specific
 *
 * FFmpeg internal timebase and timestamp definitions
 *
 * @{
 */

/**
 * @brief Undefined timestamp value
 *
 * Usually reported by demuxer that work on containers that do not provide
 * either pts or dts.
 */

enum AV_NOPTS_VALUE = 0x8000000000000000;


/**
 * Internal time base represented as integer
 */

enum AV_TIME_BASE = 1000000;

/**
 * Internal time base represented as fractional value
 */

AVRational AV_TIME_BASE_Q = {num:1, den:AV_TIME_BASE};

/**
 * @}
 * @}
 * @defgroup lavu_picture Image related
 *
 * AVPicture types, pixel formats and basic image planes manipulation.
 *
 * @{
 */
enum AVPictureType {
      AV_PICTURE_TYPE_NONE = 0,
      AV_PICTURE_TYPE_I,
      AV_PICTURE_TYPE_P,
      AV_PICTURE_TYPE_B,
      AV_PICTURE_TYPE_S,
      AV_PICTURE_TYPE_SI,
      AV_PICTURE_TYPE_SP,
      AV_PICTURE_TYPE_BI
}

/**
 * Return a single letter to describe the given picture type
 * pict_type.
 *
 * @param[in] pict_type the picture type @return a single character
 * representing the picture type, '?' if pict_type is unknown
 */
char av_get_picture_type_char(AVPictureType pict_type);
// end avutil.h
  
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
  import std.format; 
  import std.array;
  if (ts == AV_NOPTS_VALUE) {
    return "No Value";
  } else {
    auto toTs = av_q2d(tb) * ts;
    auto writer = appender!string(); 
    formattedWrite(writer, "%.6g", toTs);
    return writer.data;
  }
}

/**
 * Return x default pointer in case p is NULL.
 */
//static inline void *av_x_if_null(const void *p, const void *x)
//{
//    return (void *)(intptr_t)(p ? p : x);
//}

/**
 * Compute the length of an integer list.
 *
 * @param elsize  size in bytes of each list element (only 1, 2, 4 or 8)
 * @param term    list terminator (usually 0 or -1)
 * @param list    pointer to the list
 * @return  length of the list, in elements, not counting the terminator
 */
//unsigned av_int_list_length_for_size(unsigned elsize,
//                                    const void *list, uint64_t term) av_pure;

/**
 * Compute the length of an integer list.
 *
 * @param term  list terminator (usually 0 or -1)
 * @param list  pointer to the list
 * @return  length of the list, in elements, not counting the terminator
 */
//#define av_int_list_length(list, term) \
//av_int_list_length_for_size(sizeof(*(list)), list, term)

/**
 * Open a file using a UTF-8 filename.
 * The API of this function matches POSIX fopen(), errors are returned through
 * errno.
 */
//FILE *av_fopen_utf8(const char *path, const char *mode);

/**
 * Return the fractional representation of the internal time base.
 */
//AVRational av_get_time_base_q(void);

/**
 * @}
 * @}
 */
