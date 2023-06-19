function addParticipant() {
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
    let xhr = $.post("ManageParticipantServlet", data, (responseText) => {
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

function updateParticipant() {

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
    let xhr = $.post("ManageParticipantServlet", data, (responseText) => {
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

function removeParticipant() {

    var data = {
        r_id: $("#r_id").val(),
        r_name: $("#r_name").val(),
        r_mobile: $("#r_mobile").val(),
        r_email: $("#r_email").val(),
        request: "Remove"
    };
    $.post("ManageParticipantServlet", data, (responseText) => {
        if (responseText.trim() === 'success') {
            Swal.fire(
                'Success !!!',
                'Participant Removed Successfully !!!',
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
            url: 'ManageParticipantServlet',
            type: "POST",
            data: {
                r_id: $("#r_id").val(),
                request: 'getRecord',
                type: 'remove'
            },
            dataType: "json",
            success: function(data) {
                if (data.pt_result === 'Not Found') {
                    Swal.fire(
                        'Record Not Found !!!',
                        'Try Again !!!',
                        'error'
                    );
                    setTimeout(reload1, 2000);
                } else {
                    document.getElementById("r_id").value = data.pt_id;
                    document.getElementById("r_name").value = data.pt_name;
                    document.getElementById("r_mobile").value = data.pt_mobile;
                    document.getElementById("r_email").value = data.pt_mail;
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
            url: 'ManageParticipantServlet',
            type: "POST",
            data: {
                u_id: $("#u_id").val(),
                request: 'getRecord',
                type: 'update'
            },
            dataType: "json",
            success: function(data) {
                if (data.pt_result === 'Not Found') {
                    Swal.fire(
                        'Record Not Found !!!',
                        'Try Again !!!',
                        'error'
                    );
                    setTimeout(reload1, 2000);
                } else {
                    document.getElementById("u_id").value = data.pt_id;
                    document.getElementById("u_name").value = data.pt_name;
                    document.getElementById("u_mobile").value = data.pt_mobile;
                    document.getElementById("u_email").value = data.pt_mail;
                    document.getElementById("u_branch").value = data.pt_branch;
                    document.getElementById("u_semester").value = data.pt_sem;
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

function getAllParticipants() {
    $('#myTable tbody').empty();
    $.ajax({
        url: 'ManageParticipantServlet',
        type: "POST",
        data: {
            request: 'GetAllParticipant'
        },
        dataType: "json",
        success: function(data) {
            if (data.Result === 'Empty') {
                Swal.fire(
                    'No Participant Found !!!',
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


function showAlert(message) {
    alert(message);
}

function showAddParticipant() {

    let element1 = document.getElementById("RemoveParticipant");
    let element2 = document.getElementById("UpdateParticipant");
    let element3 = document.getElementById("ViewAllParticipant");
    let element4 = document.getElementById("AddParticipant");
    element1.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element2.setAttribute("hidden", "hidden");
    element4.removeAttribute("hidden");
}

function showRemoveParticipant() {

    let element1 = document.getElementById("RemoveParticipant");
    let element2 = document.getElementById("UpdateParticipant");
    let element3 = document.getElementById("ViewAllParticipant");
    let element4 = document.getElementById("AddParticipant");
    element2.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element4.setAttribute("hidden", "hidden");
    element1.removeAttribute("hidden");
}

function showViewAllParticipant() {

    getAllParticipants();
    let element1 = document.getElementById("RemoveParticipant");
    let element2 = document.getElementById("UpdateParticipant");
    let element3 = document.getElementById("ViewAllParticipant");
    let element4 = document.getElementById("AddParticipant");
    element2.setAttribute("hidden", "hidden");
    element1.setAttribute("hidden", "hidden");
    element4.setAttribute("hidden", "hidden");
    element3.removeAttribute("hidden");

}

function showUpdateParticipant() {

    let element1 = document.getElementById("RemoveParticipant");
    let element2 = document.getElementById("UpdateParticipant");
    let element3 = document.getElementById("ViewAllParticipant");
    let element4 = document.getElementById("AddParticipant");
    element1.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element4.setAttribute("hidden", "hidden");
    element2.removeAttribute("hidden");
}