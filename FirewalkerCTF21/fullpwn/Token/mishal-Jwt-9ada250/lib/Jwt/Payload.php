<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt;

/**
 * JWT Payload.
 *
 * The second part of the JWT token is the payload, which contains the claims.
 * Claims are statements about an entity (typically, the user) and additional metadata.
 * There are three types of claims: reserved, public, and private claims.
 */
final class Payload implements \ArrayAccess, \IteratorAggregate, \JsonSerializable
{
    use TDataHolder;
    use TDataJsonSerializable;
}
