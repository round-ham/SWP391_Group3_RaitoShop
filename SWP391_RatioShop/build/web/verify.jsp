<%-- 
    Document   : verify
    Created on : Feb 5, 2024, 1:53:33 PM
    Author     : Owwl
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="pic/logo.png">
        <title>Verify</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>

            div#notes {
                margin-top: 30px;
            }

        </style>
        <style>
        body {
            /* Set background image */
            background-image: url('https://wallpapercave.com/wp/wp5625962.jpg');
            /* Adjust background image size and positioning */
            background-size: cover; /* Adjust as needed */
            background-position: center center; /* Adjust as needed */
            /* Set background color as fallback */
            background-color: #f0f0f0; /* Fallback color */
        }
    </style>
    </head>
    <body>
        <div class="container">
            <!-- Instructions -->
            <div class="row d-flex justify-content-center align-items-center">
                <div class="alert alert-success col-md-12" role="alert" id="notes" style= "box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <h4>Verify your email</h4>
                    <ul>
                        <li>We have sent a confirmation code to your email.</li>
                        <li>If you don't see our email <a href="verify?email=${email}">Click here to resent the confirmation code</a></li>
                    </ul>
                </div>
            </div>
            <!-- Verification Entry Jumbotron -->
            <div class="row d-flex justify-content-center">
                <div class="col-md-12">
                    <div class="jumbotron text-center" style= "box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                        <h2>Your email confirmation code:</h2>
                        <c:if test="${err != null}">
                            <font color ="red">  ${err}</font>
                        </c:if>
                        <div id="timeout" style="display: none;">
                            <p>Your email confirmation code has expired</p>
                            <p>Please click the above button to get your new code</p>
                            <p><a href="reverify" onclick="showSubmitButton()">New confirmation code:</a></p>
                        </div>
                        <form method="post" action="verify">
                            <div class="form-group d-flex justify-content-center align-items-center">
                                <input type="hidden" name="email" value="${email}">
                                <input type="text" class="form-control col-md-6 " name="otp" required>
                                <input class="btn btn-primary" type="submit" value="Verify" style="margin-left: 20px">
                            </div>
                                <button class="btn btn-success"  style="margin-left: 50px">
                                    <a href="${authenticationfor}" style=" color: #000">Previous page ></a>
                                </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>

            function showSubmitButton() {
                document.getElementById('submit').disabled = false;
            }
            setTimeout(function () {
                document.getElementById('timeout').style.display = 'block';
                document.getElementById('submit').disabled = true;
            }, 1000 * 60 * 5);
        </script>
    </body>
</html>
