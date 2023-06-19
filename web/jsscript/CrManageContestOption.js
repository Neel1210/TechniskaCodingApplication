function registerParticipantInContest() {
  var data = {
    p_id: $("#regLbl").val(),
    c_id: document.getElementById('reg_Id').textContent,
    request: "registerParticipantInContest",
  };
  $.post("ManageContestServlet", data, (responseText) => {
    if (responseText.trim() === "success") {
      Swal.fire(
        "Success !!!",
        "Participant Registered Successfully\nIn '"+document.getElementById('reg_Id').textContent+"' Contest!!!",
        "success"
      );
      setTimeout(reload1, 2500);
      return;
    } 
    else if(responseText.trim() === "Record Already Present") {
      Swal.fire("Warning !!!", "Participant Already registered !!!", "error");
      return;
    }
    else {
      Swal.fire("DB Error !!!", "Failed - Try Again !!!", "error");
      return;
    }
  });
}

function StartContest()
{
  var data = {
    contestId: document.getElementById('contestid').textContent,
    status: document.getElementById('statusLbl').textContent,
    level: document.getElementById('levelLbl').textContent,
    request: "startContest",
  };
  $.post("ManageContestServlet", data, (responseText) => {
    if (responseText.trim() === "success") {
      Swal.fire(
        "Success !!!",
        "Contest Started for next level!!!",
        "success"
      );
      setTimeout(reload1, 2500);
      return;
    } 
    else if(responseText.trim() === "No More Levels !!!") {
      Swal.fire("Warning !!!", "Already in the last level !!!", "success");
      return;
    }
    else {
      Swal.fire("DB Error !!!", "Failed - Try Again !!!", "error");
      return;
    }
  });
}

function removeParticipantFromContest() {
  var data = {
    p_id: $("#remLbl").val(),
    c_id: document.getElementById('rem_Id').textContent,
    request: "removeParticipantFromContest",
  };
  $.post("ManageContestServlet", data, (responseText) => {
    if (responseText.trim() === "success") {
      Swal.fire(
        "Success !!!",
        "Participant Removed Successfully\nFrom '"+document.getElementById('rem_Id').textContent+"' Contest!!!",
        "success"
      );
      setTimeout(reload1, 2500);
      return;
    } 
    else if(responseText.trim() === "Record Already Deleted") {
      Swal.fire("Warning !!!", "Participant Already Removed !!!\n or not registred in Contest ", "error");
      return;
    }
    else {
      Swal.fire("DB Error !!!", "Failed - Try Again !!!", "error");
      return;
    }
  });
}

