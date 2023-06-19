function showViewQuestionOption() {
  let element = document.getElementById("QuestionDiv");
  let element2 = document.getElementById("TestCaseDiv");
  element2.setAttribute("hidden", "hidden");
  element.removeAttribute("hidden");
}

function showViewTestCaseOption() {
    let element = document.getElementById("QuestionDiv");
    let element2 = document.getElementById("TestCaseDiv");
    element.setAttribute("hidden", "hidden");
    element2.removeAttribute("hidden");
}

function getQuestion(qid,editor,editor1) {
  $.ajax({
      url: 'ManageQuestionServlet',
      type: "POST",
      data: {
          Question_Id:qid,
          request: 'GetQuestionByQId'
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
          
                
                // $('#question_Title').val(data.Question_Id);
                document.getElementById('qLbl').innerHTML=data.qTitle;
                document.getElementById('qT1').placeholder="Question Id - "+data.Question_Id;
                document.getElementById('qT2').placeholder="Question Id - "+data.Question_Id;
                // $('#qLbl').val(data.qTitle);
              editor.setValue(data.Question);
              editor1.setValue(data.Test_Cases);
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
