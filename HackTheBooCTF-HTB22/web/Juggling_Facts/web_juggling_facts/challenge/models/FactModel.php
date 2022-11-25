<?php
class FactModel extends Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function get_facts($facts_type)
    {
        $facts = $this->database->query('SELECT * FROM facts WHERE fact_type = ?',[
            's' => [
                $facts_type
            ]
        ]);

        return $facts->fetch_all(MYSQLI_ASSOC) ?? [];
    }
}