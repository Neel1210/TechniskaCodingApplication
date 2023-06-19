function showInstructionOption() {
  let element = document.getElementById("ViewAllActiveContest");
  let element2 = document.getElementById("ViewInstructions");
  element.setAttribute("hidden", "hidden");
  element2.removeAttribute("hidden");
}

function viewTable(){
  let element = document.getElementById("ViewAllActiveContest");
  let element2 = document.getElementById("ViewInstructions");
  element2.setAttribute("hidden", "hidden");
  element.removeAttribute("hidden");
}

function getAllActiveContest() {
  let ptId = document.getElementById("Pt_Id").textContent;
  $("#myTable_ActiveContest tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllActiveContestForPt",
      pt_id: ptId,
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            "<td><a onclick=\"alert('"+ item.ID +"','"+document.getElementById("Pt_Id").textContent+"','"+item.Status+"','"+item.Levels+"')\">" +
            item.ID +
            "</a></td>" +
            "<td>" +
            item.Levels +
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

function getAllActiveContest1() {
  $("#myTable_ActiveContest tbody").empty();
  $.ajax({
    url: "ManageContestServlet",
    type: "POST",
    data: {
      request: "GetAllContestForPt",
      pt_id: document.getElementById("Pt_Id").textContent,
    },
    dataType: "json",
    success: function (data) {
      if (data.Result === "Empty") {
        Swal.fire("No Contest Found !!!", "Empty !!!", "success");
      } else {
        $.each(data, function (index, item) {
          var row =
            "<tr>" +
            "<td><a onclick=\"goToQuestion('" +
            item.ID +
            "','" +
            item.Status +
            "')\">" +
            item.ID +
            "</a></td>" +
            "<td>" +
            item.Levels +
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

function goToQuestion(Status) {
  if (Status === "On_Progress") {
    Swal.fire("Contest No Started Yet !!!", "Warning !!!", "error");
    return;
  } else if (Status === "Level_1_Is_On_Progress") {
  } else {
  }
}

function getSessionId() {
  var currentUrl = window.location.href;

  // Find the index of the session ID parameter
  var sessionIdIndex = currentUrl.indexOf("jsessionid=");

  if (sessionIdIndex !== -1) {
    // Extract the session ID value
    var sessionId = currentUrl.substring(sessionIdIndex + 11);

    // Check if there are additional parameters
    var ampersandIndex = sessionId.indexOf("&");
    if (ampersandIndex !== -1) {
      sessionId = sessionId.substring(0, ampersandIndex);
    }
    return sessionId;
  } else {
    console.log("Session ID not found in the URL.");
  }
}

// function sessionId(id) {
//   // Get the full URL
//   var currentUrl = window.location.href;

//   // Find the index of the session ID parameter
//   var sessionIdIndex = currentUrl.indexOf("jsessionid=");

//     if(sessionIdIndex !== -1) {
//     // Extract the session ID value
//     var sessionId = currentUrl.substring(sessionIdIndex + 11);

//     // Check if there are additional parameters
//     var ampersandIndex = sessionId.indexOf("&");
//     if (ampersandIndex !== -1) {
//       sessionId = sessionId.substring(0, ampersandIndex);
//     }
//     //alert("CrManageQuestionsOptions.jsp;jsessionid="+sessionId+"?Contest_Id="+id);
//     window.location.href = "CrManageQuestionsOptions.jsp;jsessionid="+sessionId+"?Contest_Id="+id;
//   } else {
//     console.log("Session ID not found in the URL.");
//   }
// }

function checkForContest(cId,pId,status,level) 
{
  // let pId = document.getElementById("Pt_Id").textContent;
  // let cId = queryParams.get("Contest_Id");
  
  var data = {
    cId: cId,
    pId: pId,
    status: status,
    level: level,
    request: "CheckForNextLevel",
  };

  $.post("ManageResultServlet", data, (responseText) => {
    // alert(responseText);
    if (responseText.trim() === "success") 
    {
      Swal.fire("Error !!!", "Done !!!", "error");
      return;
    } 
    else 
    {
      Swal.fire("Error !!!", "Un Done !!!", "error");
      return;
    }
  });
}
