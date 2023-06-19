<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Teckniska</title>

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700"
    />
    <link rel="stylesheet" href="styleSheet/login.css" type="text/css" />
    <script
      type="text/javascript"
      src="jsscript/coordinatoroptions.js"
    ></script>
    <script type="text/javascript" src="jsscript/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="icon" href="/images/Fav_icon.png" sizes="32x32" />
    <link rel="icon" href="/images/logo.png" sizes="192x192" />
    <link
      rel="apple-touch-icon"
      href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png"
    />
  </head>

  <body>
    <div class="container">
      <div class="column-wrap">
        <div class="column-left">
          <div class="inner">
            <img src="images/mainLogo.png" />

            <h1>Welcome Coordinator</h1>
            <% System.out.println("Inside Coordinator Option JSP"); String
            userid=(String)session.getAttribute("name"); 
            String cr_id=(String)session.getAttribute("Cr_Id"); 
            if(userid==null) 
            {
            response.sendRedirect("accessdenied.jsp"); return; 
            } %>
            <p class="create"><% out.println(userid); %></p>
            <p id="Cr_Id" class="create" hidden><% out.println(cr_id); %></p>



            <button
              type="button"
              class="g-recaptcha"
              onclick="showParticipnatsOption()"
            >
              Manage Participants</button
            ><br/>
            <button
              type="button"
              class="g-recaptcha"
              onclick="showContestOption()"
            >
              Contest Options</button
            ><br/>
            <button
              type="button"
              class="g-recaptcha"
              onclick="showQuestionsOption()"
            >
              Manage Questions</button>

            <p class="forgot">
              <a href='Home.jsp'>Logout</a>
            </p>

            <p class="footer"><% out.println("� "+(new Date().getYear()+1900)+" NeeL And Compnay, LLC."); %></p>
          </div>
        </div>

        <section id="manageCoordinator"></section>

        <div
          class="column-right"
          style="background-image:url('images/mainImage.jpg');"
        >
          <div class="inner">
            <!-- Manage Participnats Options -->
            <div
              id="manageParticipantsOption"
              style="border-radius: 1%"
              class="a_message general_announcements"
            >
              <h2 class="a_message_title" style="text-align: center">
                Manage Participants
              </h2>

              <div class="a_message_button">
                <a
                  href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=Add"); %>'
                  style="text-align: center"
                  >Add Participant</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=Remove"); %>'
                  style="text-align: center"
                  >Remove Participant</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=Update"); %>'
                  style="text-align: center"
                  >Update Participant</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("manageParticipantsOptions.jsp;jsessionid="+session.getId()+"?Id=ViewAll"); %>'
                  style="text-align: center"
                  >View All Participant</a
                >
              </div>
            </div>

            <!-- Manage Quiz Options -->
            <div
              id="manageContestOption"
              style="border-radius: 1%"
              class="a_message general_announcements"
              hidden
            >
              <h2 class="a_message_title" style="text-align: center">
                Manage Contest
              </h2>

              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=StartContest"); %>'
                  style="text-align: center"
                  >Start Contest</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=RegisterParticipant"); %>'
                  style="text-align: center"
                  >Register Participant In Contest</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=RemoveParticipant"); %>'
                  style="text-align: center"
                  >Remove Participant from Contest</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=ViewAll"); %>'
                  style="text-align: center"
                  >View All Contests</a
                >
              </div>
            </div>

            <!-- Manage Question Options -->
            <div
              id="manageQuestionOption"
              style="border-radius: 1%"
              class="a_message general_announcements"
              hidden
            >
              <h2 class="a_message_title" style="text-align: center">
                Manage Question
              </h2>

              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=RegisterParticipant"); %>'
                  style="text-align: center"
                  >Add Question In Contest</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=RemoveParticipant"); %>'
                  style="text-align: center"
                  >Edit Question In Contest</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=RegisterParticipant"); %>'
                  style="text-align: center"
                  >View Question In Contest</a
                >
              </div>
              <br />
              <div class="a_message_button">
                <a
                  href='<% out.print("CrManageContestOptions.jsp;jsessionid="+session.getId()+"?Id=ViewAll"); %>'
                  style="text-align: center"
                  >View All Contests</a
                >
              </div>
            </div>

             <!-- View All Active Contest Form -->
             <div
             id="ViewAllActiveContest"
             style="width: 900px; border-radius: 1%"
             class="a_message2"
             hidden
           >
             <h2 style="text-align: center" class="a_message_title">
               Select Contest
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
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
