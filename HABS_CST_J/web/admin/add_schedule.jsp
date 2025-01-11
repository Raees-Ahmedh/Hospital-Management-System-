
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Schedule"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add schedule</title>
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
                                <h2 class="fw-bold mb-5">Add Schedule</h2>
                                <%
                                    if (request.getParameter("s") != null) {
                                        String message;
                                        if (request.getParameter("s").equals("1")) {
                                            message = "<h6 class='text-success'>New schedule successfully added.</h6>";
                                        } else {
                                            message = "<h6 class='text-danger'>An error occurred. Please register again.</h6>";
                                        }
                                        out.println(message);
                                    }

                                    if (value == null) {
                                        response.sendRedirect("../index.jsp");
                                    }

                                    String did = request.getParameter("doctor_id");
                                    int doctor_id = Integer.parseInt(did);
                                    
                                %>
                                
                                <form method="POST" action="schedule_process.jsp">
                                    <div class="row">
                                        <input type="text" value="<%= doctor_id %>" name="docid" hidden/>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="firstnameInput" name="title" class="form-control" placeholder="Title" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="nop" name="nop" class="form-control" placeholder="Number of Patients" required/>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-4">
                                            <label>Date</label>
                                            <div class="form-outline mb-4">
                                                <input type="date" id="date" name="date" class="form-control" required/>
                                            </div>
                                        </div>
                                        <script>
                                            const today = new Date().toISOString().split('T')[0];
                                            document.getElementById('date').setAttribute('min', today);
                                        </script>

                                        <div class="col-md-6 mb-4">
                                            <label>Time</label>
                                            <div class="form-outline mb-4">
                                                <input type="time" id="time" name="time" class="form-control" required/>
                                            </div>
                                        </div>                           


                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="fee" name="fee" class="form-control" placeholder="Fee" required/>
                                            </div>
                                        </div>

                                        <!-- Submit button -->
                                        <button type="submit" class="btn btn-primary btn-block mb-4">
                                            Add Schedule
                                        </button>


                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        
    </body>
</html>
