<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt;

/**
 * JWT header.
 */
final class Header implements \ArrayAccess, \IteratorAggregate, \JsonSerializable
{
    use TDataHolder;
    use TDataJsonSerializable;
}
