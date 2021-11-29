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
 * Token has `not before` claim - the time before which the JWT MUST NOT be accepted for processing.
 */
class BeforeValidException extends Exception
{
}
