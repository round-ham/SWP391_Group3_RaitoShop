<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Brand</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f3f3f3;
                margin: 0;
                padding: 0;
            }

            .container-co {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form-container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                width: 70%;
            }

            .form-heading {
                background-color: #007bff;
                color: #fff;
                border-radius: 10px 10px 0 0;
                padding: 20px;
                text-align: center;
                font-size: 24px;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-control {
                border-radius: 5px;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                width: 100%;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <header style="margin-bottom: 15%; background: white">
            <%@include file="header.jsp" %>
        </header>
        <div class="container-co">

            <div class="form-container">
                <div class="form-heading">

                    <h3 style="color: white">Add New Brand</h3>
                </div>
                <form action="addbrand" method="post" class="form-horizontal" role="form">
                    <h3 style="color: red; font-style: italic">${param.add==0?'Add brand failed!':''}</h3>
                    <h3 style="color: #66ff33; font-style: italic">${param.add==1?'Add brand succesful!':''}</h3>
                    <div class="form-group">
                        <label for="name">Brand Name</label>
                    <div>
                        <input type="text" class="form-control" name="brandName" id="brname" placeholder="Type brand name in here.....">
                        <span id="errorMessage" style="color: red;"></span>
                    </div>
                    </div>
                    <div class="form-group">
                        <label for="brandDescription">Brand Description</label>
                        <div>
                            <textarea name="brandDescription"  style="min-height: 120px" class="form-control" placeholder="Type brand description here...."></textarea>
                        </div>
                    </div>
<!--                    <div class="form-group">
                        <label for="createDate">Create Date</label>
                        <div>
                            <input type="date" class="form-control" name="createDate" id="crdate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastUpdate">Last Update</label>
                        <div>
                            <input type="date" class="form-control" name="lastUpdate" id="lupdate">
                        </div>
                    </div>-->
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                    <div class="form-group">
                            <a href="manage-brand" class="btn btn-primary">Cancel</a>
                    </div>  
                </form>
            </div>
        </div>
        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
       <script>
        document.getElementById('brname').addEventListener('blur', function() {
        var input = document.getElementById('brname').value;
        var errorMessage = document.getElementById('errorMessage');
        
        if (input.trim() === '') {
            errorMessage.textContent = 'Please enter a brand name.';   
        }
        for
        else {
            errorMessage.textContent = '';
        }
    });
    </script>
    </body>
</html>
