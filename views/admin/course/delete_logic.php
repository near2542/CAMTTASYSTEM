<?php
require_once ('../../../db/connect.php');

$redirect = 'location: ../course.php';

session_start();
$conn->init();
if($_SESSION['role']!=1)
{
    header($redirect);
    exit(0);
}



if(isset($_POST['delete']))
{
$old = $_GET['old'];
}
else {
    header($redirect);
    exit(0);
}

$query = sprintf("SELECT * FROM course WHERE course_id = %d",$conn->real_escape_string($id));
echo $query;
$existCourses = $conn->query($query);
var_dump($existCourses->num_rows);
if($existCourses->num_rows > 0) { 
    $conn->close();
    $_SESSION['error'] = "Delete failed";
    header('location: ./course.php'); exit(0);
}

$insert = sprintf("Update course SET deleted='1' where course_id = '%d' ",
    $conn->real_escape_string($old),
);

$status = $conn->query($insert);

if($status) {
    $_SESSION['error'] = "Delete Success";
    header($redirect); exit(0);
}

$_SESSION['error'] = "Delete Failed";
 header($redirect);
 exit(0);



?>