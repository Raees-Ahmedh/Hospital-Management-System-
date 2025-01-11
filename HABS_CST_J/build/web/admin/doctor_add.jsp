
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add doctor</title>
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

            .radio-inline {
                display: inline-block;
                margin-right: 10px;
            }

        </style>
    </head>
    <body>
        <!-- Section: Design Block -->
        <section class="text-center text-lg-start">
            <!-- Jumbotron -->
            <div class="container py-4">
                <% String value = (String) session.getAttribute("admin"); %>
                <nav class="navbar navbar-expand-lg navbar-light bg-white">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="home.jsp">HABS</a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="doctor_add.jsp">Add Doctors</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="all_doctors.jsp">Schedules</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="manage_appointment.jsp">Manage Appointments</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="manage_patient.jsp">Patients</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link btn btn-purple" href="../sign_out.jsp">Sign Out</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container d-flex justify-content-center"> <!-- Center horizontally -->
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card cascading-right"
                             style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
                            <div class="card-body p-5 shadow-5 text-center">
                                <h2 class="fw-bold mb-5">Add Doctor</h2>

                                <%
                                    String message = "";
                                    if (request.getParameter("s") != null) {
                                        String status = request.getParameter("s");
                                        if ("1".equals(status)) {
                                            message = "<h6 class='text-success'>Doctor added successfully.</h6>";
                                        } else if ("2".equals(status)) {
                                            message = "<h6 class='text-danger'>Invalid phone number. It should be 10 digits starting with 0.</h6>";
                                        } else if ("3".equals(status)) {
                                            message = "<h6 class='text-danger'>A database error occurred. Please try again later.</h6>";
                                        } else {
                                            message = "<h6 class='text-danger'>An error occurred. Failed to add doctor.</h6>";
                                        }
                                    }
                                %>
                                <%= message%>

                                <form method="POST" action="../docreg.jsp">
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
                                        <div class="col-md-6 mb-0">
                                            <div class="form-outline mb-4">
                                                <select id="specialization" name="specialization" class="form-control" required>
                                                    <option value="" disabled selected>Select Specialization</option>
                                                    <option value="Allergy and immunology">Allergy and immunology</option>
                                                    <option value="Anesthesiology">Anesthesiology</option>
                                                    <option value="Dermatology">Dermatology</option>
                                                    <option value="Diagnostic radiology">Diagnostic radiology</option>
                                                    <option value="Emergency medicine">Emergency medicine</option>
                                                    <option value="Family medicine">Family medicine</option>
                                                    <option value="Internal medicine">Internal medicine</option>
                                                    <option value="Medical genetics">Medical genetics</option>
                                                    <option value="Neurology">Neurology</option>
                                                    <option value="Nuclear medicine">Nuclear medicine</option>
                                                    <option value="Obstetrics and gynecology">Obstetrics and gynecology</option>
                                                    <option value="Ophthalmology">Ophthalmology</option>
                                                    <option value="Pathology">Pathology</option>
                                                    <option value="Pediatrics">Pediatrics</option>
                                                    <option value="Physical medicine and rehabilitation">Physical medicine and rehabilitation</option>
                                                    <option value="Preventive medicine">Preventive medicine</option>
                                                    <option value="Psychiatry">Psychiatry</option>
                                                    <option value="Radiation oncology">Radiation oncology</option>
                                                    <option value="Surgery">Surgery</option>
                                                    <option value="Urology">Urology</option>
                                                </select>
                                            </div>
                                        </div>



                                        <div class="form-outline mt-2 col-md-6">
                                            <label class="radio-inline">
                                                <input type="radio" id="gender" name="gender" value="male"/> Male
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" id="gender" name="gender" value="female"/> Female
                                            </label>
                                        </div>




                                        <div class="col-md-6 mb-4 mt-0">
                                            <div class="form-outline mb-4">
                                                <input type="text" id="phone" name="phone" class="form-control" placeholder="Phone" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4 mt-0">
                                            <div class="form-outline mb-4">
                                                <input type="email" id="username" name="username" class="form-control" placeholder="Email" required/>
                                            </div>
                                        </div>



                                        <!-- Submit button -->
                                        <button type="submit" class="btn btn-primary btn-block mb-4">
                                            Add
                                        </button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
