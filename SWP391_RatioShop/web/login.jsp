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
        <title>Login</title>
        <%@include file="head.jsp" %>
        <style>
            .login-section {
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
        <!-- Header Section Begin -->
        <header class="header">
            <%@include file="header.jsp" %>
        </header>
        <!-- Header Section End -->

        <section class="login-section">
            <div class="container">
                <div class="row d-flex justify-content-center align-items-center p-2">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style= "box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                            <div class="card-body p-5 text-center">
                                <h3 class="mb-5">Sign in</h3>
                                <c:if test="${err!=null}">
                                    <font color ="red">  ${err}</font>
                                </c:if>
                                <c:if test="${param.success ne null}">
                                    <p class="text-center text-muted mt-5 mb-4">Register successful! Login now</p>
                                </c:if>
                                <form method="post">
                                    <div class="form-outline mb-4">
                                        <input name="email"  type="email" id="inputEmail" class="form-control" placeholder="Email" required="" autofocus="" value="${email}">
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input name="password"  type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                                    </div>

                                    <!-- Forgot password -->
                                    <p class="small mb-5 pb-lg-2"><a class="text-muted" href="forget">Forgot password?</a></p>
                                    <hr class="my-4">

                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

                                    <hr class="my-4">
                                </form>
                                <!--                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/onlineshop/logingoogle&response_type=code&client_id=690034575016-eo2ous2e565daim8dktf09lp925aig4u.apps.googleusercontent.com&approval_prompt=force">
                                                                    <button class="btn btn-lg btn-block btn-primary" style="background-color: #dd4b39;"                                                                                                         >
                                                                        Sign in with google</button></a>-->

                                <hr class="my-4">

                                <p>Don't have an account? <a href="register" class="link-info">Register here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer Section Begin -->
        <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>
        <!-- Footer Section End -->
    </body>
</html>
