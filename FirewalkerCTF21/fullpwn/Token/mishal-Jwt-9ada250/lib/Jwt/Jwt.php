<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt;

use Jwt\Algorithm\IAlgorithm;
use Jwt\Exception\AlgorithmMissingException;
use Jwt\Exception\AlgorithmNotAllowedException;
use Jwt\Exception\BeforeValidException;
use Jwt\Exception\ExpiredException;
use Jwt\Exception\JsonException;
use Jwt\Exception\SignatureInvalidException;
use Jwt\Exception\TokenMalformedException;

/**
 * JWT - JSON Web Tokens.
 *
 * @link http://tools.ietf.org/html/rfc7519
 */
final class Jwt
{
    /**
     * Issuer claim.
     *
     * The iss (issuer) claim identifies the principal that issued the JWT.
     * The processing of this claim is generally application specific.
     * The iss value is a case-sensitive string containing a StringOrURI value.
     * Use of this claim is OPTIONAL.
     */
    const CLAIM_ISSUER = 'iss';

    /**
     * Expiration time.
     *
     * The exp (expiration time) claim identifies the expiration time on or after which the
     * JWT MUST NOT be accepted for processing.
     * The processing of the exp claim requires that the current date/time MUST be before
     * the expiration date/time listed in the exp claim. Implementers MAY provide for some small leeway,
     * usually no more than a few minutes, to account for clock skew.
     * Its value MUST be a number containing a NumericDate value.
     * Use of this claim is OPTIONAL.
     */
    const CLAIM_EXPIRATION = 'exp';

    /**
     * Not before claim.
     *
     * The nbf (not before) claim identifies the time before which the JWT MUST NOT be accepted for processing. The
     * processing of the nbf claim requires that the current date/time MUST be after or equal to the not-before date/time
     * listed in the nbf claim. Implementers MAY provide for some small leeway, usually no more than a few minutes, to
     * account for clock skew. Its value MUST be a number containing a NumericDate value.
     * Use of this claim is OPTIONAL.
     */
    const CLAIM_NOT_BEFORE = 'nbf';

    /**
     * Issued at claim.
     *
     * The iat (issued at) claim identifies the time at which the JWT was issued.
     * This claim can be used to determine the age of the JWT.
     * Its value MUST be a number containing a NumericDate value.
     * Use of this claim is OPTIONAL.
     */
    const CLAIM_ISSUED_AT = 'iat';

    /**
     * Subject.
     *
     * The sub (subject) claim identifies the principal that is the subject of the JWT.
     * The Claims in a JWT are normally statements about the subject.
     * The subject value MUST either be scoped to be locally unique in the context of the
     * issuer or be globally unique. The processing of this claim is generally application specific.
     * The sub value is a case-sensitive string containing a StringOrURI value.
     * Use of this claim is OPTIONAL.
     */
    const CLAIM_SUBJECT = 'sub';

    /**
     * Audience.
     *
     * The aud (audience) claim identifies the recipients that the JWT is intended for.
     * Each principal intended to process the JWT MUST identify itself with a value in the audience claim.
     * If the principal processing the claim does not identify itself with a value in the aud claim
     * when this claim is present, then the JWT MUST be rejected.
     * In the general case, the aud value is an array of case-sensitive strings, each containing a StringOrURI value.
     * In the special case when the JWT has one audience, the aud value MAY be a
     * single case-sensitive string containing a StringOrURI value.
     * The interpretation of audience values is generally application specific.
     * Use of this claim is OPTIONAL.
     */
    const CLAIM_AUDIENCE = 'aud';

    /**
     * JWT ID claim.
     *
     * The jti (JWT ID) claim provides a unique identifier for the JWT. The identifier value MUST be assigned
     * in a manner that ensures that there is a negligible probability that the same value will be
     * accidentally assigned to a different data object; if the application uses multiple issuers,
     * collisions MUST be prevented among values produced by different issuers as well.
     * The jti claim can be used to prevent the JWT from being replayed.
     * The jti value is a case-sensitive string. Use of this claim is OPTIONAL.
     */
    const CLAIM_JWT_ID = 'jti';

