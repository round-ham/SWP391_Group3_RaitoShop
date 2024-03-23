<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" type="image/x-icon" href="pic/logo.png">
        <title>Raito Shop | Shoes</title>

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
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__option">
                <div class="offcanvas__links">
                    <a href="#">Sign in</a>
                    <a href="#">FAQs</a>
                </div>
                <div class="offcanvas__top__hover">
                    <span>Usd <i class="arrow_carrot-down"></i></span>
                    <ul>
                        <li>USD</li>
                        <li>EUR</li>
                        <li>USD</li>
                    </ul>
                </div>
            </div>
            <div class="offcanvas__nav__option">
                <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                <a href="#"><img src="img/icon/heart.png" alt=""></a>
                <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                <div class="price">$0.00</div>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__text">
                <p>Free shipping, 30-day return or refund guarantee.</p>
            </div>
        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <%@include file="header.jsp" %>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="pic/slide3.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Raito Shop</h6>
                                    <h2 style="color: #c69500">Build your Collection</h2>

                                    <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="pic/slide1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h2 style="color: red"></h2>

                                    <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <section class="banner spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 offset-lg-4">
                        <div class="banner__item">
                            <div class="banner__item__pic">
                                <img style="width: 400px" src="pic/pic2.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>${requestScope.listC.get(1).categoryDescription}</h2>
                                <a href="product?sort=categoryId${requestScope.listC.get(1).categoryId}-0">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="banner__item banner__item--middle">
                            <div class="banner__item__pic">
                                <img src="pic/pic4.jpeg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>${requestScope.listC.get(2).categoryDescription}</h2>
                                <a href="product?sort=categoryId${requestScope.listC.get(2).categoryId}-0">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="banner__item banner__item--last">
                            <div class="banner__item__pic">
                                <img src="pic/pic5.jpg" alt="">
                            </div>
                            <div class="banner__item__text" style="margin-top: 200px; margin-left: 10px">
                                <h2 style="color: white">${requestScope.listC.get(3).categoryDescription}</h2>
                                <a href="product?sort=categoryId${requestScope.listC.get(3).categoryId}-0" style="color: whitesmoke">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="filter__controls">
                            <li class="active" data-filter=".popular">Best Sellers</li>
                            <li data-filter=".new-arrivals">New Arrivals</li>
                            <li data-filter=".hot-sales">Randoms</li>
                            <li data-filter=".sales">Ongoing Sales</li>
                        </ul>
                    </div>
                </div>
                <div class="row product__filter">
                    <c:forEach items="${requestScope.listP1}" begin="${0}" end="${7}" var="p1">
                        <c:if test="${p1.status == 1}">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix popular" >
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${p1.productImage}">

                                        <ul class="product__hover">
                                            <li><a href="productdetails?id=${p1.productId}"><p style="background: white; color: black; padding: 10px;font-weight: bolder">View Details</p> </a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6>${p1.productName}</h6>
                                        <a href="#" class="add-cart">+ Add To Cart</a>
                                        <div class="rating">

                                        </div>
                                        <h5>${p1.unitPrice} VND</h5>

                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${requestScope.listP2}" begin="${0}" end="${7}" var="p2">
                        <c:if test="${p2.status == 1}">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals" style="display: none">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${p2.productImage}">
                                        <ul class="product__hover">
                                            <li><a href="productdetails?id=${p2.productId}"><p style="background: white; color: black; padding: 10px;font-weight: bolder">View Details</p> </a></li>

                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6>${p2.productName}</h6>
                                        <a href="#" class="add-cart">+ Add To Cart</a>
                                        <div class="rating">

                                        </div>
                                        <h5>${p2.unitPrice} VND</h5>

                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${requestScope.listP3}" begin="${0}" end="${7}" var="p3">
                        <c:if test="${p3.status == 1}">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales" style="display: none">
                                <div class="product__item sale">
                                    <div class="product__item__pic set-bg" data-setbg="${p3.productImage}">

                                        <ul class="product__hover">
                                            <li><a href="productdetails?id=${p3.productId}"><p style="background: white; color: black; padding: 10px;font-weight: bolder">View Details</p> </a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6>${p3.productName}</h6>
                                        <a href="#" class="add-cart">+ Add To Cart</a>
                                        <div class="rating">

                                        </div>
                                        <h5>${p3.unitPrice} VND </h5>

                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${saleList}" var="p3">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix sales" style="display: none">
                            <div class="product__item sale">
                                <div class="product__item__pic set-bg" data-setbg="${p3.product.productImage}">
                                    <ul class="product__hover">
                                        <li><a href="productdetails?id=${p3.product.productId}"><p style="background: white; color: black; padding: 10px;font-weight: bolder">View Details</p> </a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    
                                    <h6>${p3.product.productName}</h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>
                                    <div class="rating"></div>
                                    <h5 style="text-decoration: line-through;">${p3.product.unitPrice} VND</h5>
                                    <p>Sale Percent: ${p3.salePrcnt}%</p>
                                    <h7 class="text-danger mb-4">${p3.saleProgram.title}</h7>
                                    <p>New Price: ${p3.newPrice} VND</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </section>
        <!-- Product Section End -->



        <!-- Latest Blog Section Begin -->
        <section class="latest spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Latest Blog</span>
                            <h2>Fashion New Trends</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.listB}" begin="${0}" end="${2}" var="b">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="${b.blogImage}"></div>
                                <div class="blog__item__text" style="border: 1px solid black">
                                    <span><img src="" alt="">Date: ${b.createDate}</span>
                                    <h5>${b.title}</h5>
                                    <p>Author: Creator name</p>
                                    <a href="#">Read More</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Latest Blog Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>