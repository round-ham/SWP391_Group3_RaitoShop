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
        <title>Login</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <section class="vh-100" style="background-color: #ffffff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style= "box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                            <div class="card-body p-5 text-center">

                                <h3 class="mb-5">Sign in</h3>
                                <c:if test="${err!=null}">
                                    <font color ="red">  ${err}</font>
                                </c:if>
                                <form action="login" method="post">
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

                                <p>Don't have an account? <a href="register.jsp" class="link-info">Register here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
