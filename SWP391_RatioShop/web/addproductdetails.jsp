<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product Details</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

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
                margin-top: 30px;
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

            .img-product{
                width: 90px;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <div class="container-co">
            <div class="form-container">
                <div class="form-heading">
                    <h3 style="color: white">Add Product Details</h3>
                </div>
                <form action="addproductdetails" method="post" class="form-horizontal" role="form">
                    <h3 style="color: red; font-style: italic">${param.add==0?'Add product details failed!':''}</h3>
                    <h3 style="color: #66ff33; font-style: italic">${param.add==1?'Add product details succesful!':''}</h3>
                    <div class="form-group">
                        <label for="name">Choose the Product</label>
                        <div>
                            <select class="form-control" name="proId" id="proId">
                                <c:forEach items="${listP}" var="p">
                                    <option value="${p.productId}" data-image="${p.productImage}">${p.productName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qty">Quantity</label>
                        <div>
                            <input type="number" class="form-control" name="quantity"  min="1" style="max-width: 250px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">Color</label>
                        <div>
                            <select class="form-control" name="color">
                                <c:forEach items="${listC}" var="co">
                                    <option value="${co.colorId}" >${co.color}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">Image of Product(Specific Color)</label>
                        <div>
                            <input type="text" class="form-control" name="productImage" placeholder="Paste link picture here.....">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tech">Size</label>
                        <div>
                            <c:forEach items="${listS}" var="si">
                                <input type="radio" name="size" value="${si.sizeId}"/><label style="margin-right: 10px">${si.size} VN</label>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
        <script>
            $(document).ready(function () {
                $('#proId').select2({
                    templateResult: formatProduct
                });
            });

            function formatProduct(product) {
                if (!product.id) {
                    return product.text;
                }

                var imageUrl = $(product.element).data('image');
                if (!imageUrl) {
                    return product.text;
                }

                var $product = $('<span><img src="' + imageUrl + '" class="img-product" /> ' + product.text + '</span>');
                return $product;
            }
        </script>
    </body>
</html>
