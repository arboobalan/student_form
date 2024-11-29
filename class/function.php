<?php 
include './config/db.php';

function getStudents() {
    global $conn, $response;
    $studentData = "SELECT sd.stud_id, sd.student_name, sd.email, sd.stu_address, CONCAT(UCASE(LEFT(sd1.district_name, 1)), 
    LCASE(SUBSTRING(sd1.district_name, 2))) AS 'district_name', sd.mobile FROM student_data sd  
    INNER JOIN stu_district sd1 ON sd1.district_id = sd.district
    WHERE sd.is_deleted = 0 AND sd1.is_deleted = 0 ORDER BY stud_id DESC";
    
    $resStudent = mysqli_query($conn, $studentData);
    if ($resStudent) {
        $result = mysqli_fetch_all($resStudent, MYSQLI_ASSOC);
        $_result = $response->success("Successfully displayed student details",  $result);
    }else{
        $_result = $response->error("Student details getting error");
    }
    return json_encode(['meta' => $_result]); 
}

function saveStudent() {
    global $conn, $response;
    $stud_id = $_POST['stud_id'];
    $student_name = $_POST['student_name'];
    $email = $_POST['email'];
    $stu_address = $_POST['stu_address'];
    $district = $_POST['district'];
    $mobile =$_POST['mobile'];

    if (empty($student_name) || empty($email) || empty($stu_address) || empty($district) || empty($mobile)) {
        $result = $response->error("All fields are required");
        return json_encode(['meta' => $result]);
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $result = $response->error("Invalid email address");
        return json_encode(['meta' => $result]);
    }

    $_email = "SELECT * FROM student_data WHERE email = '$email' AND stud_id <> '$stud_id' ";
    $results = mysqli_query($conn, $_email);

    if (mysqli_num_rows($results) > 0) {
        $result = $response->error("Email already exists");
        return json_encode(['meta' => $result]);
    }

    if ($stud_id > 0) {
        $insertUpdate = "UPDATE student_data SET student_name='$student_name', email='$email', stu_address='$stu_address', district='$district', 
        mobile='$mobile', updated_on = now() WHERE stud_id = $stud_id";
    } else {
        $insertUpdate = "INSERT INTO student_data (student_name, email, stu_address, district, mobile) 
        VALUES ('$student_name', '$email', '$stu_address', '$district', '$mobile')";
    }
    
    if (mysqli_query($conn, $insertUpdate)) {
        $result = $response->success( $stud_id > 0 ? 'Data updated successfully' : 'Data saved successfully');
    }else{
        $result = $response->error("Error occured");
    }
    return json_encode(['meta' => $result]); 
}

function getStudentDetails($stud_id) {
    global $conn, $response;
    $studentDetails = "SELECT stud_id, student_name, email, stu_address, district, mobile FROM student_data WHERE stud_id = $stud_id AND is_deleted = 0";
    $result= mysqli_query($conn, $studentDetails);
    $row = mysqli_fetch_assoc($result);
    if($row){
        $_result = $response->success("Successfully fetch student details",  $row);
    }else{
        $_result = $response->error("Not fetch student details");
    }
    return json_encode(['meta' => $_result]);
}

function getDistricts() {
    global $conn, $response; 
    $districtData = "SELECT district_id AS 'district_id', CONCAT(UCASE(LEFT(district_name, 1)), LCASE(SUBSTRING(district_name, 2))) AS 'district_name' 
    FROM stu_district WHERE is_deleted = 0 ORDER BY district_name ASC";
    $resDistrict = mysqli_query($conn, $districtData);
    
    if ($resDistrict) {
        $result = mysqli_fetch_all($resDistrict, MYSQLI_ASSOC);
        $_result = $response->success("Successfully get district details",  $result);
    } else {
        $_result = $response->error("District details getting error");
    }
    return json_encode(['meta' => $_result]); 
}


function deleteStudent() {
    global $conn, $response;
    $stud_id = $_POST['stud_id'];
    $deleteData = "UPDATE student_data SET is_deleted = 1, updated_on = now() WHERE stud_id = $stud_id";
    if (mysqli_query($conn, $deleteData)) {
        $result = $response->success("Data deleted successfully");
    }else{
        $result = $response->error("Error deleting data");
    }
    return json_encode(['meta' => $result]);
}
?>