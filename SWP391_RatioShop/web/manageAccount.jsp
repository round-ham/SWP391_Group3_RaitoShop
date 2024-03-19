<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Account</title>
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
            .status-active {
                color: green;
            }

            .status-banned {
                color: red;
            }
            /* Custom button styles */
            .btn-ban {
                background-color: red;
                border-color: red;
                color: white;
            }

            .btn-unban {
                background-color: green;
                border-color: green;
                color: white;
            }
            .search-input {
                border: 1px solid #ced4da; 
                border-radius: 5px; 
                padding: 8px 12px; 
                width: 100%; 
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; 
            }

            .search-input:hover {
                border-color: #6c757d; 
            }

            .search-input:focus {
                border-color: #007bff; 
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); 
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

                    <h3 style="color: white">Manage Account</h3>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control search-input" id="searchInput" placeholder="Search by name or email">
                </div>

<!--                <div class="col-lg-12 text-center text-lg-right mb-3">
                    <div class="d-inline-flex align-items-center">
                        <button type="button" data-toggle="modal" data-target="#addAccountModal" class="btn btn-sm btn-primary">Add Account</button>
                    </div>
                </div>-->
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
                <div class="table-responsive" style="max-height: 800px; overflow-y: auto;">
                    <table id="accountTable" class="table table-bordered text-center mb-0 list">
                        <thead class="bg-secondary text-white list">
                            <tr>
                                <th>Image</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Gender</th>
                                <th>Address</th>
                                <th>Last Login</th>
                                <th>Create Date</th>
                                <th>Role</th>

                                <!--                                <th>Status</th>-->
                                <th></th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:forEach items="${listA}" var="o">
                                <tr class="item">
                                    <td class="align-middle">
                                        <img src="${o.userImage}" alt="" style="width: 50px;">
                                    </td>
                                    <td class="align-middle">${o.fullName}</td>
                                    <td class="align-middle">${o.email}</td>
                                    <td class="align-middle">${o.phone}</td>


                                    <td class="align-middle">
                                        <c:if test="${o.gender eq true}">Male</c:if>
                                        <c:if test="${o.gender eq false}">Female</c:if>
                                        </td>
                                        <td class="align-middle">${o.address}</td>
                                    <td class="align-middle">${o.lastLogin}</td>
                                    <td class="align-middle">${o.createDate}</td>
                                    <td class="align-middle">
                                        <form action="manage-account" method="post">
                                            <input type="hidden" name="action" value="update-role">
                                            <input type="hidden" name="accountId" value="${o.accountId}">
                                            <select class="form-control" name="roleId">
                                                <c:forEach items="${roles}" var="role">
                                                    <option value="${role.roleId}" <c:if test="${role.roleId eq o.role.roleId}">selected</c:if>>${role.roleName}</option>
                                                </c:forEach>
                                            </select>
                                            <button type="submit" class="btn btn-sm btn-primary">Update Role</button>
                                        </form>
                                    </td><!--                                <td class="align-middle">
                                    <c:if test="${o.status eq 1}">Active</c:if>
                                    <c:if test="${o.status eq 0}">Banned</c:if>
                                    </td>-->

                                        <td class="align-middle">
                                        <c:choose>
                                            <c:when test="${o.status eq 1}">
                                                <form action="manage-account" method="post">
                                                    <input type="hidden" name="action" value="ban">
                                                    <input type="hidden" name="accountId" value="${o.accountId}">
                                                    <input type="hidden" name="status" value="0">
                                                    <button type="submit" class="btn btn-sm btn-ban">Ban</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <form action="manage-account" method="post">
                                                    <input type="hidden" name="action" value="unban">
                                                    <input type="hidden" name="accountId" value="${o.accountId}">
                                                    <input type="hidden" name="status" value="1">
                                                    <button type="submit" class="btn btn-sm btn-unban">Unban</button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="align-middle">
                                        <form action="manage-account" method="post">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="accountId" value="${o.accountId}">
                                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this account?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
        <c:forEach items="${listA}" var="o">
            <!-- Add Account Modal -->
            <div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog" aria-labelledby="addAccountModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addAccountModalLabel">Add Account</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="addAccountForm" action="manage-account" method="post">
                                <input type="hidden" name="action" value="add">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="number" class="form-control" id="phone" name="phone">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <c:choose>
                                            <c:when test="${o.gender}">
                                                <option value="male" selected>Male</option>
                                                <option value="female">Female</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="male">Male</option>
                                                <option value="female" selected>Female</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>

                                </div>
                                <div class="form-group">
                                    <label for="role">Role</label>
                                    <select class="form-control" id="role" name="role">
                                        <c:forEach items="${roles}" var="role">
                                            <option value="${role.roleId}">${role.roleName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>



        <!--        jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!--        Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       <script>
    var searchInput = document.getElementById("searchInput");
    var table = document.getElementById("accountTable");

    searchInput.addEventListener("keyup", function() {
        var searchText = searchInput.value.toLowerCase();

        var rows = table.getElementsByTagName("tr");
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];

            if (i === 0) {
                continue;
            }

            var columns = row.getElementsByTagName("td");
            var found = false;

            for (var j = 0; j < columns.length; j++) {
                var column = columns[j];

                if (column.innerHTML.toLowerCase().indexOf(searchText) > -1) {
                    found = true;
                    break;
                }
            }

            if (found) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        }
    });
</script>


    </body>
</html>
