function addCoordinator() {
    var pwd = $("#password").val();
    var cnfpwd = $("#cnfPassword").val()
    let result = !(pwd === cnfpwd);
    if (result) {
        Swal.fire(
            'Error !!!',
            'Try Again \nPassword And CNF Password aren\'t same !!!',
            'error'
        );
        return;
    }
    var data = {
        id: $("#id").val(),
        name: $("#name").val(),
        mobile: $("#mobile").val(),
        email: $("#email").val(),
        branch: $("#branch").val(),
        semester: $("#semester").val(),
        password: $("#password").val(),
        request: "Add"
    };
    let xhr = $.post("ManageCoordinatorServlet", data, (responseText) => {
        if (responseText.trim() === 'success') {
            Swal.fire(
                'Success !!!',
                'Record Added Successfully !!!',
                'success'
            );
            setTimeout(reload1, 2500);
            return;
        } else {
            Swal.fire(
                'DB Error !!!',
                'Failed - Try Again !!!',
                'error'
            );
            return;
        }
    });
}

function updateCoordinator() {

    var pwd = $("#u_password").val();
    var cnfpwd = $("#u_cnfPassword").val()
    let result = !(pwd === cnfpwd);
    if (result) {
        Swal.fire(
            'Error !!!',
            'Try Again \nPassword And CNF Password aren\'t same !!!',
            'error'
        );
        return;
    }
    var data = {
        u_id: $("#u_id").val(),
        u_name: $("#u_name").val(),
        u_mobile: $("#u_mobile").val(),
        u_email: $("#u_email").val(),
        u_branch: $("#u_branch").val(),
        u_semester: $("#u_semester").val(),
        u_password: $("#u_password").val(),
        request: "Update"
    };
    let xhr = $.post("ManageCoordinatorServlet", data, (responseText) => {
        if (responseText.trim() === 'success') {
            Swal.fire(
                'Success !!!',
                'Record Updated Successfully !!!',
                'success'
            );
            setTimeout(reload1, 2500);
            return;
        } else {
            Swal.fire(
                'DB Error !!!',
                'Failed - Try Again !!!',
                'error'
            );
            return;
        }
    });
}

function clearText()
{

}

function removeCoordinator() {

    var data = {
        r_id: $("#r_id").val(),
        r_name: $("#r_name").val(),
        r_mobile: $("#r_mobile").val(),
        r_email: $("#r_email").val(),
        request: "Remove"
    };
    $.post("ManageCoordinatorServlet", data, (responseText) => {
        if (responseText.trim() === 'success') {
            Swal.fire(
                'Success !!!',
                'Coordinator Removed Successfully !!!',
                'success'
            );
            setTimeout(reload1, 2500);
            return;
        } else {
            Swal.fire(
                'DB Error !!!',
                'Failed - Try Again !!!',
                'error'
            );
            return;
        }
    });
}

function reload1() {
    location.reload();
}

function getRecord(text) {

    if (text == "remove") {
        $.ajax({
            url: 'ManageCoordinatorServlet',
            type: "POST",
            data: {
                r_id: $("#r_id").val(),
                request: 'getRecord',
                type: 'remove'
            },
            dataType: "json",
            success: function(data) {
                if (data.cr_result === 'Not Found') {
                    Swal.fire(
                        'Record Not Found !!!',
                        'Try Again !!!',
                        'error'
                    );
                    setTimeout(reload1, 2000);
                } else {
                    document.getElementById("r_id").value = data.cr_id;
                    document.getElementById("r_name").value = data.cr_name;
                    document.getElementById("r_mobile").value = data.cr_mobile;
                    document.getElementById("r_email").value = data.cr_mail;
                }
            },
            error: function() {
                Swal.fire(
                    'Record Not Found !!!',
                    'DB Error - Try Again !!!',
                    'error'
                );
            }
        });
    } else {
        $.ajax({
            url: 'ManageCoordinatorServlet',
            type: "POST",
            data: {
                u_id: $("#u_id").val(),
                request: 'getRecord',
                type: 'update'
            },
            dataType: "json",
            success: function(data) {
                if (data.cr_result === 'Not Found') {
                    Swal.fire(
                        'Record Not Found !!!',
                        'Try Again !!!',
                        'error'
                    );
                    setTimeout(reload1, 2000);
                } else {
                    document.getElementById("u_id").value = data.cr_id;
                    document.getElementById("u_name").value = data.cr_name;
                    document.getElementById("u_mobile").value = data.cr_mobile;
                    document.getElementById("u_email").value = data.cr_mail;
                    document.getElementById("u_branch").value = data.cr_branch;
                    document.getElementById("u_semester").value = data.cr_sem;
                }

            },
            error: function(error) {
                Swal.fire(
                    'Record Not Found !!!',
                    'DB Error - Try Again !!!',
                    'error'
                );
            }
        });
    }
}

function getAllCoordinators() {
    $('#myTable tbody').empty();
    $.ajax({
        url: 'ManageCoordinatorServlet',
        type: "POST",
        data: {
            request: 'GetAllCoordinator'
        },
        dataType: "json",
        success: function(data) {
            if (data.Result === 'Empty') {
                Swal.fire(
                    'No Coordinator Found !!!',
                    'Empty !!!',
                    'success'
                );
            } else {

                $.each(data, function(index, item) {
                    var row = "<tr>" +
                        "<td>" + item.ID + "</td>" +
                        "<td>" + item.Name + "</td>" +
                        "<td>" + item.Email + "</td>" +
                        "<td>" + item.Mobile + "</td>" +
                        "<td>" + item.Semester + "</td>" +
                        "<td>" + item.Branch + "</td>" +
                        "</tr>";
                    $("#myTable tbody").append(row);
                });
            }
        },
        error: function() {
            Swal.fire(
                'Record Not Found !!!',
                'DB Error - Try Again !!!',
                'error'
            );
        }
    });
}

function showAddCoordinator() {

    let element1 = document.getElementById("RemoveCoordinator");
    let element2 = document.getElementById("UpdateCoordinator");
    let element3 = document.getElementById("ViewAllCoordinator");
    let element4 = document.getElementById("AddCoordinator");
    element1.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element2.setAttribute("hidden", "hidden");
    element4.removeAttribute("hidden");
}

function showRemoveCoordinator() {

    let element1 = document.getElementById("RemoveCoordinator");
    let element2 = document.getElementById("UpdateCoordinator");
    let element3 = document.getElementById("ViewAllCoordinator");
    let element4 = document.getElementById("AddCoordinator");
    element2.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element4.setAttribute("hidden", "hidden");
    element1.removeAttribute("hidden");
}

function showViewAllCoordinator() {

    getAllCoordinators();
    let element1 = document.getElementById("RemoveCoordinator");
    let element2 = document.getElementById("UpdateCoordinator");
    let element3 = document.getElementById("ViewAllCoordinator");
    let element4 = document.getElementById("AddCoordinator");
    element2.setAttribute("hidden", "hidden");
    element1.setAttribute("hidden", "hidden");
    element4.setAttribute("hidden", "hidden");
    element3.removeAttribute("hidden");

}

function showUpdateCoordinator() {

    let element1 = document.getElementById("RemoveCoordinator");
    let element2 = document.getElementById("UpdateCoordinator");
    let element3 = document.getElementById("ViewAllCoordinator");
    let element4 = document.getElementById("AddCoordinator");
    element1.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element4.setAttribute("hidden", "hidden");
    element2.removeAttribute("hidden");
}