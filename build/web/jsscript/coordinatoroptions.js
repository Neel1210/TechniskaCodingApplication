// function showCoordinatorOption() {
//     let element = document.getElementById("manageCoordinatorOption");
//     let element2 = document.getElementById("manageParticipantsOption");
//     let element3 = document.getElementById("manageQuizOption");
//     element2.setAttribute("hidden", "hidden");
//     element3.setAttribute("hidden", "hidden");
//     element.removeAttribute("hidden");
// }

function showParticipnatsOption() {
  let element = document.getElementById("ViewAllActiveContest");
  let element2 = document.getElementById("manageParticipantsOption");
  let element3 = document.getElementById("manageContestOption");
  element.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element2.removeAttribute("hidden");
}

function showQuestionsOption() {
  getAllActiveContests();
  let element = document.getElementById("ViewAllActiveContest");
  let element2 = document.getElementById("manageParticipantsOption");
  let element3 = document.getElementById("manageContestOption");
  element2.setAttribute("hidden", "hidden");
  element3.setAttribute("hidden", "hidden");
  element.removeAttribute("hidden");
}

function showContestOption() {
  let element = document.getElementById("ViewAllActiveContest");
  let element2 = document.getElementById("manageParticipantsOption");
  let element3 = document.getElementById("manageContestOption");
  element.setAttribute("hidden", "hidden");
  element2.setAttribute("hidden", "hidden");
  element3.removeAttribute("hidden");
}

function getAllActiveContests() {
  $("#myTable_ActiveContest tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllActiveContestForCr",
      cr_id: document.getElementById("Cr_Id").textContent,
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            // '<td> <a href=\'<% out.print("CrManageQuestionsOptions.jsp;jsessionid="+session.getId()+"?Contest_Id=' +
            '<td> <a onclick="sessionId(\''+ item.ID+'\')">' +
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

function sessionId(id) {
  // Get the full URL
  var currentUrl = window.location.href;

  // Find the index of the session ID parameter
  var sessionIdIndex = currentUrl.indexOf("jsessionid=");

    if(sessionIdIndex !== -1) {
    // Extract the session ID value
    var sessionId = currentUrl.substring(sessionIdIndex + 11);

    // Check if there are additional parameters
    var ampersandIndex = sessionId.indexOf("&");
    if (ampersandIndex !== -1) {
      sessionId = sessionId.substring(0, ampersandIndex);
    }

    //alert("CrManageQuestionsOptions.jsp;jsessionid="+sessionId+"?Contest_Id="+id);
    window.location.href = "CrManageQuestionsOptions.jsp;jsessionid="+sessionId+"?Contest_Id="+id;
  } else {
    console.log("Session ID not found in the URL.");
  }
}
