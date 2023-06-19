<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Teckniska</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700">
    <link rel="stylesheet" href="styleSheet/login.css" type="text/css">
    <script type="text/javascript" src="jsscript/login.js"></script>
    <script type="text/javascript" src="jsscript/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="icon" href="images/Fav_icon.png" sizes="32x32">
    <link rel="icon" href="images/logo.png" sizes="192x192">
    <link rel="apple-touch-icon" href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png">

</head>

<body>
    <div class="container">
        <div class="column-wrap">

            <div class="column-left">
                <div class="inner">
                    <img src="images/mainLogo.png">

                    <h1>Log In</h1>

                    <form >
                        <div class="input-wrap">
                            <label for="email">Email Address</label>
                            <input type="text" id="email" name="email">
                        </div>

                        <div id="password" class="input-wrap">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password">
                        </div>

                        <div class="input-wrap">
                            <label for="remember" class="regular"></label>
                        </div>
                        <button type="button" class="g-recaptcha" onclick="connectUser()">Log In</button>
                    </form>

                    <p class="forgot">
                        <a href="">Forgot your password?</a>
                    </p>


                    <p class="footer"><% out.println("� " + (new Date().getYear() + 1900) + " NeeL And Compnay, LLC.");%></p>
                </div>
            </div>

            <div class="column-right" style="background-image:url('images/mainImage.jpg');">
                <div  class="inner">
                    
                    <div style="border-radius:1%;width:100%;" class="a_message1">
                        <h2 class="a_message_title1 ">Welcome to Tekniska <% out.println((new Date().getYear() + 1900));%></h2>
                        <div class="a_message_content1 ">Tekniska is the coding competation , Held in Barkatullah University Institute Of Technology , Bhopal. It was started from 2013 and now it's Organised every year.</div>

                        <div class="a_message_button1">
                            <a href="Instruction_page.jsp" >View Instructions for Test</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>

</html>