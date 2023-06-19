<%@page import="java.util.Date"%>
<%@page import="dao.ParticipantDAO"%> 
<%@page import="dao.CoordinatorDAO"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1" />

    <title>Teckniska</title>

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700"
    />
    <link rel="stylesheet" href="styleSheet/login.css" type="text/css" />
    <script
      type="text/javascript"
      src="jsscript/CrManageContestOption.js"
    ></script>
    <script type="text/javascript" src="jsscript/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="icon" href="/images/Fav_icon.png" sizes="32x32" />
    <link rel="icon" href="/images/logo.png" sizes="192x192" />
    <link
      rel="apple-touch-icon"
      href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png"
    />
    <script>
      function myFunction() {
        const queryParams = new URLSearchParams(window.location.search);
        let id = queryParams.get("Id");
        if (id === "RegisterParticipant") {
          getAllActiveContests();
          showViewAllActiveContest();
        } else if (id === "RemoveParticipant") {
          getAllActiveContests1();
          showViewAllActiveContest();
        } else if (id === "StartContest") {
          getAllActiveContest2();
          showViewAllActiveContest();
        } 
        else {
          showViewAllContest();
        }
        
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
            String userid=(String)session.getAttribute("name"); 
            String cr_id=(String)session.getAttribute("Cr_Id"); 
            if(userid==null) 
            {
                response.sendRedirect("accessdenied.jsp"); return; 
            } 
            %>
            <p class="create"><% out.println(userid); %></p>
            <p id ="Cr_Id" class="create" hidden><% out.println(cr_id); %></p>

            <button
              id="startBtn"
              type="button"
              class="g-recaptcha">
              Start Contest</button>
              <br/>
            <button
              id="regBtn"
              type="button"
              class="g-recaptcha">
              Register Participant In Contest</button>
              <br/>
            <button
              id="remBtn"
              type="button"
              class="g-recaptcha">
              Remove Participant In Contest</button
            ><br />
            <button
              type="button"
              class="g-recaptcha"
              onclick="showViewAllContest()"
            >
              View All Contests</button
            ><br />

            <p class="forgot">
              <a
                href='<%
                                        String result = (String)session.getAttribute("userType");
                                        String url;
                                            if (result.equalsIgnoreCase("Admin")) {
                                                System.out.println("Inside Admin Login redirect");
                                                url = "AdminControllerServlet;jsessionid=" + session.getId();
                                                out.print(url);
                                            }
                                            else  
                                            {
                                                System.out.println("Inside Coordinator Login redirect");
                                                url = "CoordinatorControllerServlet;jsessionid=" + session.getId();
                                                out.print(url);
                                            }
                               %>'
              >
                Back
              </a>
            </p>


            <p class="footer">
                <% out.println("� " + (new Date().getYear() + 1900) + " NeeL And Compnay, LLC.");%>
            </p>
          </div>
        </div>

        <div
          class="column-right"
          style="
            background-image: url('images/mainImage.jpg');
          "
        >
          <div class="inner" style="border-radius: 20%">
            <!-- Register Participant In contest-->
            <div
              id="RegisterParticipantInContest"
              style="width: 100%; border-radius: 1%"
              class="a_message general_announcements"
              hidden
            >
              <h2 class="a_message_title" style="text-align: center">
                Register Participant
              </h2>
              <p id="regLabel1" class="create">In</p>

              <form method="post" id="registerParticipantInContest">
                <div class="create">
                  <label for="text"> Participant Id </label><br />
                  <input
                    style="width: 100%"
                    type="text"
                    id="regLbl"
                    value=""
                  />
                </div>

                <p class="forgot" style="text-align: center">
                  <a id="regSearch" name="regSearch"><strong>Search</strong></a>
                </p>
                <br />
                <div class="create">
                  <label for="text"> Name </label><br />
                  <input
                    style="width: 100%"
                    type="text"
                    id="regName"
                    name="r_name"
                    disabled
                  />
                </div>
                <br />
                <div id="create" class="input-wrap">
                  <label for="mobile"> Mobile No</label>
                  <br />
                  <input
                    style="width: 100%"
                    type="text"
                    id="regMobile"
                    name="r_mobile"
                    disabled
                  />
                </div>
                <br />
                <div class="create">
                  <label for="email "> Email Id </label><br />
                  <input
                    style="width: 100%"
                    type="email"
                    id="regEmail"
                    name="r_email"
                    disabled
                  />
                </div>

                <br />

                <div
                  class="a_message_button"
                  style="text-align: center; padding: 10px"
                >
                  <button
                    type="button"
                    style="
                      width: 100%;
                      color: aliceblue;
                      background-color: inherit;
                      border: 0cm;
                    "
                    class="g-recaptcha"
                    onclick="registerParticipantInContest()"
                  >
                    Register Participant
                  </button>
                </div>
              </form>
            </div>

            <!-- Remove Participant In contest-->
            <div
              id="RemoveParticipantFromContest"
              style="width: 100%; border-radius: 1%"
              class="a_message general_announcements"
              hidden
            >
              <h2 class="a_message_title" style="text-align: center">
                Remove Participant
              </h2>
              <p id="remLabel1" class="create">From</p>

              <form method="post" id="removeParticipant">
                <div class="create">
                  <label for="text"> Participant Id </label><br />
                  <input
                    style="width: 100%"
                    type="text"
                    id="remLbl"
                    name="r_id"
                    value=""
                  />
                </div>

                <p class="forgot" style="text-align: center">
                  <a id="remSearch" name="remSearch"><strong>Search</strong></a>
                </p>
                <br />
                <div class="create">
                  <label for="text"> Name </label><br />
                  <input
                    style="width: 100%"
                    type="text"
                    id="remName"
                    name="rem_name"
                    disabled
                  />
                </div>
                <br />
                <div id="create" class="input-wrap">
                  <label for="mobile"> Mobile No</label>
                  <br />
                  <input
                    style="width: 100%"
                    type="text"
                    id="remMobile"
                    name="r_mobile"
                    disabled
                  />
                </div>
                <br />
                <div class="create">
                  <label for="email "> Email Id </label><br />
                  <input
                    style="width: 100%"
                    type="email"
                    id="remEmail"
                    name="r_email"
                    disabled
                  />
                </div>

                <br />

                <div
                  class="a_message_button"
                  style="text-align: center; padding: 10px"
                >
                  <button
                    type="button"
                    style="
                      width: 100%;
                      color: aliceblue;
                      background-color: inherit;
                      border: 0cm;
                    "
                    class="g-recaptcha"
                    onclick="removeParticipantFromContest()"
                  >
                    Remove Participant
                  </button>
                </div>
                <!-- unique key -->
              </form>
            </div>

            <!-- View All Active Contest Form -->
            <div
              id="ViewAllActiveContest"
              style="width: 900px; border-radius: 1%"
              class="a_message2"
              hidden
            >
              <h2 style="text-align: center" class="a_message_title">
                View All Active Contests
              </h2>

              <table
                id="myTable_ActiveContest"
                style="width: 100%; text-align: left; padding: 4px"
              >
                <thead>
                  <tr>
                    <th>Contest Id</th>
                    <th>Levels</th>
                    <th>No_of_participants</th>
                    <th>Winner</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody style="text-align: left"></tbody>
              </table>
            </div>

            <!-- View All Contest Form -->
            <div
              id="ViewAllContest"
              style="width: 900px; border-radius: 1%"
              class="a_message2"
              hidden
            >
              <h2 style="text-align: center" class="a_message_title">
                View All Contests
              </h2>

              <table
                id="myTable"
                style="width: 100%; text-align: left; padding: 4px"
              >
                <thead>
                  <tr>
                    <th>Contest Id</th>
                    <th>Levels</th>
                    <th>No_of_participants</th>
                    <th>Winner</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody style="text-align: left"></tbody>
              </table>
            </div>

            <!-- View All Registered Participants Form -->
            <div
              id="AllRegisteredParticipantsInContest"
              style="width: 900px; border-radius: 1%"
              class="a_message2"
              hidden
            >
              <h2 style="text-align: center" class="a_message_title">
                View All Contests
              </h2>

              <table
                id="myTable"
                style="width: 100%; text-align: left; padding: 4px"
              >
                <thead>
                  <tr>
                    <th>Contest Id</th>
                    <th>Levels</th>
                    <th>No_of_participants</th>
                    <th>Winner</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody style="text-align: left"></tbody>
              </table>
            </div>

            <!-- Start Contest -->
            <div id="StartContest" style="width: 100%; border-radius: 1%" class="a_message general_announcements"
                             hidden>
                            <h2 class="a_message_title" style="text-align: center">
                                Start Contest
                            </h2>
                            <p id="startContestLbl" class="create">In</p>
                            
                            <p id ="statusLbl" class="create" hidden></p>
                            <p id ="levelLbl" class="create" hidden></p>

                            <form method="">
                                <p class="create"></p>
                                <div class="a_message_button" style="text-align: center; padding: 10px">
                                    <button type="button" style="
                                            width: 100%;
                                            color: aliceblue;
                                            background-color: inherit;
                                            border: 0cm;
                                            " id="setButton" class="g-recaptcha" 
                                            onclick="StartContest()">
                                        Start
                                    </button>
                                </div>
                            </form>
                        </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
    document.getElementById("regBtn").addEventListener("click", (event) => {
      clear();
      getAllActiveContests();
      showViewAllActiveContest();
    });
    document.getElementById("remBtn").addEventListener("click", (event) => {
      clear();
      getAllActiveContests1();
      showViewAllActiveContest();
    });
    document.getElementById("startBtn").addEventListener("click", (event) => {
      clear();
      getAllActiveContest2();
      showViewAllActiveContest();
    });

    document.getElementById("regSearch").addEventListener("click", (event) => {
      getRecord($("#regLbl").val(),'Reg');
    });

    document.getElementById("remSearch").addEventListener("click", (event) => {
      getRecord($("#remLbl").val(),'Rem');
    });
  </script>
</html>
