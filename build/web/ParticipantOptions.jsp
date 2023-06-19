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
      src="jsscript/ParticipantOptions.js"
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
            <img src="images/mainLogo.png"/>

            <h1>Welcome User</h1>
            <% System.out.println("Inside Participant Option JSP"); String
            userid=(String)session.getAttribute("name"); 
            String pt_id=(String)session.getAttribute("Pt_Id"); 
            if(userid==null) 
            {
            response.sendRedirect("accessdenied.jsp"); return; 
            } %>
            <p class="create"><% out.println(userid); %></p>
            <p id="Pt_Id" class="create" hidden><% out.println(pt_id); %></p>

            <button
              type="button"
              class="g-recaptcha"
              onclick="showInstructionOption();"
            >
              View Instructions</button
            ><br />
            <button
            id="viewAllActiveContest"
              type="button"
              class="g-recaptcha"
            >
              View All Active Contest</button
            ><br />
            <button
              id="viewAllContest"
              type="button"
              class="g-recaptcha"
            >
              View All Past Contest</button>

            <p class="forgot">
              <a href='Home.jsp'>Logout</a>
            </p>

            <p class="footer"><% out.println("© "+(new Date().getYear()+1900)+" NeeL And Compnay, LLC."); %></p>
          </div>
        </div>

        <section id="manageCoordinator"></section>

        <div
          class="column-right"
          style="background-image:url('images/mainImage.jpg');"
        >
          <div class="inner">

            <!-- View All Active Contest Form -->
            <div
            id="ViewAllActiveContest"
            style="width: 900px; border-radius: 1%"
            class="a_message2"
            hidden
            >
            <h2 style="text-align: center" class="a_message_title">
               All Running Contest
            </h2>

             <table
               id="myTable_ActiveContest"
               style="width: 100%; text-align: left; padding: 4px"
             >
               <thead>
                 <tr>
                   <th>Contest Id</th>
                   <th>Levels</th>
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
               All Past Contests
            </h2>

            <table
              id="myTable_ActiveContest"
              style="width: 100%; text-align: left; padding: 4px"
            >
              <thead>
                <tr>
                  <th>Contest Id</th>
                  <th>Levels</th>
                  <th>Winner</th>
                  <th>Status</th>
                </tr>
              </thead>
            <tbody style="text-align: left"></tbody>
             </table>
           </div>

           <!-- View All Active Contest Form -->
           <div id="ViewInstructions" style="border-radius:1%;width:100%;" class="a_message1" >
            <h2 class="a_message_title1 ">Welcome to Tekniska <% out.println((new Date().getYear() + 1900));%></h2>
            <div class="a_message_content1 ">
                <ol>
                    <li>Follow the contest rules.</li>
                    <li>Write clear and readable code.</li>
                    <li>Optimize for speed and efficiency.</li>
                    <li>Test your code thoroughly.</li>
                    <li>Use appropriate variable and function names.</li>
                    <li>Avoid code duplication.</li>
                    <li>Handle errors and exceptions gracefully.</li>
                    <li>Use proper indentation and formatting.</li>
                    <li>Understand the problem statement thoroughly.</li>
                    <li>Time management is crucial.</li>
                    <li>Avoid unnecessary complexity.</li>
                    <li>Document your code when necessary.</li>
                    <li>Be familiar with the programming language and its libraries.</li>
                    <li>Be aware of time and space constraints.</li>
                    <li>Pay attention to input and output formats.</li>
                </ol>
            </div>
          </div>

          </div>
        </div>
      </div>
    </div>
    <script>
      document.getElementById('viewAllActiveContest').addEventListener("click",(event)=>{
        getAllActiveContests();
        viewTable();
      });

      document.getElementById('viewAllContest').addEventListener("click",(event)=>{
        getAllActiveContest1();
        viewTable();
      });
    </script>
  </body>
</html>
