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



enum LIBAVCODEC_VERSION_MAJOR = 57;
enum LIBAVCODEC_VERSION_MINOR = 24;
enum LIBAVCODEC_VERSION_MICRO = 102;

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

enum FF_API_VIMA_DECODER     = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_AUDIO_CONVERT    = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_AVCODEC_RESAMPLE = FF_API_AUDIO_CONVERT;
enum FF_API_GETCHROMA        = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_MISSING_SAMPLE   = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_LOWRES           = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_CAP_VDPAU        = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_BUFS_VDPAU       = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_VOXWARE          = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_SET_DIMENSIONS   = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_DEBUG_MV         = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_AC_VLC           = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_OLD_MSMPEG4      = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_ASPECT_EXTENDED  = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_ARCH_ALPHA       = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_XVMC             = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_ERROR_RATE       = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_QSCALE_TYPE      = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_MB_TYPE          = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_MAX_BFRAMES      = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_NEG_LINESIZES    = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_EMU_EDGE         = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_ARCH_SH4         = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_ARCH_SPARC       = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_UNUSED_MEMBERS   = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_IDCT_XVIDMMX     = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_INPUT_PRESERVED  = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_NORMALIZE_AQP    = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_GMC              = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_MV0              = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_CODEC_NAME       = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_AFD              = (LIBAVCODEC_VERSION_MAJOR < 58);
/* XXX: don't forget to drop the -vismv documentation */
enum FF_API_VISMV            = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_AUDIOENC_DELAY   = (LIBAVCODEC_VERSION_MAJOR < 58);
enum FF_API_VAAPI_CONTEXT    = (LIBAVCODEC_VERSION_MAJOR < 58);

enum FF_API_AVCTX_TIMEBASE   = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_MPV_OPT          = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_STREAM_CODEC_TAG = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_QUANT_BIAS       = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_RC_STRATEGY      = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_CODED_FRAME      = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_MOTION_EST       = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_WITHOUT_PREFIX   = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_SIDEDATA_ONLY_PKT= (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_VDPAU_PROFILE    = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_CONVERGENCE_DURATION= (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_AVPICTURE        = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_AVPACKET_OLD_API = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_RTP_CALLBACK     = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_VBV_DELAY        = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_CODER_TYPE       = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_STAT_BITS        = (LIBAVCODEC_VERSION_MAJOR < 59);
enum FF_API_PRIVATE_OPT      = (LIBAVCODEC_VERSION_MAJOR < 59);
