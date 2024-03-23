<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="pic/logo.png">
    <title>Raito Shop | Sales</title>

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

        <h2>ADD SALE PRODUCTS ${saleProgram.title} PROGRAM</h2>

        <br>
        <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addModal">
            CHOOSE A PRODUCT TO SALE
        </button>

        <table id="salesTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product</th>
                    <th>Sale Program</th>
                    <th>Sale Percentage</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sale" items="${sales}">
                    <tr>
                        <td>${sale.saleId}</td>
                        <td>${sale.product.productName}</td>
                        <td>${saleProgram.title}</td>
                        <td>${sale.salePrcnt} %</td>
                        <td>
                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateModal${sale.saleId}">
                                Update
                            </button>
                            <br>
                            <form class="mt-2" action="sales" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="salePrgmId" value="${id}">
                                <input type="hidden" name="saleId" value="${sale.saleId}">
                                <button class="btn btn-danger btn-sm">Delete</button>
                            </form>

                            <!-- Update Modal -->
                            <div class="modal fade" id="updateModal${sale.saleId}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel${sale.saleId}" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header bg-primary text-white">
                                            <h5 class="modal-title" id="updateModalLabel${sale.saleId}">Update Sale</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="sales" method="post">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="saleId" value="${sale.saleId}">
                                                <div class="form-group">
                                                    <label for="productId">Product:</label>
                                                    <select class="form-control" id="productId" name="productId">
                                                        <c:forEach var="product" items="${products}">
                                                            <option value="${product.productId}" ${product.productId+"" eq sale.productId ? 'selected' : ''}>${product.productName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <input type="hidden" id="salePrgmId" name="salePrgmId" value="${id}">
                                                <div class="form-group">
                                                    <label for="salePrcnt">Sale Percentage:</label>
                                                    <input min="1" max="100" type="number" class="form-control" id="salePrcnt" name="salePrcnt" value="${sale.salePrcnt}">
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

    <!-- Add Sale Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addModalLabel">Add Sale</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="sales" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="form-group">
                            <label for="productId">Product:</label>
                            <select class="form-control" id="productId" name="productId">
                                <c:forEach var="product" items="${products}">
                                    <option value="${product.productId}">${product.productName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="hidden" id="salePrgmId" name="salePrgmId" value="${id}">
                        <div class="form-group">
                            <label for="salePWrcnt">Sale Percentage:</label>
                            <input min="1" max="100" type="number" class="form-control" id="salePrcnt" name="salePrcnt">
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
            $('#salesTable').DataTable({
                "pageLength": 5, // Set the number of entries per page to 5
                "lengthChange": false // Hide the "Show [number] entries" dropdown
            });
        });
    </script>

</body>
</html>
