$(document).ready(function () {
    //select2
    $('.select2').select2();

    getDistricts();

    // Viewdata - datatable
    function viewStudents() {
        $.ajax({
            type: 'POST',
            url: 'ajax.php',
            data: {
                action: "getStudents",
            },
            success: function (response) {
                var res = $.parseJSON(response); {
                    if (res.meta.error === 0) {
                        res.meta.data.forEach(function () {
                            table.clear().rows.add(res.meta.data).draw();
                        });
                    }
                }
            }
        });
    }
    viewStudents();

    var table = $("#tbl_student").DataTable({
        dom: 'frt<"bottom"lip><"clear">',
        columns: [
            {
                render: function (data, type, row, meta) {
                    return '<div class="text-center">' + (meta.row + 1) + "</div>";
                },
            },
            { data: "student_name", className: "text-left" },
            { data: "email", className: "text-left" },
            { data: "stu_address", className: "text-left" },
            { data: "district_name", className: "text-left" },
            { data: "mobile", className: "text-center" },
            {
                data: null,
                render: function (data, type, row) {
                    return (
                        '<button class="btn btn-sm btn-primary" data-id="' + row.stud_id + '" onclick="editStudentForm(' + row.stud_id + ')"><b>EDIT</b></button> &nbsp;' +
                        '<button class="btn btn-sm btn-danger" data-id="' + row.stud_id + '" onclick="confirmDelete(' + row.stud_id + ')"><b>DELETE</b></button>'
                    );
                },
                className: "text-center",
            },
        ],
    });

    // Save & Update
    saveStudent = function () {
        var stud_id = $('#stud_id').val();
        var student_name = $('#student_name').val();
        var email = $('#email').val();
        var stu_address = $('#stu_address').val();
        var district = $('#district').val();
        var mobile = $('#mobile').val();

        $.ajax({
            type: 'POST',
            url: 'ajax.php',
            data: {
                action: 'saveStudent',
                stud_id: stud_id,
                student_name: student_name,
                email: email,
                stu_address: stu_address,
                district: district,
                mobile: mobile
            },
            success: function (response) {
                resdata = $.parseJSON(response);
                if (resdata.meta.error === 0) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text:resdata.meta.msg,
                    }).then((result) => {
                        if (result.isConfirmed) {
                            viewStudents();
                            $('#stud_id').val('-1');
                            $('#studentForm')[0].reset();
                            $('.select2').val(null).trigger('change');
                        }
                        window.location = "index.php";
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: resdata.meta.msg,
                    });
                }
            }
        });
    };

    // Edit form
    editStudentForm = function (stud_id) {
        Swal.fire({
            title: 'Confirmation',
            text: 'Are you sure you want to edit this student?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, edit it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'POST',
                    url: 'ajax.php',
                    data: {
                        action: 'getStudentDetails',
                        stud_id: stud_id
                    },
                    success: function (response) {
                        var res = $.parseJSON(response);
                        if (res.meta.error === 0) {
                            $('#stud_id').val(res.meta.data.stud_id);
                            $('#student_name').val(res.meta.data.student_name);
                            $('#email').val(res.meta.data.email);
                            $('#stu_address').val(res.meta.data.stu_address);
                            $('#district').val(res.meta.data.district).trigger('change');
                            $('#mobile').val(res.meta.data.mobile);
                        }
                    },

                });

            }
        });
    }

    // Delete sweet alert
    confirmDelete = function (stud_id) {
        Swal.fire({
            title: 'Confirmation',
            text: 'Are you sure you want to delete this student?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                deleteStudent(stud_id);
            }
        });
    };

    function deleteStudent(stud_id) {
        $.ajax({
            type: 'POST',
            url: 'ajax.php',
            data: { action: 'deleteStudent', stud_id: stud_id },
            success: function (response) {
                resdata = $.parseJSON(response);
                if (resdata.meta.error === 0) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Data Deleted!',
                        text: resdata.meta.msg
                    }).then(() => {
                        $('#studentForm')[0].reset();
                        viewStudents();
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: resdata.meta.msg
                    });
                }
            }
        });
    };
});

function getDistricts() {
    var data = {
        action: "getDistricts",
    };
    $.ajax({
        type: 'POST',
        url: 'ajax.php',
        data: data,
        success: function (response) {
            var res = $.parseJSON(response);
            if (res.meta.error === 0) {
                res.meta.data.forEach(function (district) {
                    $('#district').append('<option value="' + district.district_id + '">' + district.district_name + '</option>');
                });
            }
        }
    });
}

//reset button
$("#resetRecords").on("click", function () {
    $("#studentForm").trigger("reset");
    $('.select2').val(null).trigger('change');
});

//Only number
jQuery('#mobile').keypress(function (event) {
    if (event.which != 8 && isNaN(String.fromCharCode(event.which))) {
        event.preventDefault();
    }
});