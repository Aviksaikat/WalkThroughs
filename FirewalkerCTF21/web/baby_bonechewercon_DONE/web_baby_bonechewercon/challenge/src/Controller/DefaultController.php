<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends AbstractController
{
    public function index(Request $request)
    {
        if ($request->get('name'))
        {
            $name = $request->get('name');
            $message = $this->get('twig')
                ->createTemplate(
                    "Thank you for registering, ${name}</br>"
                )
                ->render();
        }

        return $this->render('base.html.twig', [
            'message' => $message ?? ''
        ]);
    }

    public function showSource()
    {
        return new Response(
            show_source(__FILE__)
        );
    }
}