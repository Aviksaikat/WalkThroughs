<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt;

final class Util
{
    public static function assertFileIsReadable($file)
    {
        if (!is_readable($file)) {
            throw new \RuntimeException(sprintf('The file "%s" is not readable', $file));
        }
    }
}
