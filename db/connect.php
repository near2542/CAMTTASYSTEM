<?php
$mode = "production";
if($mode !== "production")
{
	$host = 'localhost';
	$username = 'root';
	$password = '';
	$port = null;
	$dbname = 'tasys2';
}
else {
	$host = 'mysql-for-hosting';
	$username = 'tasystemdb';
	$password = 'O6jya0MONo41';
	$port = null;
	$dbname = 'tasystemdb';
}
	$conn= new mysqli($host,$username,$password,$dbname,$port) or die("Could not connect to mysql".mysqli_error($conn));
	
?>
