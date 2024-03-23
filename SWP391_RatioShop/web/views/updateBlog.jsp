<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Blog</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
    </head>
    <body>
        <header style="margin-bottom: 15%; background: white">
            <%@include file="../header.jsp" %>
        </header>
        <div class="container-co">
            <div class="form-container">
                <div class="form-heading">
                    <h3 style="color: white">Edit Blog</h3>
                </div>
                <form action="update-blog" method="post"  enctype="multipart/form-data">
                    <input  name="blogId" hidden value="${b.blogID}">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <div>
                            <input type="text" class="form-control" name="title" id="title" placeholder="Enter title here....." value="${b.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content">Content</label>
                        <div>
                            <textarea name="content" style="min-height: 120px" class="form-control" placeholder="Enter content here...." value="${b.blogContent}">${b.blogContent}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image">Image</label>
                        <div>
                            <input type="file" name="image" id="imageInput">
                            <span id="imageFileName">${b.blogImage}</span>
                            <img id="preview" src="<c:if test="${not empty b.blogImage}">img/blog/${b.blogImage}</c:if>" alt="Blog Image" style="max-width: 300px; margin-top: 10px;">
                            </div>
                        </div>                    
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
            </div>
            <footer style="margin-top: 25%;background: black; padding-top: 30px">
            <%@include file="../footer.jsp" %>
        </footer>
    </body>
<script>
    // Get references to the input file element and image preview element
    var input = document.getElementById('imageInput');
    var preview = document.getElementById('preview');
    var imageFileName = document.getElementById('imageFileName');

    // Add event listener for changes in the input file
    input.addEventListener('change', function(event) {
        // Check if any file is selected
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            // Set up the reader onload function
            reader.onload = function(e) {
                // Update the image preview source and display it
                preview.src = e.target.result;
                preview.style.display = 'block';
                // Update the file name
                imageFileName.textContent = input.files[0].name;
            };
            // Read the selected file as a data URL
            reader.readAsDataURL(input.files[0]);
        } else {
            // If no file is selected, hide the image preview
            preview.style.display = 'none';
            // Reset the file name
            imageFileName.textContent = '';
        }
    });
</script>

</html>
