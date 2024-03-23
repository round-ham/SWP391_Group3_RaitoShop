<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" type="image/x-icon" href="pic/logo.png">
        <title>Raito Shop | Sale Programs</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap4.min.css">
    </head>
    <body>
        <header class="header" style= "box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
            <%@include file="header.jsp" %>
        </header>
       

        <div class="container mt-4">

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

            <h2>SALE PROGRAM</h2>

            <button type="button" class="btn btn-primary mb-3 mt-5" data-toggle="modal" data-target="#addModal">
                CREATE A NEW SALE PROGRAM
            </button>

            <table id="saleProgramsTable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="saleProgram" items="${salePrograms}">
                        <tr>
                            <td>${saleProgram.salePrgmId}</td>
                            <td>${saleProgram.title}</td>
                            <td>${saleProgram.startDate}</td>
                            <td>${saleProgram.endDate==null?"No info":saleProgram.endDate}</td>
                            <td style="color: ${saleProgram.status == 'Ended' ? 'red' : saleProgram.status == 'Active' ? 'green' : 'black'}">
                                ${saleProgram.status}
                            </td>
                            <td>
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateModal${saleProgram.salePrgmId}">
                                    Update
                                </button>
                                <a class="btn btn-secondary btn-sm" href="sales?id=${saleProgram.salePrgmId}">Edit Product</a>
                                <form class="mt-2" action="salePrograms" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="salePrgmId" value="${saleProgram.salePrgmId}">
                                    <button class="btn btn-danger btn-sm">Delete</button>
                                </form>

                                <!-- Update Modal -->
                                <div class="modal fade" id="updateModal${saleProgram.salePrgmId}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel${saleProgram.salePrgmId}" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header bg-primary text-white">
                                                <h5 class="modal-title" id="updateModalLabel${saleProgram.salePrgmId}">Update Sale Program</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="salePrograms" method="post">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="salePrgmId" value="${saleProgram.salePrgmId}">
                                                    <div class="form-group">
                                                        <label for="title">Title:</label>
                                                        <input type="text" class="form-control" id="title" name="title" value="${saleProgram.title}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="startDate">Start Date:</label>
                                                        <input type="date" class="form-control" id="startDate" name="startDate" value="${saleProgram.startDate}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="endDate">End Date:</label>
                                                        <input type="date" class="form-control" id="endDate" name="endDate" value="${saleProgram.endDate}">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Add Sale Program Modal -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="addModalLabel">Add Sale Program</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="salePrograms" method="post">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="title">Title:</label>
                                <input type="text" class="form-control" id="title" name="title">
                            </div>
                            <div class="form-group">
                                <label for="startDate">Start Date:</label>
                                <input type="date" class="form-control" id="startDate" name="startDate">
                            </div>
                            <div class="form-group">
                                <label for="endDate">End Date:</label>
                                <input type="date" class="form-control" id="endDate" name="endDate">
                            </div>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>
        
       

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#saleProgramsTable').DataTable({
                    "pageLength": 5, // Set the number of entries per page to 5
                    "lengthChange": false // Hide the "Show [number] entries" dropdown
                });
            });
        </script>

    </body>
</html>
