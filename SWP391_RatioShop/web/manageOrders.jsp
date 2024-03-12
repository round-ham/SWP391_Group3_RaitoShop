<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Order</title>
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
        <header style="margin-bottom: 5%; background: white">
            <%@include file="header.jsp" %>
        </header>
        <div class="container-co">

            <div class="form-container">
                <div class="form-heading">

                    <h3 style="color: white">Manage Orders</h3>
                </div>
                <form>Status:
                    <select id="status" onchange="filter()">
                        <option value="-1"> All</option>
                        <option value="1"> Wait for approving</option>
                        <option value="2"> Preparing</option>
                        <option value="3"> Delivering</option>
                        <option value="4"> Received</option>
                        <option value="5"> Success</option>
                        <option value="0"> Declined</option>
                    </select>
                    Sort By:
                    <select id="sort" onchange="filter()">
                        <option value="-1">Default</option>
                        <option value="1"> Old Order Date</option>
                        <option value="2"> New Order Date</option>
                        <option value="3"> Old Accepted Date</option>
                        <option value="4"> New Accepted Date</option>
                        <option value="5"> Old Shipped Date</option>
                        <option value="6"> New Shipped Date</option>
                    </select>
                </form>
                <table class="table table-bordered text-center mb-0 list">
                    <thead class="bg-secondary text-white list">
                        <tr>
                            <th>Order Id</th>
                            <th>Customer Name</th>
                            <th>Employee</th>
                            <th>Status</th>
                            <th>Order Date</th>
                            <th>Accepted Date</th>
                            <th>Shipped Date</th>
                            <th>Address</th>
                            <th>Total Money</th>
                            <th colspan="2">Action</th>

                        </tr>
                    </thead>
                    <tbody class="align-middle " id="orderList">
                        <c:forEach items="${listO}" var="o">
                            <tr class="item">
                                <td class="align-middle"> ${o.id}</td>
                                <td class="align-middle">${o.customer.fullName}</td>
                                <td class="align-middle">${o.employee.fullName}</td>

                                <td class="align-middle">
                                    <c:if test="${o.status eq 1}">Wait for approving</c:if>
                                    <c:if test="${o.status eq 2}">Preparing</c:if>
                                    <c:if test="${o.status eq 3}">Delivering</c:if>
                                    <c:if test="${o.status eq 4}">Successful Delivered</c:if>
                                    <c:if test="${o.status eq 5}">Success</c:if>
                                    <c:if test="${o.status eq 0}">Declined</c:if>
                                    </td>
                                    <td class="align-middle">${o.orderDate}</td>
                                <td class="align-middle">${o.acceptedDate}</td>
                                <td class="align-middle">${o.shippedDate}</td>
                                <td class="align-middle">${o.address}</td>
                                <fmt:formatNumber value="${o.totalMoney}" pattern="#.#############" var="formattedValue" />
                                <td class="align-middle">${formattedValue} VND</td>
                                <c:if test="${o.status < 4 }">
                                    <c:if test="${o.status != 0}">
                                        <td class="align-middle"><a href="update-status-order?orderId=${o.id}&status=${o.status +1}" ><button class="btn btn-sm btn-primary" style="background-color: green"><i class="fa fa-check"></i></button></a></td>
                                        <td class="align-middle"><a href="update-status-order?orderId=${o.id}&status=0" ><button class="btn btn-sm btn-primary" style="background-color: red"><i class="fa fa-remove"></i></button></a></td>
                                    </c:if>

                                </c:if>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
        <script>
            function filter() {
                var status = document.getElementById('status').value;
                var sort = document.getElementById('sort').value;

                $.ajax({
                    url: "/RatioShop/filter-order",
                    type: "get",
                    data: {
                        status: status,
                        sort: sort
                    },
                    success: function (data) {
                        var out = document.getElementById("orderList");
                        out.innerHTML = data;
                    },
                    error: function (xhr) {
                        //handle error
                    }
                });
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
</html>
