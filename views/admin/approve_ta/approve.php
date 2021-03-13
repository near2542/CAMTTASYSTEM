<?php
session_start();

require_once '../../../db/connect.php';
if($_SESSION['role'] == 3) header('location:../../index.php');


if($_GET['id'])
{
    $registerid = $_GET['id'];
}
else
{
    $_SESSION['error'] = 'SOMETHING WENT WRONG PLEASE CONTACT ADMIN';
    header('location:../approve_ta.php');
    exit(0);
}



$approveQuery = sprintf("UPDATE register SET r_status = 2
                WHERE register_id ='%d'",mysqli_escape_string($conn,$registerid));


$result =mysqli_query($conn,$approveQuery);

if(!$result || mysqli_error($conn))
{
    $_SESSION['error'] = 'SOMETHING WENT WRONG';
    header('location:../approve.ta.php');
    exit(0);
}

$_SESSION['error'] = 'add success';
header('location:../approve_ta.php');
exit(0);
?>