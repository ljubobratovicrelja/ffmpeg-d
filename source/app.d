import std.stdio;
import std.conv;
import std.string;

import ffmpeg.libavformat.avformat;
import ffmpeg.libavcodec.avcodec;
import ffmpeg.libavutil.avutil;
import ffmpeg.libavfilter.avfilter;

void main(string[] args) {
	av_register_all();
	avformat_network_init();
	avcodec_register_all();
	avfilter_register_all();
  writeln("AVCodec config: " ~ to!string(avcodec_configuration()));
  writeln("AVCodec licence: " ~ to!string(avcodec_license()));
  writeln("AVFormat config: " ~ to!string(avformat_configuration()));
  writeln("AVFormat licence: " ~ to!string(avformat_license()));
  writeln("AVUtil version: " ~ to!string(avutil_version()));
  writeln("AVFilter version: " ~ to!string(avfilter_version()));

  writeln(to!string(av_get_media_type_string(AVMediaType.AVMEDIA_TYPE_VIDEO)));
  AVFormatContext* formatContext = null;
  auto file_iformat = av_find_input_format(toStringz(args[1]));
  avformat_open_input(&formatContext, toStringz(args[1]), file_iformat, null);

}
