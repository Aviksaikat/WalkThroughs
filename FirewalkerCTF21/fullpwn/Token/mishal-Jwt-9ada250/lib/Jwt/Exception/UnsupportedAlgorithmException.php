<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\Exception;

use Jwt\Exception;

/**
 * The algorithm is not supported.
 */
class UnsupportedAlgorithmException extends Exception
{
    use TWithAlgorithm;

    /**
     * @param string $algorithm
     */
    public function __construct($algorithm)
    {
        $this->algorithm = $algorithm;

        parent::__construct(sprintf('The algorithm "%s" is not supported.', $algorithm));
    }
}
