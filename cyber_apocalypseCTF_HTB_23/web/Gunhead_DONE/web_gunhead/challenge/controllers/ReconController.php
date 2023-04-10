<?php
class ReconController
{
    public function index($router)
    {
        return $router->view('index');
    }

    public function ping($router)
    {
        $jsonBody = json_decode(file_get_contents('php://input'), true);

        if (empty($jsonBody) || !array_key_exists('ip', $jsonBody))
        {
            return $router->jsonify(['message' => 'Insufficient parameters!']);
        }

        $pingResult = new ReconModel($jsonBody['ip']);

        return $router->jsonify(['output' => $pingResult->getOutput()]);
    }
}