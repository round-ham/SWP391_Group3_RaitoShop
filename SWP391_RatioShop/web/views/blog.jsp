<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Raito Shop</title>

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
        <link rel="stylesheet" href="css/style_1.css" type="text/css">
        <link rel="stylesheet" href="css/blog.css" type="text/css"/>

    </head>

    <body>
        <!-- Page Preloder -->
        <%@include file="../header.jsp" %>
        <!-- Header Section End -->

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-blog set-bg" data-setbg="img/breadcrumb-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Our Blog</h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Blog Section Begin -->
        <section class="blog spad">
            <div class="container">
                <div class="sort">
                    <h6 class="sidebar-title">Sort<div class="line-container"></div>
                    </h6>
                    <div class="sidebar-content">
                        <form action="blog  " method="GET">
                            <input type="radio" name="order" value="NTO" id="NTO" ${NTO}> New To Old
                            <br>
                            <input type="radio" name="order" value="OTN" id="OTN" ${OTN}> Old To New
                            <br>
                            <button type="submit" value="Find" class="submit-button">Find</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${list}" var="b">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic set-bg" data-setbg="img/blog/${b.getBlogImage()}"></div>
                                <div class="blog__item__text">
                                    <span><img src="img/icon/calendar.png" alt=""> ${b.getLastUpdate()}</span>
                                    <h5>${b.getTitle()}</h5>
                                    <a href="blogdetail?id=${b.getBlogID()}">Read More</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="pagination1">
                <c:if test="${currentPage > 1}">
                    <a href="?page=${currentPage - 1}" class="arror"><<</a>
                </c:if>

                <c:forEach var="page" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${page == currentPage}">
                            <a class="current-page">${page}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${page}">${page}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="?page=${currentPage + 1}" class="arror" >>></a>
                </c:if>
            </div>
        </section>
        <!-- Blog Section End -->

        <!-- Footer Section Begin -->
        <%@include file="../footer.jsp" %>
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