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
use Jwt\Exception\BeforeValidException;

$payload = [
    Jwt::CLAIM_NOT_BEFORE => strtotime('1 day'),
    'data' => 'my data',
];

$token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));

try {
    $token = Jwt::decode($token, ['algorithm' => $alg]);
} catch (BeforeValidException $e) {
    throw $e;
    // Handle invalid token, e.g. logout user or deny access
}
