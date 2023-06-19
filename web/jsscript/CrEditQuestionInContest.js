function showEditQuestionOption() {
  let element = document.getElementById("QuestionDiv");
  let element2 = document.getElementById("TestCaseDiv");
  element2.setAttribute("hidden", "hidden");
  element.removeAttribute("hidden");
}

function showEditTestCaseOption() {
    if($('#question_Title').val()==='')
    {
      document.getElementById('testCaseQuestion').placeholder='Question Title';
    }
    else
    {
      document.getElementById('testCaseQuestion').placeholder=$('#question_Title').val();
    }
    let element = document.getElementById("QuestionDiv");
    let element2 = document.getElementById("TestCaseDiv");
    element.setAttribute("hidden", "hidden");
    element2.removeAttribute("hidden");
}

function submitQuestion(editor,editor1) 
{
  let question=editor.getValue().trim();
  let testCase=editor1.getValue().trim();
  let qTitle=$('#question_Title').val().trim();

  const queryParams = new URLSearchParams(window.location.search);
  let cid = queryParams.get("Contest_Id");
  let qid = queryParams.get("Question_Id");

  if (question==='' || testCase==='' || qTitle==='') 
  {
      Swal.fire(
          'Error !!!',
          'Make Sure All The Fields are filled !!!',
          'error'
      );
      return;
  }
  var data = {
      questionId:qid,
      contestId:cid,
      question: question,
      testCase: testCase,
      qTitle:qTitle,
      request: "Edit"
  };
  alert("Inside funtion");
  let xhr = $.post("ManageQuestionServlet", data, (responseText) => {
      if (responseText.trim() === 'success') {
          Swal.fire(
              'Success !!!',
              'Record Edited Successfully !!!',
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

function reload1()
{
  var backBtn = document.getElementById('backBtn');
  window.location.href = backBtn.getAttribute('href');
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
              $('#question_Title').val(data.qTitle);
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
