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



if(isset($_POST['update']))
{
$old = $_GET['old'];
$id = $_POST['course_id'];
$course_name = $_POST['course_name'];
$major_id = $_POST['major_id'];
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
    $_SESSION['error'] = "Course Duplicated";
    header('location: ./course.php'); exit(0);
}

$insert = sprintf("Update course SET course_id='%d',course_name='%s',major_id='%d' where course_id = '%d' ",
    $conn->real_escape_string($id),
    $conn->real_escape_string($course_name),
    $conn->real_escape_string($major_id),
    $conn->real_escape_string($old),
);

$status = $conn->query($insert);

if($status) {
    $_SESSION['error'] = "Update Course Success";
    header($redirect); exit(0);
}

$_SESSION['error'] = "Update Course Failed";
 header($redirect);
 exit(0);



?>