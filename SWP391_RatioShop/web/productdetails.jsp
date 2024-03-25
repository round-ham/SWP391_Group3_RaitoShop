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

            .card {
                max-width: 100%; /* Ensure card doesn't exceed container width */
                max-height: 100%
            }

        </style>
        <style>
            /* CSS Styles */
            .container-co {
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                align-items: flex-start;
                margin-top: 1%;

            }

            .color-options {
                display: flex;

            }

            .color, .size {
                padding: 10px 20px;
                margin-right: 10px;
                cursor: pointer;
                color: black;
                background-color: white;
                border: 1px solid black;
                border-radius: 8px;
            }

            .color.selected, .size.selected {
                color: white;
                background-color: black;
                border-radius: 8px;
            }

            .size-options {
                margin-left: 50px;
            }

            .size-options h3 {
                margin-bottom: 10px;
            }

            .feedback-info{
                display: flex;
                align-items: center;
                gap: 10px;
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
        <section class="breadcrumb-option" style="margin-bottom: 2%;">
            <div class="container" >
                <div class="row">
                    <div class = "card-wrapper">
                        <div class = "card" style=>
                            <!-- card left -->
                            <div class = "product-imgs">
                                <div class = "img-display">
                                    <div class = "img-showcase">
                                        <img  src = "${p.productImage}" alt = "shoe image">
                                        <c:forEach items="${listI}" var="im">
                                            <img src = "${im.value}" alt = "shoe image">
                                        </c:forEach>


                                    </div>
                                </div>
                                <div class = "img-select">
                                    <div class = "img-item">
                                        <a href = "#" data-id = "1">
                                            <img style="height: 30%" src = "${p.productImage}" alt = "shoe image">
                                        </a>
                                    </div>
                                    <c:set var="count" value="${2}"/>
                                    <c:forEach items="${listI}" var="im">
                                        <div class = "img-item">
                                            <a href = "#" data-id = "${count}">
                                                <img style="height: 30%" src = "${im.value}" alt = "shoe image">
                                            </a>
                                            <c:set var="count" value="${count + 1}"/>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                            <!-- card right -->
                            <div class = "product-content">
                                <h2 class = "product-title">${requestScope.p.productName}</h2>
                                <a href = "product?sort=brandId${requestScope.p.brand.brandId}-0" class = "product-link">${requestScope.p.brand.brandName}</a>
                                <!--
                                <div class = "product-rating">
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star"></i>
                                    <i class = "fas fa-star-half-alt"></i>
                                    <span>4.7(21)</span>
                                </div>
                                -->
                                <div class = "product-price">

                                    <p class = "new-price">Price: <span style="color: black; font-size: larger; font-style: italic">${p.unitPrice} VND</span></p>

                                </div>

                                <div class = "product-detail">
                                    <h2>about this item: </h2>
                                    <p>${requestScope.p.productDescription}</p>

                                    <ul>
                                        <li>Category: <a href="product?sort=categoryId${p.category.categoryId}-0">${p.category.categoryDescription}</a></li>
                                        <li>Available: <span>${p.totalQuantity>0?'Instock':'Outstock'}</span></li>

                                        <li>Color (Click to see Size available):
                                            <div class="container-co">
                                                <div class="color-options">
                                                    <c:forEach items="${listC}" var="co">
                                                        <button class="color"  data-color="${co.color}">${co.color}</button>
                                                    </c:forEach>
                                                </div>
                                                <div class="size-options" style="margin-top: 5%; margin-left: 0">

                                                    <div id="sizeList">

                                                        <h5>Size Available</h5>
                                                    </div>
                                                </div>
                                            </div>

                                        </li>
                                    </ul>
                                </div>

                                <div class = "purchase-info">

                                    <button onclick="addToCart2()" type = "button" class = "btn" style="margin-top: 15px">
                                        Add to Cart <i class = "fas fa-shopping-cart"></i>
                                    </button>

                                </div>


                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </section>
        <div class="container">
            <div class="d-flex align-items-center justify-content-between">
                <h3> Feedback (${listF.size()}): </h3>    
                <div class="rating" style="display: flex; flex-direction: column">
                    <div>
                        <span style="font-size: 1.875rem; font-weight: 700">${averageRating}</span><span style="font-size: 1.125rem;"> trên 5</span>
                    </div>
                    <div>
                        <c:forEach begin="1" end="${averageRating}" step="1">
                            <i style="color: #f7941d;" class="fa fa-star"></i>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div id="feedback-post">
                <c:if test="${listF == null}">
                    <h4 class="mb-4" style="text-align: center">Recently, there has been no feedback.</h4>
                </c:if>
                <c:forEach items="${listF}" var="o">
                    <div class="media mb-4">
                        <div class="media-body">
                            <h6 class="feedback-info">
                                ${o.customer.fullName}<small> - <i>${o.createdDate}</i></small> 
                                <div>
                                    <c:forEach begin="1" end="${o.rating}" step="1">
                                        <i style="color: #f7941d;" class="fa fa-star"></i>
                                    </c:forEach>
                                </div>
                            </h6>
                            <p>${o.feedbackDescription}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>              
        </div>


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
                            <a href="#" class="add-cart" >+ Add To Cart</a>

                            <h5>${p.unitPrice} VND</h5>


                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>                                    


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
        <script>

                                        // JavaScript
                                        function addToCart2(){
                                        var sizeButton = document.querySelector('.size.selected');
                                        var colorButton = document.querySelector('.color.selected');
                                        var sizeContent = sizeButton.textContent.split(' ');
                                        var colorValue = colorButton.textContent;
            <c:forEach items="${listC}" var="o">
                                        if (colorValue == '${o.color}'){
                                        colorValue = ${o.colorId}
                                        }
            </c:forEach>
            <c:forEach items="${listSize}" var="o">
                                        if (sizeContent[1] == ${o.size}){
                                        sizeContent[1] = ${o.sizeId}
                                        }
            </c:forEach>
                                        console.log(sizeContent[1]);
                                        console.log(colorValue);
                                        addToCart(${p.productId}, sizeContent[1], colorValue, 1);
                                        }
                                        function addToCart(pId, sId, mId, quantity) {

                                        txtCart = getCookie('cart');
                                        console.log(txtCart);
                                        eraseCookie('cart');
                                        if (txtCart == null || txtCart == '') {
                                        txtCart = pId + ":" + sId + ":" + mId + ":" + quantity;
                                        } else {
                                        txtCart = txtCart + "/" + pId + ":" + sId + ":" + mId + ":" + quantity;
                                        }
                                        console.log(txtCart);
                                        setCookie("cart", txtCart, 2);
                                        num = parseInt(document.getElementById('numberCart').innerHTML);
                                        console.log(num);
                                        document.getElementById('numberCart').innerHTML = num + 1;
                                        alert('Add to cart success!!');
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
                                        // Sample data representing available sizes for each color


                                        const sizesData = {

            <c:forEach items="${listC}" var="co">
                ${co.color}:[
                <c:forEach items="${listPS}" var="i">
                    <c:if test="${co.colorId == i.color.colorId}">
                                        'VN ${i.size.size}',
                    </c:if>
                </c:forEach>
                                        ],
            </c:forEach>
                                        };
                                        // Function to update size list based on selected color
                                        function updateSizes(color) {
                                        const sizeList = document.getElementById('sizeList');
                                        sizeList.innerHTML = ''; // Clear existing list

                                        const sizes = sizesData[color];
                                        sizes.forEach(size => {
                                        const button = document.createElement('button');
                                        button.textContent = size;
                                        button.classList.add('size');
                                        sizeList.appendChild(button);
                                        });
                                        // Attach event listener to size buttons
                                        document.querySelectorAll('.size').forEach(button => {
                                        button.addEventListener('click', function () {
                                        // Implement your logic here for when a size button is clicked
                                        const selectedSize = this.textContent;
                                        console.log(`Selected size: ${selectedSize}`);
                                        // Deselect all sizes
                                        document.querySelectorAll('.size').forEach(button => {
                                        button.classList.remove('selected');
                                        });
                                        // Select the clicked size
                                        this.classList.add('selected');
                                        });
                                        });
                                        }

                                        // Event listener for color buttons
                                        document.querySelectorAll('.color').forEach(button => {
                                        button.addEventListener('click', function () {
                                        const color = this.getAttribute('data-color');
                                        // Deselect all colors
                                        document.querySelectorAll('.color').forEach(button => {
                                        button.classList.remove('selected');
                                        });
                                        // Select the clicked color
                                        this.classList.add('selected');
                                        updateSizes(color);
                                        });
                                        });
        </script>
    </body>
</html>