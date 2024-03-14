<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product</title>
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
        <style>
            body {
                color: #566787;
                background: currentColor;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px auto;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {
                font-size: 13px;
                border: none;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            .table-title {
                color: #fff;
                background: #4b5366;
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                margin-bottom: 5px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .filter-group select.form-control {
                width: 110px;
            }
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 80px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }

            .star-rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: center;
            }

            .star {
                cursor: pointer;
                font-size: 24px;
                margin: 0 5px;
            }

            .star:hover:before,
            .star:hover ~ .star:before {
                content: '\2605';
                color: gold;
            }

            .star:before {
                content: '\2606';
                color: #ccc;
            }

            input[type="radio"] {
                display: none;
            }

            input[type="radio"]:checked ~ label:before {
                content: '\2605';
                color: gold;
            }

            #error-message {
                color: red;
                font-weight: bold;
                display: none;
            }

        </style>
    </head>
    <body>
        <header style=" background: white">
            <%@include file="header.jsp" %>
        </header>
        <div class="container-co">

            <div class="form-container">
                <div class="form-heading">

                    <h3 style="color: white">Edit Feedback</h3>
                </div>
                <div id="formWriteFeedback">

                    <form onsubmit="return validateForm()" action="update-feedback" method="post" >
                        <div class="containerFeedback" style="display: flex; flex-direction: column; gap: 10px; padding: 20px;">
                            <div class="infoProduct">
                                <img style="width: 60px;
                                     height: 60px;
                                     border-radius: 4px;" src="${p.productImage}"/>
                                <span style="font-weight: 600">${p.productName}</span>

                            </div>

                            <div class="rate" style="border-bottom: 1px solid #e5e5e5;">
                                <div class="rate-text">
                                    <span class="tt-o-field-group__label-text">Overall rating</span>
                                    <span style="color: red;"> *</span>
                                </div>
                                <input type="hidden" name="productId" value="${p.productId}">

                                <div class="star-rating">
                                    <input type="radio" id="star5" name="rating"<c:if test="${feedback.rating == 5}">checked</c:if> value="5">
                                    <label class="star" for="star5"></label>
                                    <input type="radio" id="star4" name="rating" <c:if test="${feedback.rating == 4}">checked</c:if> value="4">
                                    <label class="star" for="star4"></label>
                                    <input type="radio" id="star3" name="rating" <c:if test="${feedback.rating == 3}">checked</c:if> value="3">
                                    <label class="star" for="star3"></label>
                                    <input type="radio" id="star2" name="rating" <c:if test="${feedback.rating == 2}">checked</c:if> value="2">
                                    <label class="star" for="star2"></label>
                                    <input type="radio" id="star1" name="rating" <c:if test="${feedback.rating == 1}">checked</c:if> value="1">
                                    <label class="star" for="star1"></label>
                                    <div id="error-message">Please choose rating</div>
                                    <input type="hidden" id="ratingHidden" name="rating">
                                </div>
                            </div>



                            <div class="reviewFeedbackText">
                                <span>Your Feedback</span>
                                <span style="color: red;"> *</span>
                                <textarea name="desFeedback" required style="border: 1px solid;" class="form-control" id="exampleFormControlTextarea1" rows="3">
                                    ${feedback.feedbackDescription}
                                </textarea>
                            </div>



                            <button class="btn btn-primary mb-3" type="submit" class ="btn btn-dark">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var rating = document.querySelector('input[name="rating"]:checked');

                if (!rating) {
                    document.getElementById('error-message').style.display = 'block';
                    return false; 
                }

                document.getElementById('ratingHidden').value = rating.value;
                alert( rating.value);
                return true;
            }


        </script>
        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
