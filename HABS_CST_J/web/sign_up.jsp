
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign up</title>
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
            <!-- Jumbotron -->
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
                                <h2 class="fw-bold mb-5">Sign Up</h2>

                                <%
                                    String message = "";
                                    if (request.getParameter("s") != null) {
                                        String status = request.getParameter("s");
                                        if ("1".equals(status)) {
                                            message = "<h6 class='text-success'>You have successfully registered.</h6>";
                                        } else if ("2".equals(status)) {
                                            message = "<h6 class='text-danger'>Passwords do not match. Please try again.</h6>";
                                        } else if ("3".equals(status)) {
                                            message = "<h6 class='text-danger'>Password must be at least 6 characters long.</h6>";
                                        } else if ("4".equals(status)) {
                                            message = "<h6 class='text-danger'>Invalid phone number. It should be 10 digits starting with 0.</h6>";
                                        } else if ("5".equals(status)) {
                                            message = "<h6 class='text-danger'>A database error occurred. Please try again later.</h6>";
                                        } else {
                                            message = "<h6 class='text-danger'>An error occurred. Please register again.</h6>";
                                        }
                                    }
                                    if (!message.isEmpty()) {
                                        out.println(message);
                                    }
                                %>

                                <form method="POST" action="registration.jsp">
                                    <!-- 2 column grid layout with text inputs for the first and last names -->
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="firstnameInput" name="firstname" class="form-control" placeholder="First name" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="lastnameInput" name="lastname" class="form-control" placeholder="Last name" required/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="email" id="emailInput" name="username" class="form-control" placeholder="Email address" required/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input type="password" id="passwordInput" name="confirmPassword" class="form-control" placeholder="Confirm Password" required/>
                                    </div>
                                    <div class="form-outline mb-4" style="text-align: left; margin-left: 10px;">
                                        <label style="margin-right: 40px;">Gender</label>

                                        <input type="radio" id="gender" name="gender" value="male"/>Male &nbsp; &nbsp;
                                        <input type="radio" id="gender" name="gender" value="female"/>Female
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="phoneInput" name="phone" class="form-control" placeholder="Phone" required/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        Birth Day
                                        <input type="date" id="dobInput" name="dob" class="form-control" placeholder="Birth Day" required/>
                                    </div>

                                    <button type="submit" class="btn btn-primary btn-block mb-4">
                                        Sign Up
                                    </button>

                                    <div class="text-center">
                                        <p>Already have an account? <a href="index.jsp">Sign in</a></p>
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
