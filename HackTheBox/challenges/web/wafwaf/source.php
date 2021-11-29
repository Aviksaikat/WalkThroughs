<?php error_reporting(0);
require 'config.php';

class db extends Connection 
{
    public function waf($s) 
    {
        if (preg_match_all('/'. implode('|', array(
            '[' . preg_quote("(*<=>|'&-@") . ']',
            'select', 'and', 'or', 'if', 'by', 'from', 
            'where', 'as', 'is', 'in', 'not', 'having'
        )) . '/i', $s, $matches)) 
            die(var_dump($matches[0]));
        
        return json_decode($s);
    }

    public function query($sql) 
    {
        $args = func_get_args();
        unset($args[0]);
        return parent::query(vsprintf($sql, $args));
    }
}

$db = new db();

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{
    $obj = $db->waf(file_get_contents('php://input'));
    $db->query("SELECT note FROM notes WHERE assignee = '%s'", $obj->user);

} 
else 
{
    die(highlight_file(__FILE__, 1));
}
?>