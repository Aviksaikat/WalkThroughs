<?php
class Controller 
{
    public function __construct()
    {
        $this->database = Database::getDatabase();
        $this->facts = new FactModel;
    }
} 