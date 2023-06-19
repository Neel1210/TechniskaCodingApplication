function addCotest() {
  var level = $("#level").val();
  if (level === "") {
    Swal.fire("Try Again!!!", "Level should be greater than 0 !!!", "error");
    return;
  }
  level = Number(level);
  if (level < 1) {
    Swal.fire("Try Again!!!", "Level should be greater than 0 !!!", "success");
    return;
  } else {
    var data = {
      id: $("#id").val(),
      level: $("#level").val(),
      request: "Add",
    };
    let xhr = $.post("ManageContestServlet", data, (responseText) => {
      if (responseText.trim() === "success") {
        Swal.fire("Success !!!", "Record Added Successfully !!!", "success");
        setTimeout(reload1, 2500);
        return;
      } else {
        Swal.fire("DB Error !!!", "Failed - Try Again !!!", "error");
        return;
      }
    });
  }
}

function registerCoordinatorInContest() {
  var data = {
    cr_id: $("#u_id").val(),
    c_id: document.getElementById('reg_Id').textContent,
    request: "registerCoordinatorInContest",
  };
  $.post("ManageContestServlet", data, (responseText) => {
    if (responseText.trim() === "success") {
      Swal.fire(
        "Success !!!",
        "Coordinator Registered Successfully\nIn '"+document.getElementById('reg_Id').textContent+"' Contest!!!",
        "success"
      );
      setTimeout(reload1, 2500);
      return;
    } 
    else if(responseText.trim() === "Record Already Present") {
      Swal.fire("Warning !!!", "Coordinator Already registered !!!", "error");
      return;
    }
    else {
      Swal.fire("DB Error !!!", "Failed - Try Again !!!", "error");
      return;
    }
  });
}

// function removeCoordinatorFromContest() {
//   alert($("#remLbl").val()+" - "+document.getElementById('rem_Id').textContent);
//   var data = {
//     p_id: $("#remLbl").val(),
//     c_id: document.getElementById('rem_Id').textContent,
//     request: "removeParticipantFromContest",
//   };
//   $.post("ManageContestServlet", data, (responseText) => {
//     if (responseText.trim() === "success") {
//       Swal.fire(
//         "Success !!!",
//         "Coordinator Removed Successfully\nFrom '"+document.getElementById('rem_Id').textContent+"' Contest!!!",
//         "success"
//       );
//       setTimeout(reload1, 2500);
//       return;
//     } 
//     else if(responseText.trim() === "Record Already Deleted") {
//       Swal.fire("Warning !!!", "Coordinator Already Removed !!!\n or not registred in Contest ", "error");
//       return;
//     }
//     else {
//       Swal.fire("DB Error !!!", "Failed - Try Again !!!", "error");
//       return;
//     }
//   });
// }

function reload1() {
  location.reload();
}

function clear() {
  document.getElementById("r_id").value = "";
  document.getElementById("r_name").value = "";
  document.getElementById("r_mobile").value = "";
  document.getElementById("r_email").value = "";
}

function getRecord(text) {
  if (text == "remove") {
    $.ajax({
      url: "ManageCoordinatorServlet",
      type: "POST",
      data: {
        r_id: $("#r_id").val(),
        request: "getRecord",
        type: "remove",
      },
      dataType: "json",
      success: function (data) {
        if (data.cr_result === "Not Found") {
          Swal.fire("Record Not Found !!!", "Try Again !!!", "error");
        } else {
          document.getElementById("r_id").value = data.cr_id;
          document.getElementById("r_name").value = data.cr_name;
          document.getElementById("r_mobile").value = data.cr_mobile;
          document.getElementById("r_email").value = data.cr_mail;
        }
      },
      error: function () {
        Swal.fire("Record Not Found !!!", "DB Error - Try Again !!!", "error");
      },
    });
  } else {
    $.ajax({
      url: "ManageCoordinatorServlet",
      type: "POST",
      data: {
        u_id: $("#u_id").val(),
        request: "getRecord",
        type: "update",
      },
      dataType: "json",
      success: function (data) {
        if (data.cr_result === "Not Found") {
          Swal.fire("Record Not Found !!!", "Try Again !!!", "error");
        } else {
          document.getElementById("u_id").value = data.cr_id;
          document.getElementById("u_name").value = data.cr_name;
          document.getElementById("u_mobile").value = data.cr_mobile;
          document.getElementById("u_email").value = data.cr_mail;
          document.getElementById("u_branch").value = data.cr_branch;
          document.getElementById("u_semester").value = data.cr_sem;
        }
      },
      error: function (error) {
        Swal.fire("Record Not Found !!!", "DB Error - Try Again !!!", "error");
      },
    });
  }
}



function getAllContests() {
  $("#myTable tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllContest",
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            "<td>" +
            item.ID +
            "</td>" +
            "<td>" +
            item.Levels +
            "</td>" +
            "<td>" +
            item.No_of_participants +
            "</td>" +
            "<td>" +
            item.Winner +
            "</td>" +
            "<td>" +
            item.Status +
            "</td>" +
            "</tr>";
          $("#myTable tbody").append(row);
        });
      }
    },
    error: function () {
      Swal.fire("Record Not Found !!!", "DB Error - Try Again !!!", "error");
    },
  });
}

function getAllActiveContests() {
  $("#myTable_ActiveContest tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllActiveContest",
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            "<td> <a onclick=\"showRegisterCoordinatorsInContest('" +
            item.ID +
            "')\">" +
            item.ID +
            "</a></td >" +
            "<td>" +
            item.Levels +
            "</td>" +
            "<td>" +
            item.No_of_participants +
            "</td>" +
            "<td>" +
            item.Winner +
            "</td>" +
            "<td>" +
            item.Status +
            "</td>" +
            "</tr>";
          $("#myTable_ActiveContest tbody").append(row);
        });
      }
    },
    error: function () {
      Swal.fire("Record Not Found !!!", "DB Error - Try Again !!!", "error");
    },
  });
}

function showAlert(message) {
  alert(message);
}

function showAddNewContest() {
  let element1 = document.getElementById("AddContest");
  let element2 = document.getElementById("RegisterCoordinatorInContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  element2.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element1.removeAttribute("hidden");
}

function showRegisterCoordinatorsInContest(id) {
  document.getElementById("Label1").innerHTML =
  "In :- <strong>'<label id='reg_Id'>" + id + "</label>'</strong>";
  let element1 = document.getElementById("AddContest");
  let element2 = document.getElementById("RegisterCoordinatorInContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  element1.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element2.removeAttribute("hidden");
}

function showViewAllContest() {
  getAllContests();
  let element1 = document.getElementById("AddContest");
  let element2 = document.getElementById("RegisterCoordinatorInContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  element1.setAttribute("hidden", "hidden");
  element2.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element3.removeAttribute("hidden");
}

function showViewAllActiveContest() {
  getAllActiveContests();
  let element1 = document.getElementById("AddContest");
  let element2 = document.getElementById("RegisterCoordinatorInContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  element1.setAttribute("hidden", "hidden");
  element2.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element4.removeAttribute("hidden");
}

function LoadIdInInput() {
  var tags = new Tags(".tagged");
  document.getElementById("add").addEventListener("click", function (e) {
    e.preventDefault();
    tags.addTags($("#u_id").val());
  });
}
