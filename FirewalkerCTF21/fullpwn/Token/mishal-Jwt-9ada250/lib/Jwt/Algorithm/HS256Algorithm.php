<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\Algorithm;

/**
 * HMAC using SHA-256 hash algorithm.
 */
class HS256Algorithm extends HMacAlgorithm
{
    public function getName()
    {
        return 'HS256';
    }

    protected function getAlgorithm()
    {
        return 'sha256';
    }
}
