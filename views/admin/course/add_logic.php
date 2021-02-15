<?php
$redirect = 'location: ../course.php';


require_once ('../../../db/connect.php');

session_start();
$conn->init();

if($_SESSION['role']!=1)
{
    header($redirect);
    exit(0);
}

if(isset($_POST['add']))
{
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
    $_SESSION['error'] = "Course Already Exits!";
    header($redirect); exit(0);
}

$insert = sprintf("INSERT INTO course (course_id,course_name,major_id) values ('%d','%s','%d')",
    $conn->real_escape_string($id),
    $conn->real_escape_string($course_name),
    $conn->real_escape_string($major_id),
);

$status = $conn->query($insert);

if($status) {
    $_SESSION['error'] = "Add Course Success";
    header($redirect); exit(0);
}

$_SESSION['error'] = "Add Course Failed";
 header($redirect);
 exit(0);



?>