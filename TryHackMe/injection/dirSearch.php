<?php
	
	//it's taken form the tryhackme website
	if(isset($_GET["uername"]))
	{
		$username = $_GET["username"];

		$command = ("awk -F: '{print $1}' /etc/passwd | grep $username");

		$returned_user = exec($command);
		if($returned_user == "")
		{
			$result = "<div class='alert alert-danger' role='alert'>
			<strong>Error!</strong> User <b>$username</b> was not found</div>";
		}
		else
		{
			$result = "<div class='alert alert-success' role='alert'>
			<strong>Success!</strong> User <b>$username</b> was found</div>";
		}
		echo $result;
	}
	/*In pseudocode, the above snippet is doing the following:

	1. Checking if the parameter "username" is set

	2. If it is, then the variable $username gets what was passed into the input field

	3. The variable $command gets the system command "awk -F: '{print $1}' /etc/passwd | grep $username"; where $username is what was entered in step 2.  This command is printing out the list of users from /etc/passwd and then selecting the one that was entered.  Note that this is not executing anything yet.

	4. Variable $returned_user then gets the result/return value of the function exec($command).

	The rest of the code is fairly straightforward; set $result to a Bootstrap danger alert class if nothing was found in /etc/passwd and a success alert class if something was found.  Easy-peasy.
	*/
?>