<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Category</title>
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
                height: 50vh;
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

                    <h3 style="color: white">Manage Category</h3>
                </div>
                <div class="col-lg-12 text-center text-lg-right mb-3">
                    <div class="d-inline-flex align-items-center">
                        <button type="button" data-toggle="modal" data-target="#addCategoryModal" class="btn btn-sm btn-primary">Add New Category</button>
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

                <table id="categoryTable" class="table table-bordered text-center mb-0 list">
                    <thead class="bg-secondary text-white list">
                        <tr>
                            <th>Category Description</th>                           
                            <th>Create Date</th>
                            <th>Last Update</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle " >
                        <c:forEach items="${listC}" var="o">
                            <tr class="item">
                                <td class="align-middle">${o.categoryDescription}</td>
                                <td class="align-middle">${o.createDate}</td>
                                <td class="align-middle">${o.lastUpdate}</td>
                                <td class="align-middle"><button type="button" data-toggle="modal" data-target="#updateCategoryModal${o.categoryId}" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></button></td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <c:forEach items="${listC}" var="o">
            <!-- Update Modal -->
            <div class="modal fade" id="updateCategoryModal${o.categoryId}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel${o.categoryId}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="updateModalLabel${o.categoryId}">Update Category</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="manage-category" method="post" class="update-category-form">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="categoryId" value="${o.categoryId}">

                                <div class="form-group">
                                    <label for="categoryDescription">Category Description</label>
                                    <input type="text" class="form-control" id="brdescription" name="categoryDescription" value="${o.categoryDescription}" placeholder="Type Category Description here.... " >
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
        <!-- Add Category Modal -->
        <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="addModalLabel">Add Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="manage-category" method="post">
                            <input type="hidden" name="action" value="add">

                            <div class="form-group">
                                <label for="categoryDescription">Category Description</label>
                                <input type="text" class="form-control" id="brdescription" name="categoryDescription" placeholder="Type Category Description here.... ">
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
                $('#addCategoryModal form').submit(function (event) {
                    var categoryDescription = $('#addCategoryModal input[name="categoryDescription"]').val().trim();
                    if (categoryDescription === "") {
                        // Prevent form submission
                        event.preventDefault();
                        // Show an alert to the user
                        alert("Please enter the category descrption.");
                    } else {
                        // Check if the brand name already exists in the table
                        var existingCategories = [];
                        $('#categoryTable tbody tr').each(function () {
                            existingCategories.push($(this).find('td:first').text().trim());
                        });
                        if (existingCategories.includes(categoryDescription)) {
                            // Prevent form submission
                            event.preventDefault();
                            // Show an alert to the user
                            alert("Category name already exists. Please enter a different brand name.");
                        }
                    }
                });
                $('.update-category-form').submit(function (event) {
                    var categoryDescription = $(this).find('input[name="categoryDescription"]').val().trim();
                    if (categoryDescription === "") {
                        // Prevent form submission
                        event.preventDefault();
                        // Show an alert to the user
                        alert("Please enter the category description.");
                    } else {
                        // Check if the brand name already exists in the table
                        var existingCategories = [];
                        $('#categoryTable tbody tr').each(function () {
                            existingCategories.push($(this).find('td:first').text().trim());
                        });
                        if (existingCategories.includes(categoryDescription)) {
                            // Prevent form submission
                            event.preventDefault();
                            // Show an alert to the user
                            alert("Category description already exists. Please enter a different category description.");
                        }
                    }

                });
              
                // Paging
                $('#categoryTable').DataTable({
                    "pageLength": 10, // Set the number of entries per page to 5
                    "lengthChange": false // Hide the "Show [number] entries" dropdown
                });
            }
            );


        </script>


    </body>
</html>
