<?php

/*
 * This file is part of Jwt for Php.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

if (!file_exists(dirname(__FILE__) . '/../../vendor/autoload.php')) {
    echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' . PHP_EOL;
    echo ' You need to execute `composer install` before running the tests. ' . PHP_EOL;
    echo '         Vendors are required for complete test execution.        ' . PHP_EOL;
    echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' . PHP_EOL . PHP_EOL;
    exit(1);
}

// require composer autoloader
require_once dirname(__FILE__) . '/../../vendor/autoload.php';

// Setup environment for tests
define('CI_SERVER', getenv('CI_SERVER'));
define('CI_SERVER_NAME', getenv('CI_SERVER_NAME'));
define('CI_SERVER_IS_GITLAB_CI', stripos(CI_SERVER_NAME, 'gitlab') !== false);
define('CI_CURRENT_BRANCH', getenv('CI_BUILD_REF_NAME'));

// CI build info
if (CI_CURRENT_BRANCH) {
    printf('Current branch: "%s"' . PHP_EOL, CI_CURRENT_BRANCH);
}
