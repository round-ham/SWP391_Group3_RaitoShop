<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Brand</title>
        <%@include file="head.jsp" %>

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

                    <h3 style="color: white">Manage Brand</h3>
                </div>
                <div class="col-lg-12 text-center text-lg-right mb-3">
                    <div class="d-inline-flex align-items-center">
                        <a href="addbrand">
                            <button class="btn btn-sm btn-primary">Add new Brand</button>
                        </a>
                    </div>
                </div>
                <table class="table table-bordered text-center mb-0 list">
                    <thead class="bg-secondary text-white list">
                        <tr>
                            <th>Brand Name</th>
                            <th>Description</th>                           
                            <th>Create Date</th>
                            <th>Last Update</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle " >
                        <c:forEach items="${listB}" var="o">
                            <tr class="item">
                                <td class="align-middle"> ${o.brandName}</td>
                                <td class="align-middle">${o.brandDescription}</td>
                                    <td class="align-middle">${o.createDate}</td>
                                <td class="align-middle">${o.lastUpdate}</td>
                                <td class="align-middle"><a href="update-brand?bId=${o.brandId}" ><button class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></button></a></td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
        
    </body>
</html>
