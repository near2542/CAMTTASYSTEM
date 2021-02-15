<?php

	$host = 'localhost';
	$username = 'root';
	$password = '';
	$port = null;
	$dbname = 'tasys';

	$conn= new mysqli($host,$username,$password,$dbname,$port) or die("Could not connect to mysql".mysqli_error($con));
	
?>
