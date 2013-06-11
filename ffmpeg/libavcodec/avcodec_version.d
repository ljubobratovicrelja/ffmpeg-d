/*
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
module ffmpeg.libavcodec.avcodec_version;
import ffmpeg.libavutil.avutil;

/**
 * @file
 * @ingroup libavc
 * Libavcodec version macros.
 */



enum LIBAVCODEC_VERSION_MAJOR = 54;
enum LIBAVCODEC_VERSION_MINOR = 92;
enum LIBAVCODEC_VERSION_MICRO = 100;

enum LIBAVCODEC_VERSION_INT = AV_VERSION_INT!(LIBAVCODEC_VERSION_MAJOR, 
                                               LIBAVCODEC_VERSION_MINOR,
                                               LIBAVCODEC_VERSION_MICRO);
enum LIBAVCODEC_VERSION  =   AV_VERSION!(LIBAVCODEC_VERSION_MAJOR,
                                           LIBAVCODEC_VERSION_MINOR,
                                           LIBAVCODEC_VERSION_MICRO);
enum LIBAVCODEC_BUILD    =   LIBAVCODEC_VERSION_INT;

enum LIBAVCODEC_IDENT    =   "Lavc" ~ LIBAVCODEC_VERSION;

/**
 * FF_API_* defines may be placed below to indicate public API that will be
 * dropped at a future version bump. The defines themselves are not part of
 * the public API and may change, break or disappear at any time.
 */
enum FF_API_REQUEST_CHANNELS = (LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_ALLOC_CONTEXT   =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_AVCODEC_OPEN    =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_OLD_DECODE_AUDIO=(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_OLD_TIMECODE=(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_OLD_ENCODE_AUDIO=(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_OLD_ENCODE_VIDEO=(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_MPV_GLOBAL_OPTS =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_COLOR_TABLE_ID  =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_INTER_THRESHOLD =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_SUB_ID          =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_DSP_MASK        =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_FIND_BEST_PIX_FMT =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_CODEC_ID          =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_VDA_ASYNC         =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_AVCODEC_RESAMPLE  =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_LIBMPEG2          =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_MMI               =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_IDCT              =(LIBAVCODEC_VERSION_MAJOR < 55);
enum FF_API_DEINTERLACE       =(LIBAVCODEC_VERSION_MAJOR < 56);
