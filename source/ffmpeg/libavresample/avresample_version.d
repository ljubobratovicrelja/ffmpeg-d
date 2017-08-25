module ffmpeg.libavresample.avresample_version;
import ffmpeg.libavutil.avutil_version;

//#include "libavutil/version.h"

enum LIBAVRESAMPLE_VERSION_MAJOR = 3;
enum LIBAVRESAMPLE_VERSION_MINOR = 0;
enum LIBAVRESAMPLE_VERSION_MICRO = 0;

enum LIBAVRESAMPLE_VERSION_INT = AV_VERSION_INT!(LIBAVRESAMPLE_VERSION_MAJOR, 
											     LIBAVRESAMPLE_VERSION_MINOR,
											     LIBAVRESAMPLE_VERSION_MICRO);

enum LIBAVRESAMPLE_VERSION = AV_VERSION!(LIBAVRESAMPLE_VERSION_MAJOR, 
										 LIBAVRESAMPLE_VERSION_MINOR,
										 LIBAVRESAMPLE_VERSION_MICRO);
enum LIBAVRESAMPLE_BUILD = LIBAVRESAMPLE_VERSION_INT;

enum LIBAVRESAMPLE_IDENT = "Lavr" ~ LIBAVRESAMPLE_VERSION;