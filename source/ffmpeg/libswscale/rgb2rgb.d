module ffmpeg.libswscale.rgb2rgb;

import ffmpeg.libavutil.avutil;
import std.stdint;

@nogc nothrow extern(C):

void rgb64tobgr48_nobswap(const uint8_t *src, uint8_t *dst, int src_size);
void   rgb64tobgr48_bswap(const uint8_t *src, uint8_t *dst, int src_size);
void rgb48tobgr48_nobswap(const uint8_t *src, uint8_t *dst, int src_size);
void   rgb48tobgr48_bswap(const uint8_t *src, uint8_t *dst, int src_size);
void    rgb64to48_nobswap(const uint8_t *src, uint8_t *dst, int src_size);
void      rgb64to48_bswap(const uint8_t *src, uint8_t *dst, int src_size);
void    rgb24to32(const uint8_t *src, uint8_t *dst, int src_size);
void    rgb32to24(const uint8_t *src, uint8_t *dst, int src_size);
void rgb16tobgr32(const uint8_t *src, uint8_t *dst, int src_size);
void    rgb16to24(const uint8_t *src, uint8_t *dst, int src_size);
void rgb16tobgr16(const uint8_t *src, uint8_t *dst, int src_size);
void rgb16tobgr15(const uint8_t *src, uint8_t *dst, int src_size);
void rgb15tobgr32(const uint8_t *src, uint8_t *dst, int src_size);
void    rgb15to24(const uint8_t *src, uint8_t *dst, int src_size);
void rgb15tobgr16(const uint8_t *src, uint8_t *dst, int src_size);
void rgb15tobgr15(const uint8_t *src, uint8_t *dst, int src_size);
void rgb12tobgr12(const uint8_t *src, uint8_t *dst, int src_size);
void    rgb12to15(const uint8_t *src, uint8_t *dst, int src_size);

void shuffle_bytes_1230(const uint8_t *src, uint8_t *dst, int src_size);
void shuffle_bytes_3012(const uint8_t *src, uint8_t *dst, int src_size);
void shuffle_bytes_3210(const uint8_t *src, uint8_t *dst, int src_size);

void ff_rgb24toyv12_c(const uint8_t *src, uint8_t *ydst, uint8_t *udst,
                      uint8_t *vdst, int width, int height, int lumStride,
                      int chromStride, int srcStride, int32_t *rgb2yuv);


void sws_rgb2rgb_init();

void rgb2rgb_init_x86();