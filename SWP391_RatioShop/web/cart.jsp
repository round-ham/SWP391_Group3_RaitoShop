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

        <!-- Css Styles -->
        <%@include file="head.jsp" %>

    </head>
    <body>
        <div class="header__top">
            <div class="container">

            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="homepage"><img style="width: 100px;" src="pic/logo-clean.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="homepage">Home</a></li>
                            <li><a href="product">Shop</a>
                                <ul class="dropdown">
                                    <li><a href="product">All</a></li>
                                    <li><a href="product?sort=categoryId0-3">Best Seller</a></li>
                                    <li><a href="product?sort=categoryId0-2">Good Prices</a></li>                          
                                </ul>
                            </li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html">About Us</a></li>
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shopping-cart.html">Shopping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <c:if test="${sessionScope.account eq null}">
                            <a href="./login" style="color: black"><img style="width: 35px" src="pic/acc.png" alt=""> Login</a>
                            </c:if>
                            <c:if test="${sessionScope.account ne null}">
                            <a href="./logout" style="color: black"><img style="width: 35px" src="pic/acc.png" alt=""> Logout</a>
                            </c:if>
                        <a href="${sessionScope.account eq null ? 'login' : 'cart.jsp'}"><img src="img/icon/cart.png" alt=""> <span id="numberCart">${numberOfCart}</span></a>
                        <div class="price">Cart</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
        <div class="loader" id="loader">
            <p style="margin: auto" id="popup">
                Check-out successfully! Please check your order for confirmming!<br>
                <button id="confirm-btn" type="button" style="margin-top: 30px" onclick="turnOff()">
                    OK
                </button>
            </p>

        </div>
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

                                        <c:if test="${numberOfCart eq 0}">
                                            <div class="row  justify-content-between" id="commit">
                                                <div class="col-auto col-md-9">
                                                    No product added! <a href="product">Back to shopping</a>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${numberOfCart ne 0}">
                                            <c:set var="total" value="0"/>
                                            <c:forEach items="${cart.items}" var="item">
                                                <c:set var="total" value="${total + item.price * item.quantity}"/>
                                                <div class="row d-flex justify-content-between" id="cart">
                                                    <div class="col-auto col-md-6">
                                                        <div class="media flex-column flex-sm-row">
                                                            <img class=" img-fluid" src="${item.product.product.productImage}" width="62" height="62">
                                                            <div class="media-body  my-auto">
                                                                <div class="row ">
                                                                    <div class="col-auto"><p class="mb-0"><b>${item.product.product.productName}</b></p></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> 
                                                        <input style="width: 30px; padding: 0;" type="text" name="quantity" value="${item.quantity}" oninput="change(${item.product.product.productId},${item.product.size.sizeId},${item.product.color.colorId}, this.value)">
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> 
                                                        <h6>${item.product.color.color} ${item.product.size.size}</h6>
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto "><b>${String.format("%,.0f",item.price*1.0)}</b></div>
                                                    <div class=" pl-0 flex-sm-col col-auto  my-auto"> 
                                                        <i style="color: red; cursor: pointer; padding: 5px 10px;" id="trash" onclick="remove(${item.product.product.productId},${item.product.size.sizeId},${item.product.color.colorId})" class='bx bx-trash'></i>

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
                                            <div class="col-md-7 col-lg-6 mx-auto"><button onclick="checkOut()" style="padding: 10px; font-size: 1rem" type="button" class="btn btn-block btn-outline-primary btn-lg">SUBMIT PAYMENT</button></div>

                                        </div>

                                        <script>
                                            function checkOut() {
                                            <c:if test="${sessionScope.account ne null}">
                                                var address = document.getElementById('address').value;
                                                console.log(address);
                                                
                                                $.ajax({
                                                    url: "/RatioShop/checkout",
                                                    type: "post",
                                                    data: {
                                                        address: address
                                                    },
                                                    success: function (data) {
                                                        console.log(data);
                                                        eraseCookie('cart');
                                                        setCookie('cart', data, 2);
                                                        alert('check out success!');
                                                        location.reload();
                                                    },
                                                    error: function (xhr) {
                                                        //handle error
                                                    }
                                                });
                                            </c:if>
                                            <c:if test="${sessionScope.account eq null}">

                                                alert('Please login to Checkout cart!');
                                            </c:if>
                                            }
                                            function remove(pId, sizeId, colorId) {
                                                console.log('get event');
                                                $.ajax({
                                                    url: "/RatioShop/process",
                                                    type: "post",
                                                    data: {
                                                        pId: pId,
                                                        sizeId: sizeId,
                                                        colorId: colorId
                                                    },
                                                    success: function (data) {
                                                        console.log(data);
                                                        eraseCookie('cart');
                                                        setCookie('cart', data, 2);
                                                        location.reload();
                                                    },
                                                    error: function (xhr) {
                                                        //handle error
                                                    }
                                                });


                                            }

                                            function change(pId, sizeId, colorId, quantity) {
                                                console.log('get event');
                                                $.ajax({
                                                    url: "/RatioShop/process",
                                                    type: "get",
                                                    data: {
                                                        pId: pId,
                                                        sizeId: sizeId,
                                                        colorId: colorId,
                                                        num: quantity
                                                    },
                                                    success: function (data) {
                                                        console.log(data);
                                                        eraseCookie('cart');
                                                        setCookie('cart', data, 2);
                                                        location.reload();
                                                    },
                                                    error: function (xhr) {
                                                        //handle error
                                                    }
                                                });
                                            }
                                            function setCookie(name, value, days) {
                                                var expires = "";
                                                if (days) {
                                                    var date = new Date();
                                                    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                                                    expires = "; expires=" + date.toUTCString();
                                                }
                                                document.cookie = name + "=" + (value || "") + expires + "; path=/";
                                            }
                                            function getCookie(name) {
                                                var nameEQ = name + "=";
                                                var ca = document.cookie.split(';');
                                                for (var i = 0; i < ca.length; i++) {
                                                    var c = ca[i];
                                                    while (c.charAt(0) == ' ')
                                                        c = c.substring(1, c.length);
                                                    if (c.indexOf(nameEQ) == 0)
                                                        return c.substring(nameEQ.length, c.length);
                                                }
                                                return null;
                                            }
                                            function eraseCookie(name) {
                                                document.cookie = name + '=; Max-Age=-99999999;';
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
        <jsp:include page="footer.jsp"/>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
</html>