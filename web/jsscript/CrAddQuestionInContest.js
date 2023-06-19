function showAddQuestionOption() {
  let element = document.getElementById("QuestionDiv");
  let element2 = document.getElementById("TestCaseDiv");
  element2.setAttribute("hidden", "hidden");
  element.removeAttribute("hidden");
}

function showAddTestCaseOption() {
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

function submit()
{
    document.getElementById('ace-editorid1').textContent
    alert(document.getElementById('ace-editorid').textContent);
    alert($("#ace-editorid").val());

    const queryParams = new URLSearchParams(window.location.search);
    let id = queryParams.get("Contest_Id");
    let qid = queryParams.get("Question_Id");
    alert("Q id - "+qid+" ,C Id - "+id);
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
      request: "Add"
  };
  alert("Inside funtion");
  let xhr = $.post("ManageQuestionServlet", data, (responseText) => {
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

function goToSetQuestion()
{
  let qid = document.getElementById('qId').textContent;
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
     window.location.href = "CrAddQuestionInContest.jsp;jsessionid="+sessionId+"&Question_Id="+qid;
   } else {
     console.log("Session ID not found in the URL.");
   }
}

function reload1()
{
  var backBtn = document.getElementById('backBtn');
  window.location.href = backBtn.getAttribute('href');
}