<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header__top">
    <div class="container">
    </div>
</div>
<div class="container">
    <div class="row align-items-center">
        <div class="col-lg-2 col-md-2">
            <div class="header__logo">
                <a href="homepage"><img style="width: 100px;" src="pic/logo-clean.png" alt=""></a>
            </div>
        </div>
        <div class="col-lg-7 col-md-7">
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
                    
                    <li>
                        <a href="blog">Blog</a>
                        <!-- Marketing Staff Role -->
                    <c:if test="${sessionScope.account != null && sessionScope.account.getRoleName() == 'marketing staff'}">
                        <ul class="dropdown">
                            <li><a href="manageblog">Manage Blog</a></li>
                   
                        </ul>
                        <li><a href="feedback-manage">Manage Feedback</a>  </li>
                    </c:if>
                  
                    <!-- SELLER -->
                    <c:if test="${sessionScope.account != null && sessionScope.account.getRoleName() == 'seller'}">
                        <li>
                            <a href="#">Seller Management</a>
                            <ul class="dropdown">
                                <li><a href="manage-products">Manage Product</a></li>
                                <li><a href="manage-category">Manage Category</a></li>
                                <li><a href="manage-brand">Manage Brand</a></li>
                                <li><a href="salePrograms">Manage Sale Program</a></li>
                                <li><a href="manage-orders">Manage Order</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <!-- ADMIN -->
                    <c:if test="${sessionScope.account != null && sessionScope.account.getRoleName() == 'admin'}">
                        <li>
                            <a href="#">Admin Management</a>
                            <ul class="dropdown">
                                <li><a href="manage-account">Manage Account</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <!-- Shipper -->
                    <c:if test="${sessionScope.account != null && sessionScope.account.getRoleName() == 'shipper'}">
                        <li>
                            <a href="#">Delivery Management</a>
                            <ul class="dropdown">
                                <li><a href="shiplist">Delivery List</a></li>
                                <li><a href="myship">My Deliveries</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <div class="col-lg-3 col-md-3">
            <div class="header__nav__option">
                <c:if test="${sessionScope.account eq null}">
                    <a href="./login" style="color: black"><img style="width: 35px" src="pic/acc.png" alt=""> Login</a>
                </c:if>
                <c:if test="${sessionScope.account ne null}">
                    <a href="profile" class="mr-0" style="color: black">
                        <img style="width: 35px" src="pic/acc.png" alt="">
                        Hello ${sessionScope.account.getFullName()}
                    </a>
                    |
                    <a href="./logout" style="color: black" class="mr-0">
                        Logout
                    </a>
                </c:if>
                <a href="${sessionScope.account eq null ? 'login' : 'cart'}" class="ml-3">
                    <img src="img/icon/cart.png" alt="">
                    <span id="numberCart">${sessionScope.listCartProduct.size()}
                    </span>
                    <span class="price">Cart</span>
                </a>
            </div>
        </div>
    </div>
    <div class="canvas__open"><i class="fa fa-bars"></i></div>
</div>