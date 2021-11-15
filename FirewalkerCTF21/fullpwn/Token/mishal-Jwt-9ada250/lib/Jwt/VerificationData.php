<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt;

use Jwt\Exception\VerificationException;

/**
 * VerificationData.
 */
final class VerificationData implements \ArrayAccess, \IteratorAggregate
{
    use TDataHolder;

    /**
     * Validates the payload.
     *
     * @param Payload $payload
     *
     * @return bool
     *
     * @throws VerificationException
     */
    public function verifyPayload(Payload $payload)
    {
        foreach ($this->data as $claimName => $claimValue) {
            if (!isset($payload[$claimName])) {
                throw new VerificationException(sprintf('Missing the "%s" claim.', $claimName), $claimName);
            }

            if ($claimValue instanceof \Closure) {
                $verified = call_user_func($claimValue, $payload[$claimName]);
                if (false === $verified) {
                    throw new VerificationException(sprintf('Invalid value for "%s" claim.', $claimName), $claimName, $claimValue, VerificationException::CLAIM_VALUE_IS_INVALID);
                }
                continue;
            }

            if ($payload[$claimName] !== $claimValue) {
                throw new VerificationException(sprintf('Invalid value for "%s" claim.', $claimName), $claimName, $claimValue, VerificationException::CLAIM_VALUE_IS_INVALID);
            }
        }

        return true;
    }
}
