<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Teckniska</title>

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700"
    />
    <link rel="stylesheet" href="styleSheet/login.css" type="text/css" />
    <script type="text/javascript" src="jsscript/login.js"></script>
    <script type="text/javascript" src="jsscript/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- <script src="jsscript/TextEditor.js"></script> -->
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
      type="text/javascript"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/theme-tomorrow.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/mode-scss.js"></script>
    <link rel="stylesheet" href="styleSheet/TextEditor.css" type="text/css" />

    <script
    type="text/javascript"
    src="jsscript/CrViewQuestionInContest.js"
  ></script>

    <link rel="icon" href="images/Fav_icon.png" sizes="32x32" />
    <link rel="icon" href="images/logo.png" sizes="192x192" />
    <link
      rel="apple-touch-icon"
      href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png"
    />

  </head>

  <body onload="myfunction()">
    <div class="container" style="overflow: hidden">
      <div class="column-wrap">
        <div class="column-left">
          <div class="inner">
            <img src="images/mainLogo.png" />

            <h1>Welcome Coordinator</h1>
            <% System.out.println("Inside manageCoordinator Option JSP"); String
            userid=(String)session.getAttribute("name"); if(userid==null) {
            response.sendRedirect("accessdenied.jspl"); return; } %>
            <p class="create"><% out.println(userid); %></p>

            <button
              type="button"
              class="g-recaptcha"
              onclick="showViewQuestionOption()"
            >
              Question</button
            ><br/>
            <button
              type="button"
              class="g-recaptcha"
              onclick="showViewTestCaseOption()"
            >
              Test Cases</button
            ><br/>

            <p class="forgot">
              <a id="backBtn"
                href='<% out.print("CrManageQuestionsOptions.jsp;jsessionid="+session.getId()+"?Contest_Id="+request.getParameter("Contest_Id"));%>'
              >
                Back
              </a>
            </p>

            
            <p class="footer">
                <% out.println("© " + (new Date().getYear() + 1900) + " NeeL And Compnay, LLC.");%>
            </p>
          </div>
        </div>

        <div
          class="column-right"
          style="background-image: url('images/mainImage.jpg');display: block"
        >
          <div id="QuestionDiv" style="width: 100%; height: 100%; padding: 2px" >
            <div style="width: 100%; height: 5%; padding: 2px">
              <fieldset>
                <div style="display: inline-block">
                  <h1 id="qLbl" style="margin: 2px 2px 2px 2px">Question</h1>
                </div>
              </fieldset>
            </div>
            <div style="height: 89%" class="wrapper1">
              <code
                style="margin: 2px 2px 0px 2px"
                id="ace-editorid"
                class="ace_editor ace-tomorrow"
              ></code>
            </div>
            <div style="width: 99.59%; height: 5%; margin: 0px 2px 2px 2px">
              <fieldset>
                <div style="display: inline-block;width: 99.59%;align-items: center;">
                  <h1  style="margin: 0px 5px 5px 3px;"><input  style="background: none;width: 100%;font-size:large;border: none;padding:3px 3px 3px 3px;" type="text" id="qT1" placeholder="Question Title" disabled></h1>
                </div>
              </fieldset>
            </div>
          </div>

          <div id="TestCaseDiv"  style="width: 100%; height: 100%; padding: 2px"  hidden>
            <div style="width: 100%; height: 5%; padding: 2px">
              <fieldset>
                <div style="display: inline-block">
                  <h1 id="tstLbl" style="margin: 2px 2px 2px 2px">Test Cases</h1>
                </div>
              </fieldset>
            </div>
            <div style="height: 89%" class="wrapper1">
              <code
                style="margin: 2px 2px 0px 2px"
                id="ace-editorid1"
                class="ace_editor ace-tomorrow"
              ></code>
            </div>
            <div style="width: 99.59%; height: 5%; margin: 0px 2px 2px 2px">
              <fieldset>
                <div style="display: inline-block;width: 99.59%;align-items: center;">
                  <h1  style="margin: 0px 5px 5px 3px;"><input  style="background: none;width: 100%;font-size:large;border: none;padding:3px 3px 3px 3px;" type="text" id="qT2" placeholder="Question Title" disabled></h1>
                </div>
              </fieldset>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js"></script>
  <script>
    var theme = "ace/theme/tomorrow";
    var mode = "ace/mode/scss";
    var editor = ace.edit("ace-editorid");
    editor.setTheme(theme);
    editor.getSession().setMode(mode);

    var editor1 = ace.edit("ace-editorid1");
    editor1.setTheme(theme);
    editor1.getSession().setMode(mode);
    
    editor.setReadOnly(true);  
    editor1.setReadOnly(true);  

    $("#ace-mode").on("change", function () {
      editor.getSession().setMode("ace/mode/" + $(this).val().toLowerCase());
    });
    $("#ace-theme").on("change", function () {
      editor.setTheme("ace/theme/" + $(this).val().toLowerCase());
    });

    function myfunction() {
        const queryParams = new URLSearchParams(window.location.search);
        let id = queryParams.get("Contest_Id");
        let qid = queryParams.get("Question_Id");
        getQuestion(qid,editor,editor1);
        showViewQuestionOption();
      }
  </script>
  </body>
</html>
