<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\Exception;

trait TWithAlgorithm
{
    /**
     * @var string
     */
    private $algorithm = '';

    /**
     * @return string
     */
    public function getAlgorithm()
    {
        return $this->algorithm;
    }
}
