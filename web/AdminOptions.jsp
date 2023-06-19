<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Teckniska</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700">
    <link rel="stylesheet" href="styleSheet/login.css" type="text/css">
    
    <script type="text/javascript" src="jsscript/adminoptions.js"></script>
    <script type="text/javascript" src="jsscript/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="icon" href="images/favIcon.png" sizes="192x192">
    <link rel="apple-touch-icon" href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png">

</head>

<body>
    <div class="container">
        <div class="column-wrap">

            <div class="column-left">
                <div class="inner">
                    
                    <img src="images/mainLogo.png"/>

                    <h1>Welcome Admin</h1>
                    <%
                        String userid = (String) session.getAttribute("name");
                        if (userid == null) {
                            try {
                                response.sendRedirect("accessdenied.jsp");

                            } catch (Exception e) {
                                response.sendRedirect("accessdenied.jsp");
                            }

                        }
                    %>
                        <p class="create">
                            <% out.println(userid); %>
                        </p>

                        <button type="button" class="g-recaptcha" onclick="showCoordinatorOption()">Manage Cooridantors</button><br>
                        <button type="button" class="g-recaptcha" onclick="showParticipnatsOption()">Manage Participants</button><br>
                        <button type="button" class="g-recaptcha" onclick="showContestOption()">Manage Contest</button><br>

                        <p class="forgot">
                            <a href='Home.jsp'>Logout</a>
                        </p>

                        <p class="footer">
                            <% out.println("© "+(new Date().getYear()+1900)+" NeeL And Compnay, LLC."); %>
                        </p>
                </div>
            </div>

            <section id="manageCoordinator">


            </section>



            <div class="column-right" style="background-image: url('images/mainImage.jpg'); ">
                <div class="inner ">

                    <!-- Manage Coordinators Options -->
                    <div id="manageCoordinatorOption" style="border-radius:1%;" class="a_message general_announcements ">
                        <h2 class="a_message_title " style="text-align: center; ">Manage Coordinators</h2>


                        <div class="a_message_button ">
                            <a href='<% out.print("manageCoordinatorOptions.jsp;jsessionid="+session.getId()+"?Id=Add"); %>' style="text-align: center;">Add Coordinator</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageCoordinatorOptions.jsp;jsessionid="+session.getId()+"?Id=Remove"); %>' style="text-align: center;">Remove Coordinator</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageCoordinatorOptions.jsp;jsessionid="+session.getId()+"?Id=Update"); %>' style="text-align: center;">Update Coordinator</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageCoordinatorOptions.jsp;jsessionid="+session.getId()+"?Id=ViewAll"); %>' style=" text-align: center;">View All Coordinator</a>
                        </div>
                    </div>


                    <!-- Manage Participnats Options -->
                    <div id="manageParticipantsOption" style="border-radius:1%;" class="a_message general_announcements " hidden>
                        <h2 class="a_message_title " style="text-align: center; ">Manage Participants</h2>

                        <div class="a_message_button ">
                            <a href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=Add"); %>' style="text-align: center;">Add Participant</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=Remove"); %>' style="text-align: center;">Remove Participant</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=Update"); %>' style="text-align: center;">Update Participant</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=ViewAll"); %>' style="text-align: center;">View All Participant</a>
                        </div>
                    </div>

                    <!-- Manage Quiz Options -->
                    <div id="manageQuizOption" style="border-radius:1%;" class="a_message general_announcements " hidden>
                        <h2 class="a_message_title " style="text-align: center; ">Manage Contest</h2>

                        <div class="a_message_button ">
                            <a href='<% out.print("manageContestOptions.jsp;jsessionid="+session.getId()+"?Id=Add"); %>' style="text-align: center;">Add New Contest</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageContestOptions.jsp;jsessionid="+session.getId()+"?Id=RegisterCoordinator"); %>' style="text-align: center;">Register Coordinators In Contest</a>
                        </div>
                        <br>
                        <div class="a_message_button ">
                            <a href='<% out.print("manageContestOptions.jsp;jsessionid="+session.getId()+"?Id=ViewAll"); %>' style="text-align: center;">View All Contests</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript " src="jsscript/adminoptions.js ">
    </script>
</body>

</html>

