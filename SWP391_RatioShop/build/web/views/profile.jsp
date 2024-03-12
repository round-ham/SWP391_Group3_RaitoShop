<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
        <style>
            /*
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/CascadeStyleSheet.css to edit this template
            */
            /* 
                Created on : Feb 15, 2024, 11:15:58 PM
                Author     : Duc Hung Computer
            */
            body{
                margin-top:20px;
                color: #9b9ca1;
            }
            .bg-secondary-soft {
                background-color: rgba(208, 212, 217, 0.1) !important;
            }
            .rounded {
                border-radius: 5px !important;
            }
            .py-5 {
                padding-top: 3rem !important;
                padding-bottom: 3rem !important;
            }
            .px-4 {
                padding-right: 1.5rem !important;
                padding-left: 1.5rem !important;
            }
            .file-upload .square {
                height: 250px;
                width: 250px;
                margin: auto;
                vertical-align: middle;
                border: 1px solid #e5dfe4;
                background-color: #fff;
                border-radius: 5px;
            }
            .text-secondary {
                --bs-text-opacity: 1;
                color: rgba(208, 212, 217, 0.5) !important;
            }
            .btn-success-soft {
                color: #28a745;
                background-color: rgba(40, 167, 69, 0.1);
            }
            .btn-danger-soft {
                color: #ff0033;
                background-color: rgba(220, 53, 69, 0.1);
            }
            .form-control {
                display: block;
                width: 100%;
                padding: 0.5rem 1rem;
                font-size: 0.9375rem;
                font-weight: 400;
                line-height: 1.6;
                color: #29292e;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #e5dfe4;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 5px;
                -webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
            }
        </style>


    </head>

    <body>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Page title -->
                    <div class="my-5">
                        <h3><a href="homepage" style="color: black;text-decoration: none;">Home </a> > <a href="profile" style="color: black;text-decoration: none;">Profile</a></h3>
                        <hr>
                    </div>
                    <!-- Form START -->

                        <div class="row mb-5 gx-5">
                            <!-- Contact detail -->
                            <div class="col-xxl-8 mb-5 mb-xxl-0">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">Contact detail</h4>
                                        <!-- First Name -->
                                        <div class="col-md-6">
                                            <label class="form-label">Full Name </label>
                                            <input type="text" class="form-control" placeholder="" aria-label="First name" value="${a.getFullName()}">
                                        </div>
                                        <!-- Phone number -->
                                        <div class="col-md-6">
                                            <label class="form-label">Phone number *</label>
                                            <input type="text" class="form-control" placeholder="" aria-label="Phone number" value="${a.getPhone()}">
                                        </div>
                                        <!-- Email -->
                                        <div class="col-md-6">
                                            <label for="inputEmail4" class="form-label">Email *</label>
                                            <input type="email" class="form-control" id="inputEmail4" value="${a.getEmail()}" readonly>
                                        </div>
                                        <!-- Skype -->
                                        <div class="col-md-6">
                                            <label class="form-label">Address *</label>
                                            <input type="text" class="form-control" placeholder="" aria-label="Phone number" value="${a.getAddress()}">
                                        </div>
                                    </div> <!-- Row END -->
                                </div>
                            </div>
                            <!-- Upload profile -->
                            <div class="col-xxl-4">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">Profile photo</h4>
                                        <div class="text-center">
                                            <!-- Image upload -->
                                            <div class="square position-relative display-2 mb-3">
                                                <i class="fas fa-fw fa-user position-absolute top-50 start-50 translate-middle text-secondary"></i>
                                            </div>
                                            <!-- Button -->
                                            <input type="file" id="customFile" name="file" hidden="">
                                            <label class="btn btn-success-soft btn-block" for="customFile">Upload</label>   
                                            <button type="button" class="btn btn-danger-soft">Remove</button>
                                            <!-- Content -->
                                            <p class="text-muted mt-3 mb-0"><span class="me-1">Note:</span>Minimum size 300px x 300px</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- Row END -->

                        <!-- Social media detail -->
                        <div class="row mb-5 gx-5">

                            <!-- change password -->
                            <div class="col-xxl-6">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="my-4">Change Password</h4>
                                        <!-- Old password -->
                                        <div class="col-md-6">
                                            <label for="exampleInputPassword1" class="form-label">Old password *</label>
                                            <input type="password" class="form-control" id="exampleInputPassword1">
                                        </div>
                                        <!-- New password -->
                                        <div class="col-md-6">
                                            <label for="exampleInputPassword2" class="form-label">New password *</label>
                                            <input type="password" class="form-control" id="exampleInputPassword2">
                                        </div>
                                        <!-- Confirm password -->
                                        <div class="col-md-12">
                                            <label for="exampleInputPassword3" class="form-label">Confirm Password *</label>
                                            <input type="password" class="form-control" id="exampleInputPassword3">
                                        </div>
                                        <div class="gap-3 d-md-flex justify-content-md-end text-center">
                                            <button type="button" class="btn btn-danger btn-lg"  >Delete profile</button>
                                            <button type="button" class="btn btn-primary btn-lg">Update profile</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- Row END -->
                        <!-- button -->
                        <div class="gap-3 d-md-flex justify-content-md-end text-center">
                            <button type="button" class="btn btn-danger btn-lg">Delete profile</button>
                            <button type="button" class="btn btn-primary btn-lg">Update profile</button>
                        </div>

                </div>
            </div>
        </div>
    </body>

</html>