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
 * Base class for RSA based algorithms.
 */
abstract class RsaAlgorithm implements IAlgorithm
{
    /**
     * @var string
     */
    protected $publicKey;

    /**
     * @var string
     */
    protected $privateKey;

    /**
     * @var resource
     */
    private $publicKeyRes;

    /**
     * @var resource
     */
    private $privateKeyRes;

    /**
     * Constructor.
     *
     * @param string $privateKey Path to a file containing private key
     * @param string $publicKey Path to a file containing public key
     * @param string $privateKeyPassPhrase Pass phrase to private key or path to a file containing the pass phrase
     */
    public function __construct($privateKey, $publicKey, $privateKeyPassPhrase = null)
    {
        $this->ensureSupport();

        $this->setPrivateKey($privateKey, $privateKeyPassPhrase);
        $this->setPublicKey($publicKey);
    }

    /**
     * @throws \RuntimeException
     */
    private function ensureSupport()
    {
        if (!function_exists('openssl_sign')) {
            throw new \RuntimeException('Openssl is required to use RSA encryption.');
        }

        if (!in_array($this->getAlgorithm(), openssl_get_md_methods(true))) {
            throw new \RuntimeException('Algorithm "%s" is not supported.', $this->getAlgorithm());
        }
    }

    /**
     * @return string
     */
    public function getPrivateKey()
    {
        return $this->privateKey;
    }

    /**
     * Sets the private key.
     *
     * @param string $privateKey The private key
     * @param string $passPhrase The Pass phrase to the private key
     *
     * @throws \InvalidArgumentException If the private key could not be loaded
     * @throws \RuntimeException If the private key file is not readable
     */
    public function setPrivateKey($privateKey, $passPhrase = null)
    {
        $this->privateKey = $privateKey;

        if ($passPhrase && is_file($passPhrase)) {
            Util::assertFileIsReadable($passPhrase);
            $passPhrase = file_get_contents($passPhrase);
        }

        if (is_file($privateKey)) {
            Util::assertFileIsReadable($privateKey);
            $this->privateKeyRes = openssl_get_privatekey('file://' . $privateKey, $passPhrase);
        } else {
            $this->privateKeyRes = openssl_get_privatekey($privateKey, $passPhrase);
        }

        // verify
        if (!is_resource($this->privateKeyRes)) {
            throw new \InvalidArgumentException('The private key could not be loaded: ' . implode("\n", $this->getSslErrors()));
        }
    }

    /**
     * @return string
     */
    public function getPublicKey()
    {
        return $this->publicKey;
    }

    /**
     * @param string $publicKey
     */
    public function setPublicKey($publicKey)
    {
        $this->publicKey = $publicKey;

        // this is a file
        if (is_file($publicKey)) {
            Util::assertFileIsReadable($publicKey);
            $this->publicKeyRes = openssl_get_publickey('file://' . $publicKey);
        } else {
            $this->publicKeyRes = openssl_get_publickey($publicKey);
        }

        // verify
        if (!is_resource($this->publicKeyRes)) {
            throw new \InvalidArgumentException('The public key could not be loaded.');
        }
    }

    /**
     * {@inheritdoc}
     */
    public function encrypt($value)
    {
        $result = openssl_sign($value, $signature, $this->privateKeyRes, $this->getAlgorithm());

        if (false === $result) {
            throw new \RuntimeException('Failed to encrypt value. ' . implode("\n", $this->getSslErrors()));
        }

        return $signature;
    }

    /**
     * {@inheritdoc}
     */
    public function verify($known, $user)
    {
        $result = openssl_verify($known, $user, $this->publicKeyRes, $this->getAlgorithm());

        if ($result === -1) {
            throw new \RuntimeException('Failed to verify signature. ' . implode("\n", $this->getSslErrors()));
        }

        return (boolean) $result;
    }

    /**
     * Returns algorithm as valid string returned by `openssl_get_md_methods()`.
     *
     * @return string
     */
    abstract protected function getAlgorithm();

    /**
     * @return array
     */
    private function getSslErrors()
    {
        $messages = [];

        while ($msg = openssl_error_string()) {
            $messages[] = $msg;
        }

        return $messages;
    }
}
