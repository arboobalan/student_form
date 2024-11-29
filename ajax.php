<?php
include './class/function.php';
include './message.php';

global $response; 
if($_POST['action']){
    switch ($_POST['action']) {
        case 'getStudents':
            $result = getStudents($_POST);
            break;
        case 'saveStudent':
            $result = saveStudent($_POST);
            break;
        case 'getStudentDetails':
            $result = getStudentDetails($_POST['stud_id']);
            break;
        case 'getDistricts':
            $result = getDistricts($_POST);
            break;
        case 'deleteStudent':
            $result = deleteStudent($_POST);
            break;
        case 'downloadStudentList':
            $result = downloadStudentList($_POST);
            break;
        default:
            $result = $response->invalidaccess("Access Denied");
            break;
    }
    echo $result;
} else {
    $result = $response->errors("Unauthorized!");
}
?>