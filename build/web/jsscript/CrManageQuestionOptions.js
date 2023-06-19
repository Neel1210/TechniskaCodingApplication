function showAddQuestionOption() {
    getQuestionId();
    let element = document.getElementById("AddQuestion");
    let element2 = document.getElementById("EditQuestion");
    let element3 = document.getElementById("ViewAllQuestion");
    element2.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element.removeAttribute("hidden");
  }

  function showEditQuestionOption() {
    getAllQuestions1();
    let element = document.getElementById("AddQuestion");
    let element2 = document.getElementById("EditQuestion");
    let element3 = document.getElementById("ViewAllQuestion");
    element.setAttribute("hidden", "hidden");
    element3.setAttribute("hidden", "hidden");
    element2.removeAttribute("hidden");
  }

function showViewAllQuestionsOption() {
    getAllQuestions2();
    let element = document.getElementById("AddQuestion");
    let element2 = document.getElementById("EditQuestion");
    let element3 = document.getElementById("ViewAllQuestion");
    element.setAttribute("hidden", "hidden");
    element2.setAttribute("hidden", "hidden");
    element3.removeAttribute("hidden");
  }


function getQuestionId()
{  
    const queryParams = new URLSearchParams(window.location.search);
    let id = queryParams.get("Contest_Id");
    var data = {
        Contest_Id: id,
        request: "CheckQA",
      };
      $.post("ManageQuestionServlet", data, (responseText) => {
        // alert(responseText);
        if (responseText.trim() === "All Question Are Already setted") {
          Swal.fire(
            "Error !!!",
            "All Question Are already setted !!!",
            "error"
          );
          document.getElementById("QuestionIdLbl").setAttribute("hidden", "hidden");
          document.getElementById("setButton").innerHTML='<strong>All Questions are already setted</strong>';
          document.getElementById("setButton").setAttribute("disabled", true);

          return;
        } 
        else 
        {
            document.getElementById("QuestionIdLbl").innerHTML ='Question Id - <label id="qId"><strong>'+responseText+'</strong></label></p>';
        }
      });
}

function goToSetQuestion()
{
  
  window.location.href = "CrAddQuestionInContest.jsp;jsessionid="+getSessionId()+"&Question_Id="+document.getElementById("qId").textContent;   
}

function goToEditQuestion(qid)
{
     window.location.href = "CrEditQuestionInContest.jsp;jsessionid="+getSessionId()+"&Question_Id="+qid;
}

function goToViewQuestion(qid)
{
  window.location.href = "CrViewQuestionInContest.jsp;jsessionid="+getSessionId()+"&Question_Id="+qid;   
}

function getSessionId()
{
  var currentUrl = window.location.href;

  // Find the index of the session ID parameter
  var sessionIdIndex = currentUrl.indexOf("jsessionid=");

   if(sessionIdIndex !== -1) 
   {
    // Extract the session ID value
    var sessionId = currentUrl.substring(sessionIdIndex + 11);

    // Check if there are additional parameters
    var ampersandIndex = sessionId.indexOf("&");
    if (ampersandIndex !== -1) {
      sessionId = sessionId.substring(0, ampersandIndex);
    }
    return sessionId;
   }    
   else 
    {
      console.log("Session ID not found in the URL.");
    }
}



function getAllQuestions1() {

  const queryParams = new URLSearchParams(window.location.search);
  let id = queryParams.get("Contest_Id");

  $('#myTable_EditQuestion tbody').empty();
  $.ajax({
      url: 'ManageQuestionServlet',
      type: "POST",
      data: {
          Contest_Id:id,
          request: 'GetAllQuestions'
      },
      dataType: "json",
      success: function(data) {
          if (data.Result === 'Empty') {
              Swal.fire(
                  'No Questions Found !!!',
                  'Empty !!!',
                  'success'
              );
          } else {

              $.each(data, function(index, item) {
                  var row = "<tr>" +
                      "<td><a onclick='goToEditQuestion(\""+item.Question_Id +"\")'>" + item.Question_Id + "</a></td>" +
                      "<td>" + item.qTitle + "</td>" +
                      "<td>" + item.qLevel + "</td>" +
                      "</tr>";
                  $("#myTable_EditQuestion tbody").append(row);
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

function getAllQuestions2() {

  const queryParams = new URLSearchParams(window.location.search);
  let id = queryParams.get("Contest_Id");

  $('#myTable_ViewAllQuestion tbody').empty();
  $.ajax({
      url: 'ManageQuestionServlet',
      type: "POST",
      data: {
          Contest_Id:id,
          request: 'GetAllQuestions'
      },
      dataType: "json",
      success: function(data) {
          if (data.Result === 'Empty') {
              Swal.fire(
                  'No Questions Found !!!',
                  'Empty !!!',
                  'success'
              );
          } else {

              $.each(data, function(index, item) {
                  var row = "<tr>" +
                      "<td><a onclick='goToViewQuestion(\""+item.Question_Id +"\")'>" + item.Question_Id + "</a></td>" +
                      "<td>" + item.qTitle + "</td>" +
                      "<td>" + item.qLevel + "</td>" +
                      "</tr>";
                  $("#myTable_ViewAllQuestion tbody").append(row);
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