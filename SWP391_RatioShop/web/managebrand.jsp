<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Brand</title>
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

            .alert-container {
                margin-bottom: 15px;
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
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBrandModal">
                            Add Brand
                        </button>
                    </div>
                </div>
                <div class="alert-container">
                    <c:if test="${param.success ne null}">
                        <div class="alert alert-success" role="alert">
                            Success!
                        </div>
                    </c:if>
                    <c:if test="${param.fail ne null}">
                        <div class="alert alert-danger" role="alert">
                            Failed!
                        </div>
                    </c:if>
                </div>
                <table id="brandTable" class="table table-bordered text-center mb-0 list">
                    <thead class="bg-secondary text-white list">
                        <tr>
                            <th>Brand Name</th>
                            <th>Description</th>                           
                            <th>Create Date</th>
                            <th>Last Update</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle" >
                        <c:forEach items="${listB}" var="o">
                            <tr class="item">
                                <td class="align-middle">${o.brandName}</td>
                                <td class="align-middle">${o.brandDescription}</td>
                                <td class="align-middle">${o.createDate}</td>
                                <td class="align-middle">${o.lastUpdate}</td>
                                <td class="align-middle">
                                    <button type="button" data-toggle="modal" data-target="#updateBrandModal${o.brandId}" class="btn btn-sm btn-primary">
                                        <i class="fa fa-edit"></i>
                                    </button>
                                </td>


                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <footer style="margin-top: 25%; background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
        <c:forEach items="${listB}" var="o">
            <!-- Update Modal -->
            <div class="modal fade" id="updateBrandModal${o.brandId}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel${o.brandId}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="updateModalLabel${o.brandId}">Update Brand</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="manage-brand" method="post" class="update-brand-form">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="brandId" value="${o.brandId}">
                                <div class="form-group">
                                    <label for="brandName">Brand Name</label>
                                    <input type="text" class="form-control" id="brname" name="brandName" value="${o.brandName}" placeholder="Type Brand Name here.... ">
                                </div>
                                <div class="form-group">
                                    <label for="brandDescription">Brand Description</label>
                                    <input type="text" class="form-control" id="brDescription" name="brandDescription" value="${o.brandDescription}"placeholder="Type Brand Description here.... ">
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Add Brand Modal -->
        <div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="addModalLabel">Add Brand</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="manage-brand" method="post">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="brandName">Brand Name</label>
                                <input type="text" class="form-control" id="brname" name="brandName" placeholder="Type Brand Name here.... ">
                            </div>
                            <div class="form-group">
                                <label for="brandDescription">Brand Description</label>
                                <input type="text" class="form-control" id="brdescription" name="brandDescription" placeholder="Type Brand Description here.... ">
                            </div>
                            <button type="submit" class="btn btn-primary">Add</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $(document).ready(function () {
                // Function to check if the brand name field is empty or already exists before form submission
                $('#addBrandModal form').submit(function (event) {
                    var brandName = $('#addBrandModal input[name="brandName"]').val().trim();
                    if (brandName === "") {
                        // Prevent form submission
                        event.preventDefault();
                        // Show an alert to the user
                        alert("Please enter the brand name.");
                    } else {
                        // Check if the brand name already exists in the table
                        var existingBrands = [];
                        $('#brandTable tbody tr').each(function () {
                            existingBrands.push($(this).find('td:first').text().trim());
                        });
                        if (existingBrands.includes(brandName)) {
                            // Prevent form submission
                            event.preventDefault();
                            // Show an alert to the user
                            alert("Brand name already exists. Please enter a different brand name.");
                        }
                    }
                });
                $('.update-brand-form').submit(function (event) {
                    var brandName = $(this).find('input[name="brandName"]').val().trim();
                    if (brandName === "") {
                        // Prevent form submission
                        event.preventDefault();
                        // Show an alert to the user
                        alert("Please enter the brand name.");
                    } else {
                        // Check if the brand name already exists in the table
                        var existingBrands = [];
                        $('#brandTable tbody tr').each(function () {
                            existingBrands.push($(this).find('td:first').text().trim());
                        });
                        if (existingBrands.includes(brandName)) {
                            // Prevent form submission
                            event.preventDefault();
                            // Show an alert to the user
                            alert("Brand name already exists. Please enter a different brand name.");
                        }
                    }
                });

                $('#brandTable').DataTable({
                    "pageLength": 10, // Set the number of entries per page to 5
                    "lengthChange": false // Hide the "Show [number] entries" dropdown
                });
            });


        </script>


    </body>
</html>
