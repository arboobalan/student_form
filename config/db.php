<?php 
$HOST = 'localhost';
$USERNAME = 'root';
$PASSWORD = '';
$DATABASE = 'student';

$conn = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DATABASE);
global $conn;

if(!$conn) {
    echo "Please check the DB connection";
}

?>