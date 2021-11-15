<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

if (!function_exists('hash_equals')) {
    function hash_equals($str1, $str2)
    {
        $len = min(mb_strlen($str1, '8bit'), mb_strlen($str2, '8bit'));

        $status = 0;
        for ($i = 0; $i < $len; ++$i) {
            $status |= (ord($str1[$i]) ^ ord($str2[$i]));
        }
        $status |= (mb_strlen($str1, '8bit') ^ mb_strlen($str2, '8bit'));

        return ($status === 0);
    }
}
