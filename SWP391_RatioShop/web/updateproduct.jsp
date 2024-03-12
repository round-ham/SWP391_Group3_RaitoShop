<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product</title>
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
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <div class="container-co">

            <div class="form-container">
                <div class="form-heading">

                    <h3 style="color: white">Edit Product</h3>
                </div>
                <form action="update-product" method="post" class="form-horizontal" role="form">
                    <h3 style="color: red; font-style: italic">${param.add==0?'Update product failed!':''}</h3>
                    <h3 style="color: #66ff33; font-style: italic">${param.add==1?'Update product succesful!':''}</h3>
                    <input type="hidden" name="productId" value="${p.productId}">
                    <div class="form-group">
                        <label for="name">Name of Product</label>
                        <div>
                            <input type="text" class="form-control" name="productName" id="name" placeholder="Type name in here....." value="${p.productName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="about">Description</label>
                        <div>
                            <textarea name="description"  style="min-height: 120px" class="form-control" placeholder="Type description of product here....">
                                ${p.productDescription}
                            </textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qty">Unit Price (VND)</label>
                        <div>
                            <input type="number" class="form-control" name="unitPrice" value="${p.unitPrice}"  min="1" style="max-width: 250px"> 
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">Image of Product(General)</label>
                        <div>
                            <input type="text" class="form-control" name="productImage" value="${p.productImage}" placeholder="Paste link picture here.....">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name">Status</label>
                        <div>
                            <label class="radio-inline">
                                <input type="radio" name="status" <c:if test="${p.status eq 1}">checked</c:if> id="inlineRadio1" value="1"> Ready to Sell
                            </label>
                            <label class="radio-inline" style="margin-left: 20px">
                                <input type="radio" name="status" <c:if test="${p.status eq 0}">checked</c:if> id="inlineRadio2" value="0"> Not ready
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tech">Category</label>
                        <div>
                            <select class="form-control" name="cate">
                                <c:forEach items="${listCate}" var="cate">
                                    <option <c:if test="${p.category.categoryId eq cate.categoryId}"> selected</c:if> value="${cate.categoryId}">${cate.categoryName}. ${cate.categoryDescription}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tech">Brand</label>
                        <div>
                            <select class="form-control" name="br">
                                <c:forEach items="${listBr}" var="br">
                                    <option <c:if test="${p.brand.brandId eq br.brandId}"> selected</c:if> value="${br.brandId}">${br.brandName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
        <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
