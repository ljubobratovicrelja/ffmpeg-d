module ffmpeg.libswscale.swscale_internal;

import ffmpeg.libswscale.swscale_version;
import ffmpeg.libavutil.avutil;

@nogc nothrow extern(C):

enum YUVRGB_TABLE_HEADROOM = 256;
enum YUVRGB_TABLE_LUMA_HEADROOM = 512;

//enum MAX_FILTER_SIZE = SWS_MAX_FILTER_SIZE;


static if( AV_HAVE_BIGENDIAN){
    enum ALT32_CORR = (-1);
}else{
    enum ALT32_CORR =  1;
}

static if( ARCH_X86_64){
	enum APCK_PTR2 = 8;
	enum APCK_COEF = 16;
	enum APCK_SIZE = 24;
}
else{
	enum APCK_PTR2 = 4;
	enum APCK_COEF  = 8;
	enum APCK_SIZE = 16;
}

enum RETCODE_USE_CASCADE = -12345;




