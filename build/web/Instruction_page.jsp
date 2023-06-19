<%@page import="java.util.Date"%>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Access Denied</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo|Lato:400,700">
        <link rel="stylesheet" href="styleSheet/login.css" type="text/css">

        <link rel="apple-touch-icon" href="https://wpforms.com/wp-content/uploads/2016/02/cropped-sullie-favicon-180x180.png">

    </head>
    <body>
        <div class="container">
            <div class="column-wrap">

                <div class="column-right" style="width: 100%; background-image: url('images/mainImage.jpg'); ">

                    <div  class="inner">

                        <div style="border-radius:1%;width:100%;" class="a_message1">
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

                            <div class="a_message_button1">
                                <a href="Home.jsp" >Login Page</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>