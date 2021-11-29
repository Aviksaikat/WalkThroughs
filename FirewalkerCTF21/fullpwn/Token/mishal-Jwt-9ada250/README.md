# JWT – (JSON Web Token) for PHP

[![Build Status](https://travis-ci.org/mishal/jwt.svg)](https://travis-ci.org/mishal/jwt)
[![Downloads](https://img.shields.io/packagist/dm/mishal/jwt.svg)](https://packagist.org/packages/mishal/jwt)
[![Latest release](https://img.shields.io/packagist/v/mishal/jwt.svg)](https://github.com/mishal/jwt/releases) 

A Php implementation of [JSON Web Token](https://tools.ietf.org/html/rfc7519).

## Installing

### Install with composer

```
$ composer install mishal/jwt
```

## Algorithms and Usage

The JWT spec supports `NONE`, `HMAC`, `RSASSA`, `ECDSA` and `RSASSA-PSS` algorithms for cryptographic signing.

Supported algorithms:

 * None
 * HMAC 256
 * RSA 256

### NONE - unsigned token

    <?php
        
    use Jwt\Jwt;
    use Jwt\Algorithm\NoneAlgorithm;
        
    $token = Jwt::encode('string', new NoneAlgorithm());
      
    echo $token; // eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJkYXRhIjoic3RyaW5nIn0.

### HMAC

 * HS256 - HMAC using SHA-256 hash algorithm

#### HS256

    <?php
    
    use Jwt\Jwt;
    use Jwt\Algorithm\HS256Algorithm;
    
    $token = Jwt::encode('string', $alg = new HS256Algorithm('secret'));
    
    echo $token; // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoic3RyaW5nIn0.RncJbCyf4zd0pu1N02u_rKwEezkmd94r3i5sWLk1ceU
    
    // decode, you must passed allowed algorithm(s) to prevent attackers to control the choice of algorithm
    $decoded = Jwt::decode($token, ['algorithm' => $alg]);
    
    echo $decoded['data']; // 'string'

### RSA

 * RS256 - RSA using SHA-256 hash algorithm

#### RS256 - RSA using SHA-256 hash algorithm

    <?php
    
    use Jwt\Jwt;
    use Jwt\Algorithm\RS256Algorithm;
    
    $privateKey = __DIR__ . '/key.pem';
    $publicKey = __DIR__ . '/key.pub';
    
    $token = Jwt::encode('string', $alg = new RS256Algorithm($privateKey, $publicKey));
    
    echo $token; // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoic3RyaW5nIn0.RncJbCyf4zd0pu1N02u_rKwEezkmd94r3i5sWLk1ceU
    
    // decode, you must passed allowed algorithm(s) to prevent attackers to control the choice of algorithm
    $decoded = Jwt::decode($token, ['algorithm' => $alg]);
    
    echo $decoded['data']; // 'string'


## Support for reserved claim names

JSON Web Token defines some reserved claim names and defines how they should be
used. JWT supports these reserved claim names:

 - 'exp' (Expiration Time) Claim
 - 'nbf' (Not Before Time) Claim
 - 'iss' (Issuer) Claim
 - 'aud' (Audience) Claim
 - 'jti' (JWT ID) Claim
 - 'iat' (Issued At) Claim
 - 'sub' (Subject) Claim

### Expiration Time Claim

The `exp` (expiration time) claim identifies the expiration time on or after which the JWT MUST NOT be accepted for processing. The processing of the `exp` claim requires that the current date/time MUST be before the expiration date/time listed in the `exp` claim. Implementers MAY provide for some small `leeway`, usually no more than a few minutes, to account for clock skew. Its value MUST be a number containing a ***NumericDate*** value. Use of this claim is OPTIONAL.

#### Handle Expiration Claim

    <?php
    
    use Jwt\Jwt;
    use Jwt\Algorithm\HS256Algorithm;
    use Jwt\Exception\ExpiredException;
    
    $payload = [
        Jwt::CLAIM_EXPIRATION => strtotime('1 day'),
        'data' => 'my data'
    ];
    
    $token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
    
    try {
        $token = Jwt::decode($token, ['algorithm' => $alg]);
    } catch (ExpiredException $e) {
        // Handle expired token, e.g. logout user or deny access
    }

#### Adding Leeway

    <?php
    
    use Jwt\Jwt;
    use Jwt\Algorithm\HS256Algorithm;
    use Jwt\Exception\ExpiredException;
    
    $leeway = 30; // 30 sec
    
    $payload = [
        Jwt::CLAIM_EXPIRATION => strtotime('1 day'),
        'data' => 'my data'
    ];
    
    $token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
    
    try {
        $token = Jwt::decode($token, ['algorithm' => $alg, 'leeway' => $leeway]);
    } catch (ExpiredException $e) {
        // Handle expired token, e.g. logout user or deny access
    }

### Not Before Time Claim

The `nbf` (not before) claim identifies the time before which the JWT MUST NOT be accepted for processing. The processing of the `nbf` claim requires that the current date/time MUST be after or equal to the not-before date/time listed in the `nbf` claim. Implementers MAY provide for some small `leeway`, usually no more than a few minutes, to account for clock skew. Its value MUST be a number containing a ***NumericDate*** value. Use of this claim is OPTIONAL.

#### Handle Not Before Claim

    <?php

    use Jwt\Jwt;
    use Jwt\Algorithm\HS256Algorithm;
    use Jwt\Exception\BeforeValidException;
    
    $payload = [
        Jwt::CLAIM_NOT_BEFORE => strtotime('1 day'),
        'data' => 'my data'
    ];
    
    $token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
    
    try {
        $token = Jwt::decode($token, ['algorithm' => $alg]);
    } catch (BeforeValidException $e) {
        // Handle invalid token, e.g. logout user or deny access
    }

### Issuer Claim

The `iss` (issuer) claim identifies the principal that issued the JWT. The processing of this claim is generally application specific. The `iss` value is a case-sensitive string containing a ***StringOrURI*** value. Use of this claim is OPTIONAL.

#### Handle Issuer Claim

See the payload verification section.

### Audience Claim

The `aud` (audience) claim identifies the recipients that the JWT is intended for. Each principal intended to process the JWT MUST identify itself with a value in the audience claim. If the principal processing the claim does not identify itself with a value in the `aud` claim when this claim is present, then the JWT MUST be rejected. In the general case, the `aud` value is an array of case-sensitive strings, each containing a ***StringOrURI*** value. In the special case when the JWT has one audience, the `aud` value MAY be a single case-sensitive string containing a ***StringOrURI*** value. The interpretation of audience values is generally application specific. Use of this claim is OPTIONAL.

#### Handle Audience Claim

See the payload verification section.

### JWT ID Claim

The `jti` (JWT ID) claim provides a unique identifier for the JWT. The identifier value MUST be assigned in a manner that ensures that there is a negligible probability that the same value will be accidentally assigned to a different data object; if the application uses multiple issuers, collisions MUST be prevented among values produced by different issuers as well. The `jti` claim can be used to prevent the JWT from being replayed. The `jti` value is a case-sensitive string. Use of this claim is OPTIONAL.

#### Handle JWT ID claim

See the payload verification section.

### Issued At Claim

The `iat` (issued at) claim identifies the time at which the JWT was issued. This claim can be used to determine the age of the JWT. Its value MUST be a number containing a ***NumericDate*** value. Use of this claim is OPTIONAL.

#### Handle Issued At Claim

See the payload verification section.

### Subject Claim

The `sub` (subject) claim identifies the principal that is the subject of the JWT. The Claims in a JWT are normally statements about the subject. The subject value MUST either be scoped to be locally unique in the context of the issuer or be globally unique. The processing of this claim is generally application specific. The sub value is a case-sensitive string containing a ***StringOrURI*** value. Use of this claim is OPTIONAL.

#### Handle Subject Claim

See the payload verification section.

## Payload verification

Payload data can be verified when decoding the token using the `verify` option. 
`Expiration` and `Not Before` claims are **ALWAYS** checked. 

    <?php
    
    use Jwt\Jwt;
    use Jwt\Algorithm\HS256Algorithm;
    use Jwt\Exception\VerificationException;
    
    $payload = [
        // expiration claim
        Jwt::CLAIM_EXPIRATION => strtotime('1 day'),
        // issuer claim
        Jwt::CLAIM_ISSUER => 'my-web-app',
        // custom claims
        'user' => 'administrator'
    ];
    
    $token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
    
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
        }
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
    
## Tests

Run the tests using phpunit:

    $ phpunit
    
## Credits

Jwt was inspired by jwt for ruby and firebase/jwt for php.
