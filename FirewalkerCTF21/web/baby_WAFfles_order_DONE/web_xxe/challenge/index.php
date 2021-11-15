<?php
spl_autoload_register(function ($name){
    if (preg_match('/Controller$/', $name))
    {
        $name = "controllers/${name}";
    }
    include_once "${name}.php";
});

$router = new Router();

$router->new('GET', '/', fn($router) => $router->view('menu'));
$router->new('POST', '/api/order', 'OrderController@order');

die($router->match());