<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

require_once __DIR__ . '/../vendor/autoload.php';

use Jwt\Jwt;
use Jwt\Algorithm\HS256Algorithm;
use Jwt\Exception\VerificationException;

$payload = [
    // expiration claim
    Jwt::CLAIM_EXPIRATION => strtotime('1 day'),
    // issuer claim
    Jwt::CLAIM_ISSUER => 'my-web-app',
    // custom claims
    'user' => 'administrator',
];

$token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
#echo $token
// Decode with verification of the payload
// Expiration, and Not before claims are verified automatically

// we will verify the token when decoding
$verify = [
    Jwt::CLAIM_ISSUER => 'my-web-app',
    // we can use closures for value verification
    'user' => function ($value) {
        if ($value === 'administrator') {
            return true;
        }

        return false;
    },
];

try {
    $decoded = Jwt::decode($token, ['algorithm' => $alg, 'verify' => $verify]);
} catch (VerificationException $e) {
    // something is wrong with the token
    // do something!
    switch ($e->getCode()) {
        case VerificationException::CLAIM_IS_MISSING:
            // claim is missing
            break;
        case VerificationException::CLAIM_VALUE_IS_INVALID:
            // invalid claim value
            break;
    }
}
