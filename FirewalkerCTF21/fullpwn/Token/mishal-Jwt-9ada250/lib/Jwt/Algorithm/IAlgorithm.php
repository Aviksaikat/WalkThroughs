<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\Algorithm;

/**
 * Algorithm interface.
 */
interface IAlgorithm
{
    /**
     * Encrypt the value.
     *
     * @param string $value
     *
     * @return string
     */
    public function encrypt($value);

    /**
     * Verifies the signature.
     *
     * @param string $known
     * @param string $user
     *
     * @return bool
     */
    public function verify($known, $user);

    /**
     * Returns the algorithm name.
     *
     * @return string
     */
    public function getName();
}
