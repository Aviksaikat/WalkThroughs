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
 * Token validation failed.
 */
class VerificationException extends Exception
{
    /**
     * Claim is missing.
     */
    const CLAIM_IS_MISSING = 0;

    /**
     * Claim value is invalid.
     */
    const CLAIM_VALUE_IS_INVALID = 1;

    /**
     * Claim name.
     *
     * @var null|string
     */
    private $claimName;

    /**
     * Claim value.
     *
     * @var null|string
     */
    private $claimValue;

    public function __construct($message, $claimName = null, $claimValue = null, $code = self::CLAIM_IS_MISSING, \Exception $previous = null)
    {
        $this->claimName = $claimName;
        $this->claimValue = $claimValue;

        parent::__construct($message, $code, $previous);
    }

    /**
     * @return string|null
     */
    public function getClaimName()
    {
        return $this->claimName;
    }

    /**
     * @return string|null
     */
    public function getClaimValue()
    {
        return $this->claimValue;
    }
}