    /**
     * Array of default options.
     *
     * @var array
     */
    private static $defaultDecodeOptions = [
        // leeway
        'leeway' => 0,
        // include head
        'with_head' => false,
    ];

    /**
     * Array of valid options.
     *
     * @var array
     */
    private static $validDecodeOptions = [
        'algorithm',
        'leeway',
        'verify',
        // include head?
        'with_head',
    ];

    /**
     * Constructor.
     */
    private function __construct()
    {
    }

    /**
     * Encode the data using the algorithm.
     *
     * @param string|array|Payload $data The data to encode. If string will be passed, it will be put in `data` key to the payload.
     * @param IAlgorithm $algorithm The algorithm to use
     * @param array $options Array of options
     *
     * @return string The json web token
     */
    public static function encode($data, IAlgorithm $algorithm, array $options = [])
    {
        // prepare the header
        $header = new Header([
            'typ' => 'JWT',
            'alg' => $algorithm->getName(),
        ]);

        // custom header
        if (isset($options['header'])) {
            foreach ((array) $options['header'] as $k => $v) {
                $header[$k] = $v;
            }
        }

        $payload = $data instanceof Payload ? $data : new Payload(
            is_array($data) ? $data : ['data' => $data]
        );

        $segments = [];
        $segments[] = static::safeUrlEncode(static::jsonEncode($header));
        $segments[] = static::safeUrlEncode(static::jsonEncode($payload));
        $signature = $algorithm->encrypt(implode('.', $segments));
        $segments[] = static::safeUrlEncode($signature);

        return implode('.', $segments);
    }

    /**
     * Decodes the token.
     *
     * @param string $token The token
     * @param array $options Array of options
     *
     * @throws TokenMalformedException If the token is malformed
     * @throws SignatureInvalidException If the signature is invalid
     * @throws AlgorithmMissingException If the token is missing the algorithm
     * @throws AlgorithmNotAllowedException If the algorithm is not allowed
     * @throws BeforeValidException If the token is used not before claim
     * @throws ExpiredException If the token is in expired state
     * @throws \LogicException If there is any developer specific issue (wrong option,...)
     *
     * @return Token
     */
    public static function decode($token, array $options = [])
    {
        $options = array_replace(static::$defaultDecodeOptions, $options);

        if ($diff = array_diff(array_keys($options), static::$validDecodeOptions)) {
            throw new \InvalidArgumentException(sprintf(
                'The option(s) "%s" are not supported.',
                implode('", "', $diff)
            ));
        }

        list($header, $headerEncoded, $payload, $payloadEncoded, $signature) = static::getTokenParts($token);

        $algorithm = static::getAlgorithm($header);
        $verifyWith = static::getVerificationAlgorithm($algorithm, $options);

        // Check the signature
        if (!$verifyWith->verify($headerEncoded . '.' . $payloadEncoded, $signature)) {
            throw new SignatureInvalidException('Signature verification failed');
        }

        static::verifyPayload($payload, $options);

        return new Token(
            $header,
            $payload
        );
    }

    private static function getAlgorithm($header)
    {
        if (!isset($header['alg'])) {
            throw new AlgorithmMissingException();
        }

        return (string) $header['alg'];
    }

    /**
     * @param string $algorithm
     * @param array $options
     *
     * @return IAlgorithm
     *
     * @throws AlgorithmNotAllowedException
     */
    private static function getVerificationAlgorithm($algorithm, $options)
    {
        $allowedAlgorithms = isset($options['algorithm']) ? $options['algorithm'] : [];
        if (!is_array($allowedAlgorithms)) {
            $allowedAlgorithms = [$allowedAlgorithms];
        }

        $verifyWith = false;
        foreach ($allowedAlgorithms as $allowedAlgorithm) {
            if (!$allowedAlgorithm instanceof IAlgorithm) {
                throw new \LogicException(sprintf('The algorithm "%s" is not instance of Algorithm', $allowedAlgorithm));
            }
            if ($allowedAlgorithm->getName() === $algorithm) {
                $verifyWith = $allowedAlgorithm;
                break;
            }
        }

        if (!$verifyWith) {
            throw new AlgorithmNotAllowedException($algorithm);
        }

        return $verifyWith;
    }

