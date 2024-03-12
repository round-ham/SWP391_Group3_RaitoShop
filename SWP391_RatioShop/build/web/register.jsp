<%-- 
    Document   : login
    Created on : Jan 16, 2024, 1:53:33 PM
    Author     : Owwl
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="pic/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=0.7">
        <!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Register</title>
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
        <section class="vh-100 bg-image">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card" style= "box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Register</h2>
                                    <form action="register" method="post" onsubmit="return validateForm()">
                                        <div id="errorMessage" style="color: red;">${msg}</div>

                                        
                                        <c:if test="${param.success ne null}">
                                            <p class="text-center text-muted mt-5 mb-0">Register success <a href="login"
                                                                                                        ><u>Login here</u></a></p>
                                        </c:if>

                                        <div class="form-outline mb-4">
                                            <small class="form-text" style="color: red;">* Required</small>
                                            <input name="email"  type="email" id="inputEmail" class="form-control" placeholder="Email" required="" autofocus="">
                                        </div>

                                        <div class="form-outline mb-4">
                                            <small class="form-text" style="color: red;">* Required</small>
                                            <input name="password"  type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                                        </div>

                                        <div class="form-outline mb-4">
                                            <small class="form-text" style="color: red;">* Required</small>
                                            <input name="repassword"  type="password" id="inputPassword" class="form-control" placeholder="Repeat Password" required="">
                                        </div>

                                        <div class="form-outline mb-4">
                                            <small class="form-text" style="color: red;">* Required</small>
                                            <input name="fullName"  type="text" id="inputPassword" class="form-control" placeholder="Your Name" required="">
                                        </div>

                                        <div class="form-outline mb-4">
                                            Gender  <input type="radio" name="gender" value="1" checked /> Male
                                            <input type="radio" name="gender" value="0" /> Female
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input name="phonenumber"  type="text" id="inputPassword" class="form-control" placeholder="Phone Number" >
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input name="address"  type="text" id="inputaddress" class="form-control" placeholder="Address" >
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit"
                                                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                        </div>

                                        <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login"
                                                                                                                ><u>Login here</u></a></p>

                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            window.onload = function () {
                var msg = "${msg}";
                if (msg) {
                    document.getElementById("errorMessage").innerHTML = msg;
                }
            }
            function validateForm() {
                var email = document.getElementsByName("email")[0];
                var password = document.getElementsByName("password")[0];
                var repassword = document.getElementsByName("repassword")[0];
                var phonenumber = document.getElementsByName("phonenumber")[0];
                var address = document.getElementsByName("address")[0];

                var emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
                if (!email.value.match(emailPattern)) {
                    document.getElementById("errorMessage").innerHTML = "Please enter the right email format";
                    return false;
                }

                if (password.value == "" || password.value.trim().length == 0) {
                    document.getElementById("errorMessage").innerHTML = "Password can not be left blanked";
                    password.value = "";
                    repassword.value = "";
                    return false;
                }

                if (password.value.length < 6) {
                    document.getElementById("errorMessage").innerHTML = "Password needs to have atleast 6 digits";
                    return false;
                }

                if (password.value != repassword.value) {
                    document.getElementById("errorMessage").innerHTML = "Password and repeat password must be identical";
                    return false;
                }

                if (phonenumber.value.length != 10 && phonenumber.value.length > 0) {
                    document.getElementById("errorMessage").innerHTML = "Phone nummber needs to have atleast 10 digits";
                    return false;
                }

                if ((address.value == "" && address.value.length != 0) || (address.value.trim().length == 0 && address.value.length != 0)) {
                    document.getElementById("errorMessage").innerHTML = "Address can not be left blanked";
                    return false;
                }
            }
        </script>
    </body>
</html>
