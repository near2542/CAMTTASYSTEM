<?php
$mode = "develop";
if($mode !== "production")
{
	$host = 'localhost';
	$username = 'root';
	$password = '';
	$port = null;
	$dbname = 'tasys';
}
else {
	$host = 'mysql-for-hosting';
	$username = 'tadb';
	$password = 'w09gmt6EP6D5';
	$port = null;
	$dbname = 'tadb';
}
	$conn= new mysqli($host,$username,$password,$dbname,$port) or die("Could not connect to mysql".mysqli_error($conn));
	
?>
