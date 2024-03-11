<%-- 
    Document   : cart
    Created on : Nov 1, 2023, 7:51:15 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .loader {
                position: fixed;
                top: 0;
                bottom: 0;
                right: 0;
                left: 0;
                background-color: rgba(0,0,0,.65);
                backdrop-filter: blur(5px);
                justify-content: center;
                align-items: center;
                text-align: center;
                display: none;
                z-index: 2;
            }


            .container-fluid {
                z-index: 1
            }
            #popup {
                background-color: white;
                padding: 45px;
            }

            #confirm-btn {
                padding: 10px 30px;
                cursor: pointer;
                background-color: black;
                color: white
            }

            #confirm-btn:hover {
                background-color: #333
            }

            .dropdown-menu {
                left: 82%;
            }

            #trash:hover {
                background-color: #ddd;

                border-radius: 50%
            }
        </style>
        <%@include file="head.jsp" %>
    </head>
    <body>
        <div class="loader" id="loader">
            <p style="margin: auto" id="popup">
                Check-out successfully! Please check your order for confirmming!<br>
                <button id="confirm-btn" type="button" style="margin-top: 30px" onclick="turnOff()">
                    OK
                </button>
            </p>
        </div>
        <!-- Header Section Begin -->
        <header class="header">
            <%@include file="header.jsp" %>
        </header>
        <!-- Header Section End -->

        <div class=" container-fluid my-5 ">
            <div class="row justify-content-center ">
                <div class="col-xl-10">
                    <div class="card shadow-lg ">
                        <div class="row  mx-auto justify-content-center text-center">
                            <div class="col-12 mt-3 ">
                                <nav aria-label="breadcrumb" class="second ">
                                    <ol class="breadcrumb indigo lighten-6 first  " >
                                        <li class="breadcrumb-item font-weight-bold "><a style="color: black" class="black-text text-uppercase " href="product"><span class="mr-md-3 mr-1">BACK TO SHOP</span>\</li>
                                        <li class="breadcrumb-item font-weight-bold"><a style="color: black" class="black-text text-uppercase"><span class="mr-md-3 mr-1">SHOPPING BAG</span>\</li>
                                        <li class="breadcrumb-item font-weight-bold"><a style="color: black" class="black-text text-uppercase active-2"><span class="mr-md-3 mr-1">CHECKOUT</span></a></li>
                                    </ol>
                                </nav>
                            </div>
                        </div>

                        <div class="row justify-content-around">
                            <div class="col-md-3">
                                <div class="card border-0">
                                    <div class="card-header pb-0">
                                        <h2 class="card-title space ">Checkout</h2>
                                        <p class="card-text text-muted mt-4  space">SHIPPING DETAILS</p>
                                        <hr class="my-0">
                                        <div class="form-group">
                                            <label for="NAME" class="small text-muted mb-1">Address</label>
                                            <input type="text" class="form-control form-control-sm" name="address" id="address" aria-describedby="helpId" required placeholder="eg. 26 Son la chao ae nhe">
                                            <div id="err" style="display: none; color: red">You must fill address first</div>

                                        </div>
                                    </div>
                                    <div class="card-body">


                                        <div class="row mt-4">
                                            <div class="col"><p class="text-muted mb-2">PAYMENT DETAILS</p><hr class="mt-0"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="NAME" class="small text-muted mb-1">NAME ON CARD</label>
                                            <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder="NGUYEN VAN A">
                                        </div>
                                        <div class="form-group">
                                            <label for="NAME" class="small text-muted mb-1">CARD NUMBER</label>
                                            <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder="4534 5555 5555 5555">
                                        </div>
                                        <div class="row no-gutters">
                                            <div class="col-sm-6 pr-sm-2">
                                                <div class="form-group">
                                                    <label for="NAME" class="small text-muted mb-1">VALID THROUGH</label>
                                                    <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder="06/21">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="NAME" class="small text-muted mb-1">CVC CODE</label>
                                                    <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder="183">
                                                </div>
                                            </div>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="card border-0 ">
                                    <div class="card-header card-2" style="margin-bottom: 10px">
                                        <p class="card-text text-muted mt-md-4  mb-2 space" >YOUR ORDER </p>
                                        <hr class="my-2">
                                    </div>
                                    <div class="card-body pt-0">

                                        <c:if test="${sessionScope.listCartProduct.size() eq 0}">
                                            <div class="row  justify-content-between" id="commit">
                                                <div class="col-auto col-md-9">
                                                    No product added! <a href="product">Back to shopping</a>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.listCartProduct.size() ne 0}">
                                            <c:set var="total" value="0"/>
                                            <c:forEach items="${sessionScope.listCartProduct}" var="product">
                                                <c:set var="total" value="${total + product.unitPrice * product.totalQuantity}"/>
                                                <div class="row d-flex justify-content-between" id="cart">
                                                    <div class="col-auto col-md-6">
                                                        <div class="media flex-column flex-sm-row">
                                                            <img class=" img-fluid" src="${product.productImage}" width="62" height="62">
                                                            <div class="media-body  my-auto">
                                                                <div class="row ">
                                                                    <div class="col-auto"><p class="mb-0"><b>${product.productName}</b></p></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> 
                                                        <input style="width: 30px; padding: 0;" type="text" name="quantity" value="${product.totalQuantity}" oninput="change(${product.productId}, this.value)">
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> 
                                                        <select id="color">
                                                            <c:forEach items="${product.getListProductColor()}" var="cl">
                                                                <option value="${cl.colorId}">${cl.color}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <select id="id">
                                                            <c:forEach items="${product.getListProductSize()}" var="s">
                                                                <option value="${s.sizeId}">${s.size}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto "><b>${String.format("%,.0f",product.unitPrice*1.0)}</b></div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> 
                                                        <i style="color: red; cursor: pointer; padding: 5px 10px;" id="trash" onclick="remove(${product.productId})" class='bx bx-trash'></i>
                                                    </div>
                                                </div>
                                                <hr class="my-2">
                                            </c:forEach>
                                        </c:if>

                                        <div class="row ">
                                            <div class="col col-12">
                                                <div class="row justify-content-between">
                                                    <div class="col-4"><p ><b>Total</b></p></div>
                                                    <div id="total" class="flex-sm-col col-auto"><p  class="mb-1"><b>${String.format("%,.0f",total *1.0)} VND</b></p> </div>
                                                </div><hr class="my-0">
                                            </div>
                                        </div>
                                        <div class="row mb-5 mt-4 ">
                                            <div class="col-md-7 col-lg-6 mx-auto"><button style="padding: 10px; font-size: 1rem" type="button" class="btn btn-block btn-outline-primary btn-lg">SUBMIT PAYMENT</button></div>
                                        </div>

                                        <script>
                                            function remove(id) {
                                                fetch(`./removecart?pid=` + id, {
                                                    method: 'GET'
                                                });
                                                location.reload();
                                            }

                                            function change(id, quantity) {
                                                fetch(`./removecart?pid=` + id + `&quantity=` + quantity, {
                                                    method: 'POST'
                                                });
                                                location.reload();
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                                
         <!-- Footer Section Begin -->
         <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
</html>