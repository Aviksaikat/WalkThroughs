<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\test\unit;

use Jwt\Algorithm\HS256Algorithm;
use Jwt\Algorithm\NoneAlgorithm;
use Jwt\Algorithm\RS256Algorithm;
use Jwt\Jwt;
use Jwt\Payload;

class JwtTest extends \PHPUnit_Framework_TestCase
{
    protected static function getMethod($name)
    {
        $class = new \ReflectionClass('Jwt\Jwt');
        $method = $class->getMethod($name);
        $method->setAccessible(true);

        return $method;
    }

    public function testUrlSafeCharacters()
    {
        $encoded = Jwt::encode('f?', $alg = new HS256Algorithm('a'));
        $decoded = Jwt::decode($encoded, ['algorithm' => $alg]);

        $this->assertInstanceOf('Jwt\Token', $decoded);
        $this->assertEquals('f?', $decoded['data']);
    }

    public function testMalformedUtf8StringsFail()
    {
        $this->setExpectedException('Jwt\Exception\JsonException');
        Jwt::encode(pack('c', 128), new NoneAlgorithm());
    }

    public function testMalformedJsonThrowsException()
    {
        $this->setExpectedException('Jwt\Exception\JsonException');
        $method = self::getMethod('jsonDecode');
        $method->invokeArgs(null, ['this is not valid JSON string']);
    }

