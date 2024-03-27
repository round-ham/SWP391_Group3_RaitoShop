<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Blog</title>
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
                width: 90%;
                margin-top: 450%;
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
        <header style="margin-bottom: 22%; background: white">
            <%@include file="../header.jsp" %>
        </header>
        <div class="container-co"> 

            <div class="form-container">
                <div class="form-heading">

                    <h3 style="color: white">Manage Blog</h3>
                </div>
                <div class="col-lg-12 text-center text-lg-right mb-3">
                    <span style="color: red">${success}</span>
                    <div class="d-inline-flex align-items-center">
                        <a href="add-blog">
                            <button class="btn btn-sm btn-primary">Add blog</button>
                        </a>
                    </div>
                </div>
                <table class="table table-bordered text-center mb-0 list">
                    <thead class="bg-secondary text-white list">
                        <tr>
                            <th>Blog Title</th>
                            <th>Blog Content</th>
                            <th>Image</th>
                            <th>CreateDate</th>
                            <th>LastUpdate</th>
                            <th>EmployeeName</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle " >
                         <c:forEach items="${list}" var="b">
                            <tr class="item">
                                <td class="align-middle"> ${b.getTitle()}</td>
                                <td class="align-middle">${b.getBlogContent()}</td>
                                <td class="align-middle">
                                    <img src="img/blog/${b.getBlogImage()}" alt="" style="max-width: 200px;">
                                </td>
                                <td class="align-middle">${b.getCreateDate()}</td>
                                <td class="align-middle">${b.getLastUpdate()}</td>
                                <td class="align-middle">${b.getEmployeeFullName()}</td>
                                <td class="align-middle"><a href="update-blog?id=${b.getBlogID()}" ><button class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></button></a>
                                <a href="delete-blog?id=${b.getBlogID()}"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button></a></td>
                       
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
