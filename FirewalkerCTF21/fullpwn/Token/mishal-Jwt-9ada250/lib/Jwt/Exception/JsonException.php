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
 * Token is not properly encoded to json.
 */
class JsonException extends Exception
{
    protected $messages = [
        JSON_ERROR_DEPTH => 'Maximum stack depth exceeded',
        JSON_ERROR_CTRL_CHAR => 'Unexpected control character found',
        JSON_ERROR_STATE_MISMATCH => 'Underflow or the modes mismatch',
        JSON_ERROR_CTRL_CHAR => 'Unexpected control character found',
        JSON_ERROR_SYNTAX => 'Syntax error, malformed JSON',
        JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded',
    ];

    public function __construct($message, $code = 0, \Exception $previous = null)
    {
        if (null === $message) {
            if (isset($this->messages[$code])) {
                $message = $this->messages[$code];
            } else {
                $message = 'Unknown json error';
            }
        }

        parent::__construct($message, $code, $previous);
    }
}
