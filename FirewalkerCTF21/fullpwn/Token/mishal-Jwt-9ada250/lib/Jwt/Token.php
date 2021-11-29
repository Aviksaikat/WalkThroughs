<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt;

/**
 * Token represents JWT token.
 */
final class Token implements \ArrayAccess, \IteratorAggregate
{
    /**
     * @var Header
     */
    private $header;

    /**
     * @var Payload
     */
    private $payload;

    /**
     * Token constructor.
     *
     * @param Header $header
     * @param Payload $payload
     */
    public function __construct(Header $header, Payload $payload)
    {
        $this->header = $header;
        $this->payload = $payload;
    }

    /**
     * @return Header
     */
    public function getHeader()
    {
        return $this->header;
    }

    /**
     * @return Payload
     */
    public function getPayload()
    {
        return $this->payload;
    }

    public function offsetExists($offset)
    {
        return isset($this->payload[$offset]);
    }

    public function offsetGet($offset)
    {
        return $this->payload[$offset];
    }

    /**
     * @SuppressWarnings(PHPMD.UnusedFormalParameter)
     */
    public function offsetSet($offset, $value)
    {
        throw new \LogicException('The token is read only');
    }

    /**
     * @SuppressWarnings(PHPMD.UnusedFormalParameter)
     */
    public function offsetUnset($offset)
    {
        throw new \LogicException('The token is read only');
    }

    public function getIterator()
    {
        return new \ArrayIterator($this->payload->toArray());
    }
}