function getAllActiveContests() {
  $("#myTable_ActiveContest tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllActiveContestForCr",
      cr_id: document.getElementById('Cr_Id').textContent
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            "<td> <a onclick=\"showRegisterParticipantInContest('" +
            item.ID +
            "')\">" +
            item.ID +
            "</a></td>" +
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

function getAllActiveContests1() {
  $("#myTable_ActiveContest tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllActiveContestForCr",
      cr_id: document.getElementById('Cr_Id').textContent
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            "<td> <a onclick=\"showRemoveParticipantFromContest('" +
            item.ID +
            "')\">" +
            item.ID +
            "</a></td>" +
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

function getAllActiveContest2() {
  $("#myTable_ActiveContest tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllActiveContestForCr",
      cr_id: document.getElementById('Cr_Id').textContent
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            "<td> <a onclick=\"showStartContest('" +
            item.ID +
            "','"+item.Levels+"','"+item.Status+"')\">" +
            item.ID +
            "</a></td>" +
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

function getAllContests() {
  $("#myTable tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllContestForCr",
      cr_id: document.getElementById('Cr_Id').textContent
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

function reload1() {
  location.reload();
}

function clear() {
  document.getElementById("regLbl").value = "";
  document.getElementById("regName").value = "";
  document.getElementById("regMobile").value = "";
  document.getElementById("regEmail").value = "";
  document.getElementById("remLbl").value = "";
  document.getElementById("remName").value = "";
  document.getElementById("remMobile").value ="";
  document.getElementById("remEmail").value = "";
}

function getRecord(id, type) {
  if (type === "Reg") {
    $.ajax({
      url: "ManageParticipantServlet",
      type: "POST",
      data: {
        r_id: id,
        request: "getRecord",
        type: "remove",
      },
      dataType: "json",
      success: function (data) {
        if (data.pt_result === "Not Found") {
          Swal.fire("Record Not Found !!!", "Try Again !!!", "error");
        } else {
          document.getElementById("regLbl").value = data.pt_id;
          document.getElementById("regName").value = data.pt_name;
          document.getElementById("regMobile").value = data.pt_mobile;
          document.getElementById("regEmail").value = data.pt_mail;
        }
      },
      error: function () {
        Swal.fire("Record Not Found !!!", "DB Error - Try Again !!!", "error");
      },
    });
  } else {
    $.ajax({
      url: "ManageParticipantServlet",
      type: "POST",
      data: {
        r_id: id,
        request: "getRecord",
        type: "remove",
      },
      dataType: "json",
      success: function (data) {
        if (data.pt_result === "Not Found") {
          Swal.fire("Record Not Found !!!", "Try Again !!!", "error");
        } else {
          document.getElementById("remLbl").value = data.pt_id;
          document.getElementById("remName").value = data.pt_name;
          document.getElementById("remMobile").value = data.pt_mobile;
          document.getElementById("remEmail").value = data.pt_mail;
        }
      },
      error: function () {
        Swal.fire("Record Not Found !!!", "DB Error - Try Again !!!", "error");
      },
    });
  }
}

function showRegisterParticipantInContest(contestId) {
  document.getElementById("regLabel1").innerHTML =
    "In :- <strong>'<label id='reg_Id'>" + contestId + "</label>'</strong>";
  let element1 = document.getElementById("RegisterParticipantInContest");
  let element2 = document.getElementById("RemoveParticipantFromContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  let element5 = document.getElementById("AllRegisteredParticipantsInContest");
  let element6 = document.getElementById("StartContest");
  element2.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element5.setAttribute("hidden", "hidden");
  element6.setAttribute("hidden", "hidden");
  element1.removeAttribute("hidden");
}

function showRemoveParticipantFromContest(contestId) {
  document.getElementById("remLabel1").innerHTML =
  "From :- <strong>'<label id='rem_Id'>" + contestId + "</label>'</strong>";
  let element1 = document.getElementById("RegisterParticipantInContest");
  let element2 = document.getElementById("RemoveParticipantFromContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  let element5 = document.getElementById("AllRegisteredParticipantsInContest");
  let element6 = document.getElementById("StartContest");
  element1.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element5.setAttribute("hidden", "hidden");
  element6.setAttribute("hidden", "hidden");
  element2.removeAttribute("hidden");
}

function showViewAllContest() {
  getAllContests();
  let element1 = document.getElementById("RegisterParticipantInContest");
  let element2 = document.getElementById("RemoveParticipantFromContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  let element5 = document.getElementById("AllRegisteredParticipantsInContest");
  let element6 = document.getElementById("StartContest");
  element1.setAttribute("hidden", "hidden");
  element2.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element5.setAttribute("hidden", "hidden");
  element6.setAttribute("hidden", "hidden");
  element3.removeAttribute("hidden");
}

function showViewAllActiveContest() {
  let element1 = document.getElementById("RegisterParticipantInContest");
  let element2 = document.getElementById("RemoveParticipantFromContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  let element5 = document.getElementById("AllRegisteredParticipantsInContest");
  let element6 = document.getElementById("StartContest");
  element1.setAttribute("hidden", "hidden");
  element2.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element5.setAttribute("hidden", "hidden");
  element6.setAttribute("hidden", "hidden");
  element4.removeAttribute("hidden");
}

function showAllRegisteredParticipantsInContest(contestId) {
  let element1 = document.getElementById("RegisterParticipantInContest");
  let element2 = document.getElementById("RemoveParticipantFromContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  let element5 = document.getElementById("AllRegisteredParticipantsInContest");
  let element6 = document.getElementById("StartContest");
  element1.setAttribute("hidden", "hidden");
  element2.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element6.setAttribute("hidden", "hidden");
  element5.removeAttribute("hidden");
}


function showStartContest(contestId,level,status) {
  document.getElementById("startContestLbl").innerHTML =
    "In :- <strong>'<label id='contestid'>" + contestId + "</label>'</strong>";
  document.getElementById('levelLbl').innerHTML=level;
  document.getElementById('statusLbl').innerHTML=status;
  let element1 = document.getElementById("RegisterParticipantInContest");
  let element2 = document.getElementById("RemoveParticipantFromContest");
  let element3 = document.getElementById("ViewAllContest");
  let element4 = document.getElementById("ViewAllActiveContest");
  let element5 = document.getElementById("AllRegisteredParticipantsInContest");
  let element6 = document.getElementById("StartContest");
  element1.setAttribute("hidden", "hidden");
  element2.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element4.setAttribute("hidden", "hidden");
  element5.setAttribute("hidden", "hidden");
  element6.removeAttribute("hidden");
}
