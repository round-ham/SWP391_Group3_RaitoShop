<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" type="image/x-icon" href="pic/logo.png">
        <title>Raito Product</title>

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
        <link rel="stylesheet" href="css/productdetails.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
        <style>
            .button {
                float: left;
                margin: 5px 5px;
                width: 110px;
                min-height: 50px;
                position: relative;


            }

            .button label,
            .button input {
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

            .button input[type="radio"] {
                opacity: 0.011;
                z-index: 100;
            }

            .button input[type="radio"]:checked + label {
                background: #20b8be;
                border-radius: 12px;
            }

            .button label {
                cursor: pointer;
                z-index: 90;
                font-size: 14px;
            }

        </style>
    </head>
    <body>

        <div id="preloder">
            <div class="loader"></div>
        </div>
        <header class="header" style="max-height: 150px;" >
            <%@include file="header.jsp" %>
        </header>
        <section class="breadcrumb-option" style="margin-bottom: 10%;">
            <div class="container" style="margin-top: 10%">
                <div class="row">
                    <div class = "card-wrapper">
                        <div class = "card">
                            <!-- card left -->
                            <div class = "product-imgs">
                                <div class = "img-display">
                                    <div class = "img-showcase">
                                        <img  src = "${p.productImage}" alt = "shoe image">
                                        <img src = "pic/shoes_images/return.jpg" alt = "shoe image">
                                        <img src = "pic/shoes_images/freeship.webp" alt = "shoe image">

                                    </div>
                                </div>
                                <div class = "img-select">
                                    <div class = "img-item">
                                        <a href = "#" data-id = "1">
                                            <img style="width: 350px; height: 160px" src = "${p.productImage}" alt = "shoe image">
                                        </a>
                                    </div>
                                    <div class = "img-item">
                                        <a href = "#" data-id = "2">
                                            <img style="width: 350px; height: 160px" src = "pic/shoes_images/return.jpg" alt = "shoe image">
                                        </a>
                                    </div>
                                    <div class = "img-item">
                                        <a href = "#" data-id = "3">
                                            <img  style="width: 350px; height: 160px" src = "pic/shoes_images/freeship.webp" alt = "shoe image">
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <!-- card right -->
                            <div class = "product-content">
                                <h2 class = "product-title">${requestScope.p.productName}</h2>
                                <a href = "product?sort=brandId${requestScope.p.brand.brandId}-0" class = "product-link">${requestScope.p.brand.brandName}</a>
                                <div class = "product-rating">
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star-half-alt"></i>
                                    <span>4.7(21)</span>
                                </div>

                                <div class = "product-price">
                                    <c:if test="${p.discountPercentage > 0}">
                                        <p class = "last-price">Old Price: <span>${p.unitPrice} VND</span></p>
                                        <p class = "new-price">New Price: <span>${p.unitPrice - p.unitPrice * p.discountPercentage * 0.01} VND(-${p.discountPercentage}%)</span></p>
                                    </c:if>
                                    <c:if test="${p.discountPercentage == 0}">
                                        <p class = "new-price">Price: <span>${p.unitPrice} VND</span></p>
                                    </c:if>
                                </div>

                                <div class = "product-detail">
                                    <h2>about this item: </h2>
                                    <p>${requestScope.p.productDescription}</p>

                                    <ul>
                                        <li>Category: <a href="product?sort=categoryId${p.category.categoryId}-0">${p.category.categoryName}</a></li>
                                        <li>Available: <span>${p.totalQuantity>0?'Instock':'Outstock'}</span></li>

                                        <li>Shipping Area: <span>All over the world</span></li>
                                        <li>Shipping Fee: <span>Free</span></li>
                                        <li>Size: </li>
                                            <c:forEach items="${listPS}" var="ps">
                                            <li>

                                                <c:if test="${ps.quantity > 0}">
                                                    <div class="button">
                                                        <input type="radio" name="size"/> <label class="btn btn-default" for="a25" style="font-weight: 500">Size: ${ps.size.size}</label>
                                                    </div>
                                                </c:if>
                                                <c:if test="${ps.quantity == 0}">
                                                    <div class="button">
                                                        <input disabled type="radio" name="size"/> <label class="btn btn-default" for="a25" style="color: #999999">Size: ${ps.size.size}</label>
                                                    </div>
                                                </c:if>
                                            </li>

                                        </c:forEach>
                                    </ul>
                                </div>

                                <div class = "purchase-info">
                                    <input style="min-width: 150px" type = "number" min = "0" value = "1">
                                    <button type = "button" class = "btn" style="margin-top: 15px">
                                        Add to Cart <i class = "fas fa-shopping-cart"></i>
                                    </button>

                                </div>

                                <div class = "social-links">
                                    <p>Share At: </p>
                                    <a href = "#">
                                        <i class = "fab fa-facebook-f"></i>
                                    </a>
                                    <a href = "#">
                                        <i class = "fab fa-twitter"></i>
                                    </a>
                                    <a href = "#">
                                        <i class = "fab fa-instagram"></i>
                                    </a>
                                    <a href = "#">
                                        <i class = "fab fa-whatsapp"></i>
                                    </a>
                                    <a href = "#">
                                        <i class = "fab fa-pinterest"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <h3 style="margin-left: 10%; margin-bottom: 3%"> Suggest for you: </h3>
        <div class="row" style ="width: 60%; margin: 0 auto;">

            <c:forEach items="${requestScope.listP}" var="p" begin="${0}" end="${2}">
                <div class="col-lg-4 col-md-6 col-sm-6 ">
                    <div class="product__item item-of-listblog">

                        <div class="product__item__pic set-bg" data-setbg="${p.productImage}">                
                            <ul class="product__hover">
                                <li><a href="productdetails?id=${p.productId}"><p style="background: white; color: black; padding: 10px;font-weight: bolder">View Details</p> </a></li>

                            </ul>
                        </div>

                        <div class="product__item__text">
                            <h6>${p.productName}</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-full"></i>
                            </div>
                            <c:if test="${p.discountPercentage == 0}">
                                <h5>${p.unitPrice} VND</h5>
                            </c:if>
                            <c:if test="${p.discountPercentage > 0}">
                                <h5>${p.unitPrice - p.discountPercentage * 0.01 * p.unitPrice} VND (<span style="color: red"> -${p.discountPercentage}%</span>)</h5>
                            </c:if>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>                                    
        <footer class="footer">
            <%@include file="footer.jsp" %>
        </footer>

        <script src="js/productdetails.js"></script>
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