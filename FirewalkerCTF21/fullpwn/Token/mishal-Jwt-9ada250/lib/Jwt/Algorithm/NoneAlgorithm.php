<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\Algorithm;

/**
 * None algorithm - Unsecured JWT algorithm.
 */
class NoneAlgorithm implements IAlgorithm
{
    public function getName()
    {
        return 'none';
    }

    public function encrypt($value)
    {
    }

    public function verify($value, $signature)
    {
        if (empty($signature)) {
            return true;
        }

        return false;
    }
}
