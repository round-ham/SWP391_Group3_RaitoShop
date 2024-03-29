    
<!DOCTYPE html>

<html lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
        <style>
            .error-message {
    color: red;
    font-size: 0.875rem; /* Tu? ch?nh kích th??c phù h?p */
}
            body{
                margin-top:20px;
                background-color:#f2f6fc;
                color:#69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                border-radius: 50% !important;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }
        </style>


    </head>

    <body>
<a class="btn btn-primary mb-4" href="homepage">
        <i class="fas fa-arrow-left"></i> Back
    </a>
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                
                <a class="nav-link active ms-0" href="profile" target="__blank">Profile</a>
                <a class="nav-link" id="changePasswordLink" href="#"  onclick="loadChangePassword()" >Change Password</a>
                <a class="nav-link" id="my-order" href="my-order?accountId=${order.customerId}"  >My Order</a>
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row" id="profileContent">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4"></div>
                            <!-- Profile picture upload button-->
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <form action="changeprofile" method="POST">
                                <!-- Form Group (username)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label><span class="error-message">${checkName}</span>
                                    <input class="form-control" name="fullname" type="text" placeholder="Enter your username" value="${a.getFullName()}">
                                </div>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input class="form-control" name="email" type="email" placeholder="Enter your email address" value="${a.getEmail()}" readonly="">
                                </div>
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (location)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLocation">Location</label>
                                        <input class="form-control" name="address" type="text" placeholder="Enter your location" value="${a.getAddress()}">
                                    </div>
                                </div>

                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">Phone number</label><span class="error-message">${checkPhone}</span>
                                        <input class="form-control" name="phone" type="tel" placeholder="Enter your phone number" value="${a.getPhone()}">
                                    </div>
                                    <!-- Form Group (birthday)-->
                                </div>
                                <!-- Save changes button-->
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="changepasswordContent">
                <div class="card mb-4">
                    <div class="card-header">Change Password</div>
                    <div class="card-body">
                        <form action="changepass" method="POST">
                            <!-- Form Group (current password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="currentPassword">Current Password</label>
                                <span class="error-message">${ms1}</span>
                                <span class="error-message">${ms2}</span>
                                <span class="error-message">${ms3}</span>
                                <span class="error-message">${sc}</span>
                                <span class="error-message">${error}</span>
                                <input class="form-control" name="password" id="currentPassword" type="password" placeholder="Enter current password">
                            </div>
                            <!-- Form Group (new password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="newPassword">New Password</label>
                                <input class="form-control" name="newPassword" id="newPassword" type="password" placeholder="Enter new password">
                            </div>
                            <!-- Form Group (confirm password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                <input class="form-control" name="con_newPassword" id="confirmPassword" type="password" placeholder="Confirm new password">
                            </div>
                            <button class="btn btn-primary" type="submit">Save</button>
                        </form>
                    </div>
                </div>
            </div>       
        </div>
        <script>
            function loadChangePassword() {
                // Lo?i b? l?p active t? t?t c? các liên k?t
                var navLinks = document.getElementsByClassName("nav-link");
                for (var i = 0; i < navLinks.length; i++) {
                    navLinks[i].classList.remove("active");
                }

                // Thêm l?p active cho liên k?t "Change Password"
                document.getElementById("changePasswordLink").classList.add("active");

                // ?n ph?n profileContent
                document.getElementById("profileContent").style.display = "none";

                // Hi?n ph?n changepasswordContent
                document.getElementById("changepasswordContent").style.display = "block";
            }

            window.onload = function () {
                // ?n ph?n changepasswordContent khi trang ???c t?i l?n ??u tiên
                document.getElementById("changepasswordContent").style.display = "none";

                // Ki?m tra n?u URL có ch?a chu?i "/changepass" (t?c là b?n ?ang trên trang changepass)
                if (window.location.href.indexOf("/changepass") !== -1) {
                    // G?i hàm loadChangePassword() t? ??ng ?? hi?n th? n?i dung c?a trang changepassword
                    loadChangePassword();
                }

                // B?t s? ki?n click vào liên k?t "Profile"
                document.getElementById("profileLink").addEventListener("click", function () {
                    // Lo?i b? l?p active t? t?t c? các liên k?t
                    var navLinks = document.getElementsByClassName("nav-link");
                    for (var i = 0; i < navLinks.length; i++) {
                        navLinks[i].classList.remove("active");
                    }

                    // Thêm l?p active cho liên k?t "Profile"
                    document.getElementById("profileLink").classList.add("active");

                    // Hi?n ph?n profileContent
                    document.getElementById("profileContent").style.display = "block";

                    // ?n ph?n changepasswordContent
                    document.getElementById("changepasswordContent").style.display = "none";
                });
            };
        </script>

        <!--<script>
            window.onload = function() {
                // Ki?m tra n?u URL có ch?a chu?i "/changepass" (t?c là b?n ?ang trên trang changepass)
                if (window.location.href.indexOf("/changepass") !== -1) {
                    // G?i hàm loadChangePassword() t? ??ng ?? hi?n th? n?i dung c?a trang changepassword
                    loadChangePassword();
                }
            };
        </script>-->

    </body>

</html>
