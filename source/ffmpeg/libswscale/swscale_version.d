module ffmpeg.libswscale.swscale_version;
import ffmpeg.libavutil.avutil_version;

//#include "libavutil/version.h"

enum LIBSWSCALE_VERSION_MAJOR = 3;
enum LIBSWSCALE_VERSION_MINOR = 1;
enum LIBSWSCALE_VERSION_MICRO = 101;

enum LIBSWSCALE_VERSION_INT = AV_VERSION_INT!(LIBSWSCALE_VERSION_MAJOR, 
											  LIBSWSCALE_VERSION_MINOR,  
											  LIBSWSCALE_VERSION_MICRO);

enum LIBSWSCALE_VERSION = AV_VERSION!(LIBSWSCALE_VERSION_MAJOR, 
										LIBSWSCALE_VERSION_MINOR, 
										LIBSWSCALE_VERSION_MICRO);
enum LIBSWSCALE_BUILD = LIBSWSCALE_VERSION_INT;

enum LIBSWSCALE_IDENT = "SwS" ~ LIBSWSCALE_VERSION;

/**
* FF_API_* defines may be placed below to indicate public API that will be
* dropped at a future version bump. The defines themselves are not part of
* the public API and may change, break or disappear at any time.
*/

//#ifndef FF_API_SWS_CPU_CAPS
enum FF_API_SWS_CPU_CAPS =  (LIBSWSCALE_VERSION_MAJOR < 4);
//#endif
//#ifndef FF_API_ARCH_BFIN
enum FF_API_ARCH_BFIN  =     (LIBSWSCALE_VERSION_MAJOR < 4);
//#endif

enum ARCH_X86_64 = 1;
//#endif /* SWSCALE_VERSION_H */