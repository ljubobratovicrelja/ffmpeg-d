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
module ffmpeg.libavformat.avformat_version;
/**
 * @file
 * @ingroup libavf
 * Libavformat version macros
 */

import ffmpeg.libavutil.avutil;

enum LIBAVFORMAT_VERSION_MAJOR = 57;
enum LIBAVFORMAT_VERSION_MINOR = 25;
enum LIBAVFORMAT_VERSION_MICRO = 100;

enum LIBAVFORMAT_VERSION_INT = AV_VERSION_INT!(LIBAVFORMAT_VERSION_MAJOR,
                                               LIBAVFORMAT_VERSION_MINOR,
                                               LIBAVFORMAT_VERSION_MICRO);
enum LIBAVFORMAT_VERSION  =  AV_VERSION!(LIBAVFORMAT_VERSION_MAJOR,
                                           LIBAVFORMAT_VERSION_MINOR,
                                           LIBAVFORMAT_VERSION_MICRO);
enum LIBAVFORMAT_BUILD    =  LIBAVFORMAT_VERSION_INT;

auto LIBAVFORMAT_IDENT    =  "Lavf" ~ LIBAVFORMAT_VERSION;

/**
 * FF_API_* defines may be placed below to indicate public API that will be
 * dropped at a future version bump. The defines themselves are not part of
 * the public API and may change, break or disappear at any time.
 *
 * @note, when bumping the major version it is recommended to manually
 * disable each FF_API_* in its own commit instead of disabling them all
 * at once through the bump. This improves the git bisect-ability of the change.
 *
 */
enum FF_API_LAVF_BITEXACT        =   (LIBAVFORMAT_VERSION_MAJOR < 58);
enum FF_API_LAVF_FRAC            =   (LIBAVFORMAT_VERSION_MAJOR < 58);
enum FF_API_LAVF_CODEC_TB        =   (LIBAVFORMAT_VERSION_MAJOR < 58);
enum FF_API_URL_FEOF             =   (LIBAVFORMAT_VERSION_MAJOR < 58);

enum FF_API_LAVF_FMT_RAWPICTURE  =   (LIBAVFORMAT_VERSION_MAJOR < 58);
enum FF_API_COMPUTE_PKT_FIELDS2  =   (LIBAVFORMAT_VERSION_MAJOR < 58);
enum FF_API_OLD_OPEN_CALLBACKS   =   (LIBAVFORMAT_VERSION_MAJOR < 58);

enum FF_API_R_FRAME_RATE         =   1;

//#endif /* AVFORMAT_VERSION_H */
