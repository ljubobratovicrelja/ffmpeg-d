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

module ffmpeg.libavformat.url;

/**
 * @file
 * unbuffered private I/O API
 */

import ffmpeg.libavformat.avio;
import ffmpeg.libavutil.dict;
import ffmpeg.libavutil.log;
import std.stdint;

@nogc nothrow extern(C):
enum URL_PROTOCOL_FLAG_NESTED_SCHEME = 1; /*< The protocol name can be the first part of a nested protocol scheme */
enum URL_PROTOCOL_FLAG_NETWORK       = 2; /*< The protocol uses network */

extern const AVClass ffurl_context_class;

struct URLContext {
    const AVClass *av_class;    /**< information for av_log(). Set by url_open(). */
    URLProtocol *prot;
    void *priv_data;
    char *filename;             /**< specified URL */
    int flags;
    int max_packet_size;        /**< if non zero, the stream is packetized with this max packet size */
    int is_streamed;            /**< true if streamed (no seek possible), default = false */
    int is_connected;
    AVIOInterruptCB interrupt_callback;
    int64_t rw_timeout;         /**< maximum time to wait for (network) read/write operation completion, in mcs */
    const char *protocol_whitelist;
    const char *protocol_blacklist;
}

struct URLProtocol {
    const char *name;
    int     function( URLContext *h, const char *url, int flags) url_open;
    /**
     * This callback is to be used by protocols which open further nested
     * protocols. options are then to be passed to ffurl_open()/ffurl_connect()
     * for those nested protocols.
     */
    int     function(URLContext *h, const char *url, int flags, AVDictionary **options) url_open2;
    int     function(URLContext *s, URLContext **c) url_accept;
    int     function(URLContext *c) url_handshake;

    /**
     * Read data from the protocol.
     * If data is immediately available (even less than size), EOF is
     * reached or an error occurs (including EINTR), return immediately.
     * Otherwise:
     * In non-blocking mode, return AVERROR(EAGAIN) immediately.
     * In blocking mode, wait for data/EOF/error with a short timeout (0.1s),
     * and return AVERROR(EAGAIN) on timeout.
     * Checking interrupt_callback, looping on EINTR and EAGAIN and until
     * enough data has been read is left to the calling function; see
     * retry_transfer_wrapper in avio.c.
     */
    int     function( URLContext *h, ubyte *buf, int size) url_read;
    int     function(URLContext *h, const ubyte *buf, int size) url_write;
    int64_t function( URLContext *h, int64_t pos, int whence) url_seek;
    int     function(URLContext *h) url_close;
    int function(URLContext *h, int pause) url_read_pause;
    int64_t function(URLContext *h, int stream_index,
                             int64_t timestamp, int flags) url_read_seek;
    int function(URLContext *h) url_get_file_handle;
    int function(URLContext *h, int **handles,
                                     int *numhandles) url_get_multi_file_handle;
    int function(URLContext *h, int flags) url_shutdown;
    int priv_data_size;
    const AVClass *priv_data_class;
    int flags;
    int function(URLContext *h, int mask) url_check;
    int function(URLContext *h) url_open_dir;
    int function(URLContext *h, AVIODirEntry **next) url_read_dir;
    int function(URLContext *h) url_close_dir;
    int function(URLContext *h) url_delete;
    int function(URLContext *h_src, URLContext *h_dst) url_move;
    const char *default_whitelist;
}