    public function testExpiredToken()
    {
        $this->setExpectedException('Jwt\Exception\ExpiredException');

        $payload = [
            'data' => 'abc',
            Jwt::CLAIM_EXPIRATION => time() - 20,
        ]; // time in the past

        $encoded = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));

        Jwt::decode($encoded, ['algorithm' => $alg]);
    }

    public function testBeforeValidTokenWithNbf()
    {
        $this->setExpectedException('Jwt\Exception\BeforeValidException');
        $payload = [
            'data' => 'abc',
            Jwt::CLAIM_NOT_BEFORE => time() + 20,
        ]; // time in the future

        $encoded = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
        Jwt::decode($encoded, ['algorithm' => $alg]);
    }

    public function testBeforeValidTokenWithIat()
    {
        $this->setExpectedException('Jwt\Exception\BeforeValidException');

        $payload = [
            'data' => 'abc',
            'iat' => time() + 20,
        ]; // time in the future

        $encoded = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
        Jwt::decode($encoded, ['algorithm' => $alg]);
    }

    public function testValidToken()
    {
        $payload = [
            'data' => 'abc',
            'exp' => time() + 20,
        ]; // time in the future

        $encoded = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
        $decoded = Jwt::decode($encoded, ['algorithm' => $alg, 'leeway' => 30]);

        $this->assertEquals($decoded['data'], 'abc');
    }

    public function testValidTokenWithLeeway()
    {
        $payload = [
            'data' => 'abc',
            'exp' => time() - 20,
        ]; // time in the past

        $encoded = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));
        $decoded = Jwt::decode($encoded, ['algorithm' => $alg, 'leeway' => 60]);
        $this->assertEquals($decoded['data'], 'abc');
    }

    public function testHS256()
    {
        $msg = ['data' => 'foobar'];

        $token = Jwt::encode($msg, $alg = new HS256Algorithm('secret key'));

        $decoded = Jwt::decode($token, ['algorithm' => $alg]);
        $this->assertInstanceOf('Jwt\Token', $decoded);
        $this->assertEquals($msg, $decoded->getPayload()->toArray());
    }

    public function testAlgorithmNotAllowed()
    {
        $msg = ['data' => 'foobar'];
        $token = Jwt::encode($msg, new HS256Algorithm('secret key'));

        $this->setExpectedException('Jwt\Exception\AlgorithmNotAllowedException');
        // no algorithm set
        Jwt::decode($token);
    }

    public function testInvalidToken()
    {
        $payload = [
            'data' => 'abc',
            'exp' => time() + 20,
        ]; // time in the future

        $encoded = Jwt::encode($payload, new HS256Algorithm('secret key'));

        $this->setExpectedException('Jwt\Exception\SignatureInvalidException');

        Jwt::decode($encoded, ['algorithm' => new HS256Algorithm('another secret key')]);
    }

    public function testSkipVerification()
    {
        $msg = ['data' => 'foobar'];
        $token = Jwt::encode($msg, $alg = new HS256Algorithm('secret key'));
        $decoded = Jwt::decode($token, ['algorithm' => $alg]);

        $this->assertInstanceOf('Jwt\Token', $decoded);
        $this->assertEquals($msg, $decoded->getPayload()->toArray());
    }

    public function testSkipNoneAlgorithm()
    {
        $msg = ['data' => 'foobar'];

        $token = Jwt::encode($msg, new NoneAlgorithm());

        $decoded = Jwt::decode($token, ['algorithm' => new NoneAlgorithm()]);

        $this->assertInstanceOf('Jwt\Token', $decoded);
        $this->assertEquals($msg, $decoded->getPayload()->toArray());
    }

    public function testDecodeThrowsException()
    {
        $this->setExpectedException('Jwt\Exception\TokenMalformedException');
        Jwt::decode('foobar');
    }

    public function testRS256()
    {
        $msg = ['data' => 'foobar'];
        $token = Jwt::encode($msg, $alg = new RS256Algorithm(__DIR__ . '/key.pem', __DIR__ . '/key.pub'));
        $decoded = Jwt::decode($token, ['algorithm' => $alg]);

        $this->assertInstanceOf('Jwt\Token', $decoded);
        $this->assertEquals($msg, $decoded->getPayload()->toArray());
    }

    public function testRS256WithKeyPassphrase()
    {
        $msg = ['data' => 'foobar'];
        $token = Jwt::encode($msg, $alg = new RS256Algorithm(
            __DIR__ . '/key_passphrase.pem',
            __DIR__ . '/key_passphrase.pub',
            __DIR__ . '/passphrase.txt'
        ));

        $decoded = Jwt::decode($token, ['algorithm' => $alg]);

        $this->assertInstanceOf('Jwt\Token', $decoded);
        $this->assertEquals($msg, $decoded->getPayload()->toArray());
    }

    public function testVerificationData()
    {
        $payload = new Payload([
            Jwt::CLAIM_ISSUER => 'my-data',
        ]);

        $token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));

        $this->setExpectedException('Jwt\Exception\VerificationException', 'iss');

        Jwt::decode($token, ['algorithm' => $alg, 'verify' => [
            Jwt::CLAIM_ISSUER => 'my-company',
            Jwt::CLAIM_AUDIENCE => function ($value) {
                var_dump($value);
                if ($value === 'foobar') {
                    return true;
                }

                return false;
            },
        ]]);
    }

    public function testVerificationDataWithClosure()
    {
        $payload = new Payload([
            Jwt::CLAIM_AUDIENCE => ['God\s people'],
        ]);

        $token = Jwt::encode($payload, $alg = new HS256Algorithm('secret'));

        $called = false;
        Jwt::decode($token, ['algorithm' => $alg, 'verify' => [
            Jwt::CLAIM_AUDIENCE => function ($value) use (&$called) {
                $called = true;

                return true;
            },
        ]]);

        $this->assertTrue($called, 'Verification callback has been called');
    }

    public function testUnsupportedOptions()
    {
        $this->setExpectedException('LogicException', '"unsupported_option", "verification"');

        Jwt::decode('foobar', [
            'unsupported_option' => true,
            'verification' => [
                'foo' => 'bar',
            ],
        ]);
    }

    public function testWithCustomHeaders()
    {
        $encoded = Jwt::encode('foobar', $alg = new HS256Algorithm('secret'), [
            'header' => ['foo' => 'bar'],
        ]);

        $decoded = Jwt::decode($encoded, ['algorithm' => $alg, 'with_head' => true]);

        $this->assertInstanceOf('Jwt\Token', $decoded);

        $this->assertEquals([
            'typ' => 'JWT',
            'alg' => 'HS256',
            'foo' => 'bar',
        ], $decoded->getHeader()->toArray());
    }
}
