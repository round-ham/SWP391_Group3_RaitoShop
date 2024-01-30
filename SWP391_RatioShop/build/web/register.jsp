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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Register</title>
    </head>
    <body>
        
        <section class="vh-100 bg-image" style="background-color: #ffffff;">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card" style= "box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                                    <form action="register" method="post" onsubmit="return validateForm()">
                                        <div id="errorMessage" style="color: red;"></div>
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
                                            <input name="username"  type="text" id="inputPassword" class="form-control" placeholder="Username" required="">
                                        </div>

                                        <div class="form-outline mb-4">
                                            Gender  <input type="radio" name="gender" value="1" checked /> Male
                                            <input type="radio" name="gender" value="0" /> Female
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input name="phonenumber"  type="number" id="inputPassword" class="form-control" placeholder="PhoneNumber" >
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input name="address"  type="text" id="inputaddress" class="form-control" placeholder="Address" >
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit"
                                                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                        </div>

                                        <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login.jsp"
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
                    document.getElementById("errorMessage").innerHTML = "Vui lòng nhập đúng định dạng email";
                    return false;
                }

                if (password.value == "" || password.value.trim().length == 0) {
                    document.getElementById("errorMessage").innerHTML = "Mật khẩu không được để trống";
                    password.value = "";
                    repassword.value = "";
                    return false;
                }

                if (password.value.length < 6) {
                    document.getElementById("errorMessage").innerHTML = "Mật khẩu phải có ít nhất 6 ký tự";
                    return false;
                }

                if (password.value != repassword.value) {
                    document.getElementById("errorMessage").innerHTML = "Mật khẩu và mật khẩu lặp lại phải giống nhau";
                    return false;
                }

                if (phonenumber.value.length != 10 && phonenumber.value.length > 0) {
                    document.getElementById("errorMessage").innerHTML = "Số điện thoại phải có 10 số";
                    return false;
                }
                
                if ((address.value == "" && address.value.length != 0) || (address.value.trim().length == 0 && address.value.length != 0)) {
                    document.getElementById("errorMessage").innerHTML = "Vui lòng điền đúng địa chỉ";
                    return false;
                }
            }
        </script>
    </body>
</html>
