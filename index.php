<?php include './config/db.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STUDENT INFORMATION</title>
    <?php include 'common/header.php'; ?>
</head>
<body>
    <div class="scroll">
        <div class="row">
            <div class="col-sm-4">
                <div class="card-header">
                    <h5 class="text-center font-weight-bold mb-0">ADMISSION FORM</h5>
                </div>
               <div class="card p-2">
                <form action="" method="post" id="studentForm" autocomplete="off">
                    <input type="hidden" name="stud_id" id="stud_id" value="-1">
                    <div class="form-group">
                        <label class = "font-weight-bold"> STUDENT NAME</label>
                        <input type="text" name="student_name" id="student_name" class="form-control" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode
                        < 123) || (event.charCode == 32)">
                    </div>
                    <div class="form-group">
                        <label class = "font-weight-bold"> EMAIL </label>
                        <input type="text" name="email" id="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class = "font-weight-bold"> ADDRESS </label>
                        <textarea  name="stu_address" id="stu_address" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label class = "font-weight-bold"> DISTRICT </label>
                        <select name="district" id="district" class="form-control select2">
                        <option selected="true" disabled="disabled"></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class = "font-weight-bold"> MOBILE </label>
                        <input type="text" name="mobile" id="mobile" minlength="10" maxlength="10" class="form-control">
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-sm btn-danger font-weight-bold" id="resetRecords"> CLEAR </button>
                        <button type="button" class="btn btn-sm btn-primary font-weight-bold" id="addRecords" onclick="saveStudent()"> SAVE </button>
                    </div>
                </form>
               </div>
            </div>
            <div class="col-sm-8">
                <div class="card-header">
                    <h5 class="text-center font-weight-bold mb-0">STUDENT LIST</h5>
                </div>
                <br>
                <div class="container-fluid">
                        <table id="tbl_student" class="table table-bordered">
                            <thead>
                                <tr class="thead">
                                    <th class="text-center">#</th>
                                    <th>STUDENT NAME</th>
                                    <th>EMAIL</th>
                                    <th>ADDRESS</th>
                                    <th>DISTRICT</th>
                                    <th class="text-center">MOBILE</th>
                                    <th class="text-center">ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>
    <?php include 'common/footer.php'; ?>
</body>
</html>