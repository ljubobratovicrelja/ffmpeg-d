/*
 * rational numbers
 * Copyright (c) 2003 Michael Niedermayer <michaelni@gmx.at>
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

/**
 * @file
 * @ingroup lavu_math_rational
 * Utilties for rational number calculation.
 * @author Michael Niedermayer <michaelni@gmx.at>
 */
module ffmpeg.libavutil.rational;
extern (C) @nogc nothrow:

/**
 * @defgroup lavu_math_rational AVRational
 * @ingroup lavu_math
 * Rational number calculation.
 *
 * While rational numbers can be expressed as floating-point numbers, the
 * conversion process is a lossy one, so are floating-point operations. On the
 * other hand, the nature of FFmpeg demands highly accurate calculation of
 * timestamps. This set of rational number utilities serves as a generic
 * interface for manipulating rational numbers as pairs of numerators and
 * denominators.
 *
 * Many of the functions that operate on AVRational's have the suffix `_q`, in
 * reference to the mathematical symbol "ℚ" (Q) which denotes the set of all
 * rational numbers.
 *
 * @{
 */

/**
 * Rational number (pair of numerator and denominator).
 */
struct AVRational
{
    int num; ///< Numerator
    int den; ///< Denominator
}

/**
 * Create an AVRational.
 *
 * Useful for compilers that do not support compound literals.
 *
 * @note The return value is not reduced.
 * @see av_reduce()
 */
AVRational av_make_q (int num, int den);

/**
 * Compare two rationals.
 *
 * @param a First rational
 * @param b Second rational
 *
 * @return One of the following values:
 *         - 0 if `a == b`
 *         - 1 if `a > b`
 *         - -1 if `a < b`
 *         - `INT_MIN` if one of the values is of the form `0 / 0`
 */
int av_cmp_q (AVRational a, AVRational b);

/**
 * Convert an AVRational to a `double`.
 * @param a AVRational to convert
 * @return `a` in floating-point form
 * @see av_d2q()
 */
pragma (inline, true)
extern(D) static double av_q2d (AVRational a){
    return a.num / cast(double) a.den;
}

/**
 * Reduce a fraction.
 *
 * This is useful for framerate calculations.
 *
 * @param[out] dst_num Destination numerator
 * @param[out] dst_den Destination denominator
 * @param[in]      num Source numerator
 * @param[in]      den Source denominator
 * @param[in]      max Maximum allowed values for `dst_num` & `dst_den`
 * @return 1 if the operation is exact, 0 otherwise
 */
int av_reduce (int* dst_num, int* dst_den, long num, long den, long max);

/**
 * Multiply two rationals.
 * @param b First rational
 * @param c Second rational
 * @return b*c
 */
AVRational av_mul_q (AVRational b, AVRational c);

/**
 * Divide one rational by another.
 * @param b First rational
 * @param c Second rational
 * @return b/c
 */
AVRational av_div_q (AVRational b, AVRational c);

/**
 * Add two rationals.
 * @param b First rational
 * @param c Second rational
 * @return b+c
 */
AVRational av_add_q (AVRational b, AVRational c);

/**
 * Subtract one rational from another.
 * @param b First rational
 * @param c Second rational
 * @return b-c
 */
AVRational av_sub_q (AVRational b, AVRational c);

/**
 * Invert a rational.
 * @param q value
 * @return 1 / q
 */
AVRational av_inv_q (AVRational q);

/**
 * Convert a double precision floating point number to a rational.
 *
 * In case of infinity, the returned value is expressed as `{1, 0}` or
 * `{-1, 0}` depending on the sign.
 *
 * @param d   `double` to convert
 * @param max Maximum allowed numerator and denominator
 * @return `d` in AVRational form
 * @see av_q2d()
 */
AVRational av_d2q (double d, int max);

/**
 * Find which of the two rationals is closer to another rational.
 *
 * @param q     Rational to be compared against
 * @param q1,q2 Rationals to be tested
 * @return One of the following values:
 *         - 1 if `q1` is nearer to `q` than `q2`
 *         - -1 if `q2` is nearer to `q` than `q1`
 *         - 0 if they have the same distance
 */
int av_nearer_q (AVRational q, AVRational q1, AVRational q2);

/**
 * Find the value in a list of rationals nearest a given reference rational.
 *
 * @param q      Reference rational
 * @param q_list Array of rationals terminated by `{0, 0}`
 * @return Index of the nearest value found in the array
 */
int av_find_nearest_q_idx (AVRational q, const(AVRational)* q_list);

/**
 * Convert an AVRational to a IEEE 32-bit `float` expressed in fixed-point
 * format.
 *
 * @param q Rational to be converted
 * @return Equivalent floating-point value, expressed as an unsigned 32-bit
 *         integer.
 * @note The returned value is platform-indepedant.
 */
uint av_q2intfloat (AVRational q);

/**
 * Return the best rational so that a and b are multiple of it.
 * If the resulting denominator is larger than max_den, return def.
 */
AVRational av_gcd_q (AVRational a, AVRational b, int max_den, AVRational def);

/**
 * @}
 */

/* AVUTIL_RATIONAL_H */
