<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\Algorithm;

/**
 * RS256 algorithm.
 */
class RS256Algorithm extends RsaAlgorithm
{
    public function getName()
    {
        return 'RS256';
    }

    protected function getAlgorithm()
    {
        return 'sha256';
    }
}
