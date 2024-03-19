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
        <title>Raito Shop | My Shipping</title>

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

            <h2>MY DELIVERIES</h2>



            <table id="saleProgramsTable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Order Date</th>
                        <th>Accepted Date</th>
                        <th>Address</th>
                        <th>Total money</th>
                        <th>Shipped date</th>
                        <th>Status</th>
                        <th>Note</th>
                        <th>Action</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${availableList}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.acceptedDate}</td>
                            <td>${order.address}</td>
                            <td>${order.totalMoney}</td>
                            <td>${order.shippedDate}</td>

                            <td>
                    <c:if test="${order.status==3}"><option value="3">Delivering </c:if>                                          
                        <c:if test="${order.status==4}">Delivered</c:if> 
                        <c:if test="${order.status==5}">Unable to deliver<</c:if> 
                        <c:if test="${order.status==6}">Cancelled</c:if> 


                            </td>
                        <td>${order.note}</td>
                    <td><c:if test="${order.status != 4}"><form id="shop" action="myship" method="POST">
                                <input type="hidden" value="${order.id}" name = "id">
                                <input type="hidden" value="sendback" name = "action">
                                <input value="Send Back" type="submit"   class="btn btn-secondary btn-sm" >

                            </form></c:if></td>
                        <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateModal${order.id}">
                                Update
                            </button>
                            <div class="modal fade" id="updateModal${order.id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel${order.id}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary text-white">
                                        <h5 class="modal-title" id="updateModalLabel${saleProgram.salePrgmId}">Update order status</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="myship" method="post">
                                            <input type="hidden" value="update" name = "action">
                                            <input type="hidden" value="${order.id}" name = "id">

                                            <input type="hidden" name="action" value="update">

                                            <div class="form-group" style="display: flex ">
                                                <label for="endDate">Order status:</label>
                                                <select name="status" >
                                                    <option value="3">Delivering</option>                                     
                                                    <option value="4">Delivered</option>
                                                    <option value="5">Unable to deliver</option>
                                                    <option value="6">Cancelled</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="endDate">Note:</label>
                                                <textarea name="note" value="">${order.note}</textarea>
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

        <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>

        <!-- jQuery -->
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