    private static function getTokenParts($token)
    {
        $parts = explode('.', $token);
        if (3 !== count($parts)) {
            throw new TokenMalformedException('Wrong number of segments in the token');
        }

        list($headerEncoded, $payloadEncoded, $signatureEncoded) = $parts;

        if (null === ($header = static::jsonDecode(static::safeUrlDecode($headerEncoded)))) {
            throw new TokenMalformedException('Invalid header encoding');
        }

        if (null === $payload = static::jsonDecode(static::safeUrlDecode($payloadEncoded))) {
            throw new TokenMalformedException('Invalid claims encoding');
        }

        $signature = static::safeUrlDecode($signatureEncoded);

        return [
            new Header($header), $headerEncoded, new Payload($payload), $payloadEncoded, $signature,
        ];
    }

    private static function verifyPayload(Payload $payload, $options)
    {
        // Check if the nbf if it is defined. This is the time that the
        // token can actually be used. If it's not yet that time, abort.
        if (isset($payload[self::CLAIM_NOT_BEFORE]) &&
            $payload[self::CLAIM_NOT_BEFORE] > (time() + $options['leeway'])
        ) {
            throw new BeforeValidException(
                'Cannot handle token prior to ' . date(\DateTime::ISO8601, $payload[self::CLAIM_NOT_BEFORE])
            );
        }

        // Check that this token has been created before 'now'. This prevents
        // using tokens that have been created for later use (and haven't
        // correctly used the nbf claim).
        if (isset($payload[self::CLAIM_ISSUED_AT]) && $payload[self::CLAIM_ISSUED_AT] > (time() + $options['leeway'])) {
            throw new BeforeValidException(
                'Cannot handle token prior to ' . date(\DateTime::ISO8601, $payload[self::CLAIM_ISSUED_AT])
            );
        }

        // Check if this token has expired.
        if (isset($payload[self::CLAIM_EXPIRATION]) && (time() - $options['leeway']) >= $payload[self::CLAIM_EXPIRATION]) {
            throw new ExpiredException('Expired token');
        }

        // custom verification data
        if (isset($options['verify'])) {
            $verification = $options['verify'];
            if (!$verification instanceof VerificationData) {
                $verification = new VerificationData($verification);
            }
            $verification->verifyPayload($payload);
        }
    }

    /**
     * Decode a string with URL-safe Base64.
     *
     * @param string $input A Base64 encoded string
     *
     * @return string A decoded string
     */
    private static function safeUrlDecode($input)
    {
        $remainder = strlen($input) % 4;
        if ($remainder) {
            $pad = 4 - $remainder;
            $input .= str_repeat('=', $pad);
        }

        return base64_decode(strtr($input, '-_', '+/'));
    }

    /**
     * Encode a string with URL-safe Base64.
     *
     * @param string $input The string you want encoded
     *
     * @return string The base64 encrypt of what you passed in
     */
    private static function safeUrlEncode($input)
    {
        return str_replace('=', '', strtr(base64_encode($input), '+/', '-_'));
    }

    /**
     * Decode a JSON string into a PHP object.
     *
     * @param string $input JSON string
     *
     * @return array Array representation of JSON string
     *
     * @throws JsonException Provided string was invalid JSON
     */
    private static function jsonDecode($input)
    {
        $array = json_decode($input, true, 512, JSON_BIGINT_AS_STRING);

        if ($errorCode = json_last_error()) {
            throw new JsonException(null, $errorCode);
        } elseif ($array === null && $input !== 'null') {
            throw new JsonException('Null result with non-null input');
        }

        return $array;
    }

    /**
     * Encode a PHP object into a JSON string.
     *
     * @param object|array $input A PHP object or array
     *
     * @return string JSON representation of the PHP object or array
     *
     * @throws JsonException If encoding failed
     */
    private static function jsonEncode($input)
    {
        $json = json_encode($input);
        if ($errorCode = json_last_error()) {
            throw new JsonException(null, $errorCode);
        } elseif ($json === 'null' && $input !== null) {
            throw new JsonException('Null result with non-null input');
        }

        return $json;
    }
}
