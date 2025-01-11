
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String value = (String) session.getAttribute("admin");
    if (value == null) {
        response.sendRedirect("../index.jsp");
    }

    String query = "SELECT * FROM appoint;";

    Connection con = DbConnector.getConnection();
    PreparedStatement pstmt = con.prepareStatement(query);

    ResultSet rs = pstmt.executeQuery();


%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Appointments</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
        <section class="text-center text-lg-start">
            <div class="container py-4">
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

                <div class="card-body p-5 shadow-5 text-center">
                    <h1>Appointments</h1>

                    <table class="table">
                        <thead>
                            <tr>

                                <th scope="col">Appointment ID</th>
                                <th scope="col">Patient ID</th>
                                <th scope="col">Schedule ID</th>
                                <th scope="col">Appointment No</th>
                                <th scope="col">Date</th>

                            </tr>

                            <% while (rs.next()) {

                            %>
                        </thead>
                        <tbody>

                            <tr>
                        <form action="../admin_functions.jsp">
                            <td><%= rs.getString("appointment_id")%></td>
                            <td><%= rs.getString("patient_id")%></td>
                            <td><%= rs.getString("schedule_id")%></td>
                            <td><%= rs.getString("appoint_num")%></td>
                            <td><%= rs.getString("date")%></td>

                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Appointment </h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <h3>Do you want to delete This Appointment</h3>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" name="action" value="delete_apo" class="btn btn-danger btn-sm">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button></td>
                        </form>
                        </tr>
                        <%}%>

                        </tbody>
                    </table>

                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>