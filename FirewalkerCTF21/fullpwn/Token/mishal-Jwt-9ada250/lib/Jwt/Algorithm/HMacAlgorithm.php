<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Jwt\Algorithm;

use Jwt\Util;

/**
 * Base class for HMAc based algorithms.
 */
abstract class HMacAlgorithm implements IAlgorithm
{
    /**
     * @var string
     */
    private $secret;

    /**
     * @param string $secret Secret or path to a file with secret
     */
    public function __construct($secret)
    {
        if (is_file($secret)) {
            Util::assertFileIsReadable($secret);
            $secret = file_get_contents($secret);
        }

        $this->secret = $secret;
        $this->ensureSupport();
    }

    /**
     * @throws \RuntimeException
     */
    private function ensureSupport()
    {
        if (!in_array($this->getAlgorithm(), hash_algos())) {
            throw new \RuntimeException(sprintf(
                'The algorithm "%s" is not supported on this system.',
                $this->getAlgorithm()
            ));
        }
    }

    /**
     * {@inheritdoc}
     */
    public function encrypt($value)
    {
        return hash_hmac($this->getAlgorithm(), $value, $this->secret, true);
    }

    /**
     * {@inheritdoc}
     */
    public function verify($known, $user)
    {
        return hash_equals($this->encrypt($known), $user);
    }

    /**
     * @return string
     */
    abstract protected function getAlgorithm();
}
