/*
 * Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>
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

module ffmpeg.libswscale.swscale_internal;

import ffmpeg.libswscale.swscale_version;
import ffmpeg.libavutil.avutil;

@nogc nothrow extern(C):

enum YUVRGB_TABLE_HEADROOM = 512;
enum YUVRGB_TABLE_LUMA_HEADROOM = 512;

//enum MAX_FILTER_SIZE = SWS_MAX_FILTER_SIZE;


static if(AV_HAVE_BIGENDIAN){
    enum ALT32_CORR = (-1);
}else{
    enum ALT32_CORR =  1;
}

static if(ARCH_X86_64){
	enum APCK_PTR2 = 8;
	enum APCK_COEF = 16;
	enum APCK_SIZE = 24;
}
else{
	enum APCK_PTR2 = 4;
	enum APCK_COEF  = 8;
	enum APCK_SIZE = 16;
}

enum RETCODE_USE_CASCADE = -12_345;




