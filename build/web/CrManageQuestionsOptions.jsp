<%@page import="java.util.Date"%>
<%@page import="dao.QuestionDAO" %>
<%@page import="dao.ParticipantDAO" %>
<%@page import="dao.CoordinatorDAO" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />

        <title>Teckniska</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700" />
        <link rel="stylesheet" href="styleSheet/login.css" type="text/css" />

        <script type="text/javascript" src="jsscript/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link rel="icon" href="/images/Fav_icon.png" sizes="32x32" />
        <link rel="icon" href="/images/logo.png" sizes="192x192" />
        <link rel="apple-touch-icon"
              href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png" />
        <script type="text/javascript" src="jsscript/CrManageQuestionOptions.js"></script>
        <script>
            function myFunction() {
                const queryParams = new URLSearchParams(window.location.search);
                let id = queryParams.get("Contest_Id");
                document.getElementById("Contest_Id").innerHTML = id;
                document.getElementById("addQuestionLbl").innerHTML = "In Contest - <Strong>" + id + "</Strong>";
                showAddQuestionOption();
            }
        </script>
    </head>

    <body onload="myFunction()">
        <div class="container">
            <div class="column-wrap">
                <div class="column-left">
                    <div class="inner">
                        <img src="images/mainLogo.png" />

                        <h1>Welcome Coordinator</h1>
                        <% System.out.println("Inside manageCoordinator Option JSP");
                            String userid = (String) session.getAttribute("name");
                            String cr_id = (String) session.getAttribute("Cr_Id");
                    if (userid == null) {
                        response.sendRedirect("accessdenied.jspl");
                        return;
                    } %>
                        <p class="create">
                            <% out.println(userid); %>
                        </p>
                        <p id="Cr_Id" class="create" hidden>
                            <% out.println(cr_id); %>
                        </p>
                        <p id="Contest_Id" class="create" hidden></p>

                        <button id="addQBtn" type="button" class="g-recaptcha">
                            Add Question In Contest</button>
                        <br />
                        <button id="editQBtn" type="button" class="g-recaptcha">
                            Edit Question In Contest</button><br />
                        <button id="viewQBtn" type="button" class="g-recaptcha" >
                            View All Questions In Contest</button><br />

                        <p class="forgot">
                            <a href='<% out.print("CoordinatorControllerServlet;jsessionid=" + session.getId()); %>'>
                                Back
                            </a>
                        </p>

                        <p class="footer"><% out.println("© " + (new Date().getYear() + 1900) + " NeeL And Compnay, LLC.");%></p>
                    </div>
                </div>

                <div class="column-right" style="
                     background-image: url('images/mainImage.jpg');
                     ">
                    <div class="inner" style="border-radius: 20%">

                        <!-- Add Question In Contest-->
                        <div id="AddQuestion" style="width: 100%; border-radius: 1%" class="a_message general_announcements"
                             hidden>
                            <h2 class="a_message_title" style="text-align: center">
                                Add Question
                            </h2>
                            <p id="addQuestionLbl" class="create">In</p>
                            <p id="QuestionIdLbl" class="create">Question Id - <strong></strong></p>

                            <form method="" id="addQuestion">
                                <p class="create"></p>

                                <div class="a_message_button" style="text-align: center; padding: 10px">
                                    <button type="button" style="
                                            width: 100%;
                                            color: aliceblue;
                                            background-color: inherit;
                                            border: 0cm;
                                            " id="setButton" class="g-recaptcha" 
                                            onclick="goToSetQuestion()">
                                        Set Question
                                    </button>
                                </div>
                            </form>
                        </div>

                        <!-- Edit Question In Contest -->
                        <div id="EditQuestion" style="width: 900px; border-radius: 1%" class="a_message2" hidden>
                            <h2 style="text-align: center" class="a_message_title">
                                View All Active Contests
                            </h2>

                            <table id="myTable_EditQuestion" style="width: 100%; text-align: left; padding: 4px">
                                <thead>
                                    <tr>
                                        <th>Question Id</th>
                                        <th>Title</th>
                                        <th>Level</th>
                                    </tr>
                                </thead>
                                <tbody ></tbody>
                            </table>
                        </div>

                        <!-- View All Active Contest Form -->
                        <div id="ViewAllQuestion" style="width: 900px; border-radius: 1%" class="a_message2" hidden>
                            <h2 style="text-align: center" class="a_message_title">
                                View All Active Contests
                            </h2>

                            <table id="myTable_ViewAllQuestion" style="width: 100%; text-align: left; padding: 4px">
                                <thead>
                                    <tr>
                                        <th>Question Id</th>
                                        <th>Title</th>
                                        <th>Level</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: left"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        document.getElementById("editQBtn").addEventListener("click", (event) => {
            showEditQuestionOption();
        });

        document.getElementById("addQBtn").addEventListener("click", (event) => {
            showAddQuestionOption();
        });

        document.getElementById("viewQBtn").addEventListener("click", (event) => {
            showViewAllQuestionsOption();
        });

    </script>
</html>