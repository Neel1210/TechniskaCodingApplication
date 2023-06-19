<%@page import="dao.ContestDAO" %>
  <%@page import="java.util.Date" %>
    <%@page import="dao.CoordinatorDAO" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />

        <title>Teckniska</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700" />
        <link rel="stylesheet" href="styleSheet/login.css" type="text/css" />
        <script type="text/javascript" src="jsscript/manageContest.js"></script>
        <script type="text/javascript" src="jsscript/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link rel="icon" href="/images/Fav_icon.png" sizes="32x32" />
        <link rel="icon" href="/images/logo.png" sizes="192x192" />
        <link rel="apple-touch-icon"
          href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png" />
        <script>
          function myFunction() {
            const queryParams = new URLSearchParams(window.location.search);
            let id = queryParams.get("Id");
            if (id === "Add") showAddNewContest();
            else if (id === "RegisterCoordinator") showViewAllActiveContest();
            else showViewAllContest();
          }
        </script>
      </head>

      <body onload="myFunction()">
        <div class="container">
          <div class="column-wrap">
            <div class="column-left">
              <div class="inner">
                <img src="images/mainLogo.png" />

                <h1>Welcome Admin</h1>
                <% 
                System.out.println("Inside Contest Option JSP"); 
                String userid=(String)session.getAttribute("name");
                if(userid==null) 
                { 
                  response.sendRedirect("accessdenied.jsp"); 
                  return; 
                } 
                String id=ContestDAO.getNewId(); 
                %>
                  
                <p class="create">
                    <% out.println(userid); %>
                </p>

                  <button type="button" class="g-recaptcha" onclick="showAddNewContest()">
                    Add New Contest
                  </button>
                  <br/>
                  <button type="button" class="g-recaptcha" onclick="showViewAllActiveContest()">
                    Register Coordinators In Contest
                  </button>
                  <br/>
                  <button type="button" class="g-recaptcha" onclick="showViewAllContest()">
                    View All Contests
                  </button>
                  <br/>

                  <p class="forgot">
                    <a href='<%
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
           %>'>
                      Back
                    </a>
                  </p>
                  <p class="footer"><% out.println("© "+(new Date().getYear()+1900)+" NeeL And Compnay, LLC."); %></p>
              </div>
            </div>

            <div class="column-right" style="
            background-image: url('images/mainImage.jpg');
          " hidden>
              <div class="inner" style="border-radius: 20%">
                <!-- Add Contest Form -->
                <div id="AddContest" style="width: 100%; border-radius: 1%" class="a_message general_announcements">
                  <h2 class="a_message_title" style="text-align: center">
                    Add Contest
                  </h2>
                  <form method="post" id="addContest">
                    <div class="create">
                      <label for="text"> Contest Id </label><br />
                      <input style="width: 100%" type="text" id="id" name="id" value="<%out.println(id);%>" disabled />
                    </div>
                    <br />
                    <div class="create">
                      <label for="text"> Levels </label><br />
                      <input style="width: 100%" type="number" id="level" name="level" />
                    </div>
                    <br />
                    <div class="a_message_button" style="text-align: center; padding: 10px">
                      <button type="button" style="
                      width: 100%;
                      color: aliceblue;
                      background-color: inherit;
                      border: 0cm;
                    " class="g-recaptcha" onclick="addCotest()">
                        Add Contest
                      </button>
                    </div>
                  </form>
                </div>

                <!-- Register Coordinator In Contest Form -->
                <div id="RegisterCoordinatorInContest" style="width: 100%; border-radius: 1%"
                  class="a_message general_announcements" hidden>
                  <h2 class="a_message_title" style="text-align: center">
                    Register Coordinators
                  </h2>
                  <p id="Label1" class="create">In</p>
                  <form method="" id="registerCoordinatorInContest">
                    <div class="create">
                      <br />
                      <label for="text"> Coordinator Id </label>
                      <br />
                      <input style="width: 100%" type="text" id="u_id" name="u_id" value="" />
                    </div>
                    <p class="forgot" style="text-align: center">
                      <a onclick='getRecord("Update")'><strong>Search</strong></a>
                    </p>
                    <br />
                    <div class="create">
                      <label for="text"> Name</label>
                      <br />
                      <input style="width: 100%" type="text" id="u_name" name="u_name" disabled />
                    </div>
                    <br />
                    <div id="password " class="input-wrap">
                      <label for="mobile"> Mobile No </label><br />
                      <input style="width: 100%" type="tel" id="u_mobile" name="u_mobile" disabled />
                    </div>
                    <br />
                    <div class="create">
                      <label for="email"> Email Id </label><br />
                      <input style="width: 100%" type="email" id="u_email" name="u_email" disabled />
                    </div>

                    <br />
                    <div class="create">
                      <label for="text"> Branch </label><br />
                      <input style="width: 100%" type="text" id="u_branch" name="u_branch" disabled />
                    </div>
                    <br />
                    <div class="create">
                      <label for="text"> Semester </label><br />
                      <input style="width: 100%" type="text" id="u_semester" name="u_semester" disabled />
                    </div>
                    <br />
                    <br />

                    <div class="a_message_button" style="text-align: center; padding: 10px">
                      <button type="button" id="add" style="
                      width: 100%;
                      color: aliceblue;
                      background-color: inherit;
                      border: 0cm;
                    " class="g-recaptcha" onclick="registerCoordinatorInContest()">
                        Register Coordinator
                      </button>
                    </div>
                  </form>
                </div>

                <!-- View All Participant Form -->
                <div id="ViewAllContest" style="width: 900px; border-radius: 1%" class="a_message2" hidden>
                  <h2 style="text-align: center" class="a_message_title">
                    View All Contests
                  </h2>

                  <table id="myTable" style="width: 100%; text-align: left; padding: 4px">
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

                <!-- View All Active Contest Form -->
                <div id="ViewAllActiveContest" style="width: 900px; border-radius: 1%" class="a_message2" hidden>
                  <h2 style="text-align: center" class="a_message_title">
                    View All Active Contests
                  </h2>

                  <table id="myTable_ActiveContest" style="width: 100%; text-align: left; padding: 4px">
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
              </div>
            </div>
          </div>
        </div>
      </body>

      </html>