
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <style>
            .cascading-right {
                margin-right: -50px;
            }

            @media (max-width: 991.98px) {
                .cascading-right {
                    margin-right: 0;
                }
            }
            .navbar-nav .nav-item.d-flex.align-items-center {
                margin-right: 30px;
                font-weight: bold;
            }
            body {
                background-image: url('images/ImageForArticle_22261_1647875610051190.webp'); /* Use your image path here */
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed; /* This makes the background image fixed */
                color: white;
            }

            .navbar-nav .nav-item.d-flex.align-items-center {
                margin-right: 30px;
                font-weight: bold;
            }

        </style>

        <div class="container mt-5">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent">
            <div class="container-fluid">
                <a class="navbar-brand" href="home.jsp">HABS</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

            </div>
        </nav>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="text-center">
                        <h1>Welcome to Our HABS</h1>
                        <p>Your Health, Our Priority</p>
                    </div>
                    <div class="text-center mt-4">
                        <a href="index.jsp" class="btn btn-primary btn-lg me-3">Sign In</a>
                        <a href="sign_up.jsp" class="btn btn-outline-primary btn-lg">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
