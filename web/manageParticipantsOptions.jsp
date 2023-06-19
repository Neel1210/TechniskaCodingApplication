<%@page import="java.util.Date"%>
<%@page import="dao.ParticipantDAO"%>
    <%@page import="dao.CoordinatorDAO"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>Teckniska</title>

            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700">
            <link rel="stylesheet" href="styleSheet/login.css" type="text/css">
            <script type="text/javascript" src="jsscript/manageParticipants.js"></script>
            <script type="text/javascript" src="jsscript/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


            <link rel="icon" href="/images/Fav_icon.png" sizes="32x32">
            <link rel="icon" href="/images/logo.png" sizes="192x192">
            <link rel="apple-touch-icon" href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png">
            <script>
                function myFunction() {
                    const queryParams = new URLSearchParams(window.location.search);
                    let id = queryParams.get('Id');
                    if (id === 'Add')
                        showAddParticipant();
                    else if (id === 'Remove')
                        showRemoveParticipant();
                    else if (id === 'Update')
                        showUpdateParticipant();
                    else
                        showViewAllParticipant();
                }
            </script>
        </head>

        <body onload="myFunction()">


            <div class="container">
                <div class="column-wrap">

                    <div class="column-left">
                        <div class="inner">
                            <img src="images/mainLogo.png">

                            <h1>Welcome Admin</h1>
                            <%
                    System.out.println("Inside manageCoordinator Option JSP");
                    String userid=(String)session.getAttribute("name");
                            
                    
                    if(userid==null)
                    {
                        response.sendRedirect("accessdenied.jsp");
                        return;
                    }
                            
                    String id=ParticipantDAO.getNewId();
                        %>
                                <p class="create">
                                    <%
                            out.println(userid);
                            %>
                                </p>

                                <button type="button" class="g-recaptcha" onclick="showAddParticipant()">Add Participants</button><br>
                                <button type="button" class="g-recaptcha" onclick="showRemoveParticipant()">Remove Participants</button><br>
                                <button type="button" class="g-recaptcha" onclick="showUpdateParticipant()">Update Participants</button><br>
                                <button type="button" class="g-recaptcha" onclick="showViewAllParticipant()">View All Participants</button><br>


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
                               %>'> Back
                            </a>
                                </p>


                                <p class="footer"><% out.println("© "+(new Date().getYear()+1900)+" NeeL And Compnay, LLC."); %></p>
                        </div>
                    </div>

                    <div class="column-right" style="background-image: url('images/mainImage.jpg'); ">
                        <div class="inner " style="border-radius: 2%;">

                            <!-- Add Participant Form -->
                            <div id="AddParticipant" style="width: 100%;border-radius:1%;" class="a_message general_announcements" hidden>
                                <h2 class="a_message_title " style="text-align: center;">Register Participants</h2>

                                <form method="post" id="addParticipant">
                                    <div class="create">
                                        <label for="text"> Participant Id </label><br>
                                        <input style="width:100%;" type="text" id="id" name="id" value="<%out.println(id);%>" disabled>
                                    </div>
                                    <br>
                                    <div class="create">
                                        <label for="text"> Name
                                    </label><br>
                                        <input style="width:100%;" type="text" id="name" name="name">
                                    </div>
                                    <br>
                                    <div id="password " class="input-wrap ">
                                        <label for="mobile"> Mobile No
                                    </label><br>
                                        <input style="width:100%;" type="tel" id="mobile" name="mobile">
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="email "> Email Id
                                    </label><br>
                                        <input style="width:100%;" type="email" id="email" name="email">
                                    </div>

                                    <br>
                                    <div class="create ">
                                        <label for="text"> Branch
                                    </label><br>
                                        <input style="width:100%;" type="text" id="branch" name="branch">
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="text"> Semester
                                    </label><br>
                                        <input style="width:100%;" type="text" id="semester" name="semester">
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="password"> Password
                                    </label><br>
                                        <input style="width:100%;" style="width:100%;" type="password" id="password" name="password">
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="password"> Confirm Password
                                    </label><br>
                                        <input style="width:100%;" type="password" id="cnfPassword" name="cnfPassword">
                                    </div>
                                    <br>

                                    <div class="a_message_button " style="text-align: center;padding: 10px;">
                                        <button type="button" style="width: 100%;color: aliceblue;background-color:inherit;border: 0cm;" class="g-recaptcha" onclick="addParticipant()"> Add Participant
                                    </button>
                                    </div>
                                </form>
                            </div>

                            <!-- Remove Participant -->
                            <div id="RemoveParticipant" style="width: 100%;border-radius:1%;" class="a_message general_announcements" hidden>
                                <h2 class="a_message_title " style="text-align: center;"> Remove Participants
                                </h2>

                                <form method="post" id="removeParticipant">
                                    <div class="create">
                                        <label for="text"> Participant Id </label><br>
                                        <input style="width:100%;" type="text" id="r_id" name="r_id" value="">
                                    </div>

                                    <p class="forgot" style="text-align:center;">
                                        <a onclick='getRecord("remove")'><strong>Search</strong></a>
                                    </p>
                                    <br>
                                    <div class="create">
                                        <label for="text"> Name
                                    </label><br>
                                        <input style="width:100%;" type="text" id="r_name" name="r_name" disabled>
                                    </div>
                                    <br>
                                    <div id="create" class="input-wrap">
                                        <label for="mobile"> Mobile No</label>
                                        <br>
                                        <input style="width:100%;" type="text" id="r_mobile" name="r_mobile" disabled>
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="email "> Email Id
                                    </label><br>
                                        <input style="width:100%;" type="email" id="r_email" name="r_email" disabled>
                                    </div>

                                    <br>

                                    <div class="a_message_button " style="text-align: center;padding: 10px;">

                                        <button type="button" style="width: 100%;color: aliceblue;background-color:inherit;border: 0cm;" class="g-recaptcha" onclick="removeParticipant()"> Remove Participant
                                    </button>
                                    </div>
                                    <!-- unique key -->
                                </form>
                            </div>

                            <!-- Update Participant Form -->
                            <div id="UpdateParticipant" style="width: 100%;border-radius:1%;" class="a_message general_announcements" hidden>
                                <h2 class="a_message_title " style="text-align: center;">Update Participants</h2>

                                <form method="post" id="updateParticipant">
                                    <div class="create">
                                        <label for="text"> Participant Id </label><br>
                                        <input style="width:100%;" type="text" id="u_id" name="u_id" value="">
                                    </div>
                                    <p class="forgot" style="text-align:center;">
                                        <a onclick='getRecord("Update")'><strong>Search</strong></a>
                                    </p>
                                    <br>
                                    <div class="create">
                                        <label for="text"> Name
                                    </label><br>
                                        <input style="width:100%;" type="text" id="u_name" name="u_name">
                                    </div>
                                    <br>
                                    <div id="password " class="input-wrap ">
                                        <label for="mobile"> Mobile No
                                    </label><br>
                                        <input style="width:100%;" type="tel" id="u_mobile" name="u_mobile" disabled>
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="email "> Email Id
                                    </label><br>
                                        <input style="width:100%;" type="email" id="u_email" name="u_email" disabled>
                                    </div>

                                    <br>
                                    <div class="create ">
                                        <label for="text"> Branch
                                    </label><br>
                                        <input style="width:100%;" type="text" id="u_branch" name="u_branch">
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="text"> Semester
                                    </label><br>
                                        <input style="width:100%;" type="text" id="u_semester" name="u_semester">
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="password"> Password
                                    </label><br>
                                        <input style="width:100%;" style="width:100%;" type="password" id="u_password" name="u_password">
                                    </div>
                                    <br>
                                    <div class="create ">
                                        <label for="password"> Confirm Password
                                    </label><br>
                                        <input style="width:100%;" type="password" id="u_cnfPassword" name="u_cnfPassword">
                                    </div>
                                    <br>

                                    <div class="a_message_button " style="text-align: center;padding: 10px;">
                                        <button type="button" style="width: 100%;color: aliceblue;background-color:inherit;border: 0cm;" class="g-recaptcha" onclick="updateParticipant()"> Update Participant
                                    </button>
                                    </div>
                                </form>
                            </div>

                            <!-- View All Participant Form -->
                            <div id="ViewAllParticipant" style="width: 900px;border-radius:1%;" class="a_message2" hidden>
                                <h2 style="text-align:center;" class="a_message_title">View All Participants</h2>

                                <table id="myTable" style="width:100%;">
                                    <thead>
                                        <tr>
                                            <th>Participant Id</th>
                                            <th>Name</th>
                                            <th>Mail</th>
                                            <th>Mobile</th>
                                            <th>Semester</th>
                                            <th>Branch</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: left;">
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </body>

        </html>