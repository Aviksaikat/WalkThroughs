<?php spl_autoload_register(function ($name) {
    if (preg_match('/Controller$/', $name)) {
        $name = "controllers/${name}";
    } elseif (preg_match('/Model$/', $name)) {
        $name = "models/${name}";
    }
    include_once "${name}.php";
});

$database = new Database('localhost', 'root', 'M@k3l@R!d3s$', 'web_juggling_facts');
$database->connect();

$router = new Router();
$router->new('GET', '/', 'IndexController@index');

$router->new('POST','/api/getfacts', 'IndexController@getfacts');

die($router->match());