<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\test\unit;

use Jwt\Jwt;
use Jwt\Payload;

// http://stackoverflow.com/questions/4294689/how-to-generate-a-key-with-passphrase-from-the-command-line
class PayloadTest extends \PHPUnit_Framework_TestCase
{
    public function testArrayAccess()
    {
        $payload = new Payload();
        $payload[Jwt::CLAIM_ISSUER] = 'My-company';
        $this->assertEquals('My-company', $payload[Jwt::CLAIM_ISSUER]);
    }

    public function testInvalidKey()
    {
        $payload = new Payload();

        unset($payload['foo']);
    }

    public function testTraversable()
    {
        $payload = new Payload([
            'foo' => 'bar',
        ]);

        foreach ($payload as $p => $v) {
            $this->assertEquals('foo', $p);
            $this->assertEquals('bar', $v);
        }
    }
}
