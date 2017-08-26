/*
 * copyright (c) 2017 David Bennett <davidbennett@bravevision.com>
 *
 * This is a working remuxer used to check everything is linked correcty.
 *
 * To try it out just compile it using:
 *   dub build --config=remux_example
 *
 * Then run it like:
 *   ./remux_example in.mkv out.mkv
 */

import std.string : toStringz;

import ffmpeg.libavformat.avformat;
import ffmpeg.libavformat.avio;
import ffmpeg.libavcodec.avcodec;
import ffmpeg.libavutil.avutil;
import ffmpeg.libavutil.mathematics;

void main(string[] args) {

    // setup

    string input_filename = args[1];
    string output_filename = args[2];

    av_register_all();



    // ##########################
    //   PART 1:
    //     SET UP THE THE DEMUXER
    // ##########################

    AVFormatContext* input_fmt_ctx = null;

    AVFrame* input_video_frame;
    AVFrame* input_audio_frame;

    size_t input_video_stream_index;
    size_t input_audio_stream_index;

    // Open the file and init the AVFormatContext
    if(avformat_open_input(&input_fmt_ctx, input_filename.toStringz, null, null) < 0)
        throw new Exception("Could not open source file");

    // Scan the container and fill the AVFormatContext with stream information
    if(avformat_find_stream_info(input_fmt_ctx, null) < 0)
        throw new Exception("Could not find stream information");

    // Writes ffmpeg like input format information to console. Good for debuging.
    av_dump_format(input_fmt_ctx, 0, input_filename.toStringz, 0);



    // ##########################
    //   PART 2:
    //     SET UP THE THE MUXER
    // ##########################

    AVFormatContext* output_fmt_ctx = null;

    // Create a new output AVFormatContext with infomation with the filename
    if(avformat_alloc_output_context2(&output_fmt_ctx, null, null, output_filename.toStringz) < 0)
        throw new Exception("Failed to create output context");

    // Copy some information from the input AVFormatContext
    for(size_t i=0; i<input_fmt_ctx.nb_streams; i++)
    {

        AVStream* in_stream = input_fmt_ctx.streams[i];

        // only audio and video
        if(
                in_stream.codec.codec_type != AVMediaType.AVMEDIA_TYPE_VIDEO
            &&
                in_stream.codec.codec_type != AVMediaType.AVMEDIA_TYPE_AUDIO
        ) continue;

        // Create a new output stream based on the input stream

        AVStream* out_stream = avformat_new_stream(output_fmt_ctx, in_stream.codec.codec);
        if (!out_stream)
            throw new Exception("Failed allocating output stream");

        // Copy input stream codec contect to the output stream
        if(avcodec_copy_context(out_stream.codec, in_stream.codec) < 0)
            throw new Exception("Failed to copy context from input to output stream codec context");

        // Setup a few properties that are needed by some codec/container combos.
        out_stream.codec.codec_tag = 0;
        if (output_fmt_ctx.oformat.flags & AVFMT_GLOBALHEADER) // 0x0040
            out_stream.codec.flags |= AV_CODEC_FLAG_GLOBAL_HEADER; // (1 << 22)

    }

    // Writes ffmpeg like output format information to console. Good for debuging.
    av_dump_format(output_fmt_ctx, 0, output_filename.toStringz, 1);


    // Open the output file
    if(!(output_fmt_ctx.oformat.flags & AVFMT_NOFILE)) // 0x0001
        if(avio_open(&output_fmt_ctx.pb, output_filename.toStringz, AVIO_FLAG_WRITE) < 0)
            throw new Exception("Could not open output file");

    // Write the container header to the output file
    if(avformat_write_header(output_fmt_ctx, null) < 0)
        throw new Exception("Error opening output file.");




    // ##########################
    //   PART 3:
    //     READ PACKETS FROM DEMUXER and WRITE TO MUXER
    // ##########################

    AVPacket pkt;

    // Loop over all the packets in the input container
    while (av_read_frame(input_fmt_ctx, &pkt) >= 0) {

        AVStream* in_stream  = input_fmt_ctx.streams[pkt.stream_index];
        AVStream* out_stream = output_fmt_ctx.streams[pkt.stream_index];

        // only audio and video
        if(
                in_stream.codec.codec_type != AVMediaType.AVMEDIA_TYPE_VIDEO
            &&
                in_stream.codec.codec_type != AVMediaType.AVMEDIA_TYPE_AUDIO
        ) continue;

        // Rescale timecode to match the output container
        pkt.pts = av_rescale_q_rnd(pkt.pts, in_stream.time_base, out_stream.time_base, AVRounding.AV_ROUND_NEAR_INF|AVRounding.AV_ROUND_PASS_MINMAX);
        pkt.dts = av_rescale_q_rnd(pkt.dts, in_stream.time_base, out_stream.time_base, AVRounding.AV_ROUND_NEAR_INF|AVRounding.AV_ROUND_PASS_MINMAX);
        pkt.duration = av_rescale_q(pkt.duration, in_stream.time_base, out_stream.time_base);
        pkt.pos = -1;

        // Wright packets to the output container
        if(av_interleaved_write_frame(output_fmt_ctx, &pkt) < 0)
            throw new Exception("Could not write packet");

        // clear packet for next frame
        av_packet_unref(&pkt);

    }



    // ##########################
    //   PART 3:
    //     FINISH WRITING AND CLEAN UP
    // ##########################

    // write the container trailer
    if(av_write_trailer(output_fmt_ctx) < 0)
        throw new Exception("Could not write the container trailer");

    // close the input file and free context
    avformat_close_input(&input_fmt_ctx);
    avformat_free_context(input_fmt_ctx);

    // close the output file if exists and free context
    if (output_fmt_ctx && !(output_fmt_ctx.oformat.flags & AVFMT_NOFILE))
        avio_closep(&output_fmt_ctx.pb);
    avformat_free_context(output_fmt_ctx);

}
