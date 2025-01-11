
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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
                background-image: url('images/healthcare-technology.jpg'); /* Use your image path here */
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed; /* This makes the background image fixed */
            }

            .navbar-nav .nav-item.d-flex.align-items-center {
                margin-right: 30px;
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <!-- Section: Design Block -->
        <section class="text-center text-lg-start">
            <div class="container py-4">
                <nav class="navbar navbar-expand-lg navbar-light bg-transparent">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="home.jsp">HABS</a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                    </div>
                </nav>

                <div class="container d-flex justify-content-center"> <!-- Center horizontally -->
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card cascading-right"
                             style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
                            <div class="card-body p-5 shadow-5 text-center">
                                <h2 class="fw-bold mb-5">Sign In</h2>
                                <%
                                    if (request.getParameter("s") != null) {
                                        String message = "";
                                        if (request.getParameter("s").equals("0")) {
                                            message = "<h6 class='text-danger'>Username or Password incorrect.</h6>";
                                        }
                                        out.println(message);
                                    }
                                %>
                                <form action="authentications.jsp" method="POST">
                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <input type="text" id="emailInput" name="username" class="form-control" placeholder="Email" required/>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                        <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required/>
                                    </div>
                                    <input type="text" name="role" value="patient" hidden/>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4">
                                        Sign In
                                    </button>

                                    <div class="text-center">
                                        <p>Don't have an account? <a href="sign_up.jsp">Sign up</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
