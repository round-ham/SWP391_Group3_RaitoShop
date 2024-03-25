<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vn">

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
        <link rel="stylesheet" href="css/sweetalert2.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Page Preloder -->
        <c:if test="${requestScope.isLoad == true}">
            <div id="preloder">
            <div class="loader"></div>
        </div>
        </c:if>

        <!-- Offcanvas Menu Begin -->
    
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <%@include file="header.jsp" %>
        </header>
        <!-- Header Section End -->

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Raito Shop</h4>
                            <div class="breadcrumb__links">
                                <a href="homepage">Home</a>
                                <span>Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop__sidebar">
                            <div class="shop__sidebar__search">
                                <form action="product" method="post">
                                    <input type="text" placeholder="Search..." name="keyword" value="${requestScope.keyword}">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="shop__sidebar__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__categories">
                                                    <ul class="nice-scroll">
                                                        <li><a href="product?sort=categoryId0-0">All</a></li>
                                                            <c:forEach items="${requestScope.listC}" var="c">
                                                            <li><a href="product?sort=categoryId${c.categoryId}-0">${c.categoryDescription}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__brand">
                                                    <ul>
                                                        <li><a href="product?sort=brandId0-0">All</a></li>
                                                            <c:forEach items="${requestScope.listB}" var="b">
                                                            <li><a href="product?sort=brandId${b.brandId}-0">${b.brandName}</a></li>
                                                            </c:forEach>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="shop__product__option">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__left">
                                        <c:if test="${requestScope.cate != null}">
                                            <h5 style="font-style: italic">Category: ${requestScope.cate.categoryDescription}</h5>
                                        </c:if>
                                        <c:if test="${requestScope.br != null}">
                                            <h5 style="font-style: italic">Brand: ${requestScope.br.brandName}</h5>
                                        </c:if>    

                                        <p>(Showing ${requestScope.listP.size()} results)</p>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__right">
                                        <c:if test="${requestScope.keyword == null}">
                                            <form action="product" method="get" id="form1">
                                                <p>Sort by &nbsp;</p>
                                                <select name="sort" onchange="submitForm1()">
                                                    <c:if test="${cate.categoryId != null}">
                                                        <option value="categoryId${cate.categoryId}-0" ${requestScope.choice==0?'selected':''}>Date: New Release</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId != null}">
                                                        <option value="brandId${br.brandId}-0" ${requestScope.choice==0?'selected':''}>Date: New Release</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId == null && cate.categoryId == null}">
                                                        <option value="categoryId0-0" ${requestScope.choice==0?'selected':''}>Date: New Release</option>
                                                    </c:if>

                                                    <c:if test="${cate.categoryId != null}">
                                                        <option value="categoryId${cate.categoryId}-1" ${requestScope.choice==1?'selected':''}>Price: High to Low</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId != null}">
                                                        <option value="brandId${br.brandId}-1" ${requestScope.choice==1?'selected':''}>Price: High to Low</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId == null && cate.categoryId == null}">
                                                        <option value="categoryId0-1" ${requestScope.choice==1?'selected':''}>Price: High to Low</option>
                                                    </c:if>

                                                    <c:if test="${cate.categoryId != null}">
                                                        <option value="categoryId${cate.categoryId}-2" ${requestScope.choice==2?'selected':''}>Price: Low to High</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId != null}">
                                                        <option value="brandId${br.brandId}-2" ${requestScope.choice==2?'selected':''}>Price: Low to High</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId == null && cate.categoryId == null}">
                                                        <option value="categoryId0-2" ${requestScope.choice==2?'selected':''}>Price: Low to High</option>
                                                    </c:if>

                                                    <c:if test="${cate.categoryId != null}">
                                                        <option value="categoryId${cate.categoryId}-3" ${requestScope.choice==3?'selected':''}>Product: Popular</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId != null}">
                                                        <option value="brandId${br.brandId}-3" ${requestScope.choice==3?'selected':''}>Product: Popular</option>
                                                    </c:if>
                                                    <c:if test="${br.brandId == null && cate.categoryId == null}">
                                                        <option value="categoryId0-3" ${requestScope.choice==3?'selected':''}>Product: Popular</option>
                                                    </c:if>



                                                </select>
                                            </form>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach items="${requestScope.listP}" var="p">
                                <c:if test="${p.status == 1}">
                                <div class="col-lg-4 col-md-6 col-sm-6 ">
                                    <div class="product__item item-of-listblog">

                                        <div class="product__item__pic set-bg" data-setbg="${p.productImage}">                
                                            <ul class="product__hover">
                                                <li><a href="productdetails?id=${p.productId}"><p style="background: white; color: black; padding: 10px;font-weight: bolder">View Details</p> </a></li>
                                              
                                            </ul>
                                        </div>

                                        <div class="product__item__text">
                                            <h6>${p.productName}</h6>
                                            <a onclick="addToCart(${p.productId})" style="cursor: pointer"class="add-cart">+ Add To Cart</a>
                                            <!--<div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-full"></i>
                                            </div> 
                                              --> 
                                                <h5>${p.unitPrice} VND</h5>
                                                <script>
                                                    function addToCart(id) {
                                                        if(${sessionScope.account == null}) {
                                                            window.location.href = './login';
                                                        }
                                                        else {
                                                            fetch(`./addcart?pid=` + id)
                                                            .then(data => {
                                                                if (data.status == 401){
                                                                    Swal.fire({
                                                                        icon: 'error',
                                                                        title: 'Oops...',
                                                                        text: 'Only customer can add to cart!',
                                                                    });
                                                                    return;
                                                                }
                                                                let number = document.getElementById('numberCart').innerHTML;
                                                                document.getElementById('numberCart').innerHTML = parseInt(number, 10) + 1;
                                                            })
                                                            .catch(err => {
                                                                debugger
                                                                console.log(err);
                                                            });
                                                        }
                                                    }
                                                </script>

                                        </div>
                                    </div>
                                </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="product__pagination">
                                    <ul class="pagination">
                                        <li class="previous"><button style="background: #990099; color: white; padding: 8px; border-radius: 7px; width: 80px;" onclick="previousPage()"><i class="ti-arrow-left"></i> Prev</button></li>
                                        <li class="next"><button style="background: #990099; color: white; padding: 8px; border-radius: 7px; width: 80px; margin-left: 2px" onclick="nextPage()">Next <i class="ti-arrow-right"></i></button></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->

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
        <script>

            var itemsPerPage = 6;
            var currentPage = 1;

            function displayItems() {
                var items = document.getElementsByClassName("item-of-listblog");
                var startingIndex = (currentPage - 1) * itemsPerPage;
                var endingIndex = startingIndex + itemsPerPage;
                for (var i = 0; i < items.length; i++) {
                    if (i >= startingIndex && i < endingIndex) {
                        items[i].style.display = "block";
                    } else {
                        items[i].style.display = "none";
                    }
                }
            }

            function previousPage() {
                if (currentPage > 1) {
                    currentPage--;
                    displayItems();
                }
            }

            function nextPage() {
                var totalItems = document.getElementsByClassName("item-of-listblog").length;
                var totalPages = Math.ceil(totalItems / itemsPerPage);
                if (currentPage < totalPages) {
                    currentPage++;
                    displayItems();
                }
            }

            // Initialize the page
            displayItems();

        </script>
        <script>
            function submitForm1() {

                var form = document.getElementById("form1");

                // Submit form
                form.submit();
            }
        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/sweetalert2.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>