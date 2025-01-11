
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage doctors</title>
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
            td{
                text-align: left;
            }


        </style>
    </head>
    <body>
        <section class="text-lg-start text-center">
            <div class="container py-4">
                <% String value = (String) session.getAttribute("admin");
                    if (value == null) {
                        response.sendRedirect("../index.jsp");
                    }%>
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
                <div class="card-body p-5 shadow-5">
                    <center><h1>List of Doctors</h1></center>
                    <%if (request.getParameter("s") != null) {
                            String message;
                            if (request.getParameter("s").equals("1")) {
                                message = "<h6 class='text-success'>New schedule successfully added.</h6>";
                            } else {
                                message = "<h6 class='text-danger'>An error occurred. Please try again.</h6>";
                            }
                            out.println(message);
                        }%>
                    <table class="table">
                        <thead>
                            <tr>
                                <!--<th scope="col">ID</th>-->
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Specialization</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                User user = new User();
                                List<User> doctor = user.getAllDoctors(DbConnector.getConnection());

                                for (User u : doctor) {%>

                            <tr>

                                <!--<td></td>-->
                                <td><%= u.getFirstname()%></td>
                                <td><%= u.getLastname()%></td>
                                <td><%= u.getSpecialization()%></td>
                                <td><%= u.getGender()%></td>
                                <td><%= u.getPhone()%></td>
                                <td><%= u.getUsername()%></td>
                        <form action="add_schedule.jsp" method="GET">
                            <input type="text" hidden class="form-control-plaintext" name="doctor_id" value="<%= u.getId()%>"/>
                            <td><button type="submit" class="btn btn-success btn-sm">Add Schedule</button></td>
                        </form>

                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                </div>
                <%
                    String query = "SELECT * FROM schedule;";

                    Connection con = DbConnector.getConnection();
                    PreparedStatement pstmt = con.prepareStatement(query);

                    ResultSet rs = pstmt.executeQuery();


                %>

                <div class="card-body p-5 shadow-5 text-center">
                    <h1>Shedules</h1>

                    <table class="table">
                        <thead>
                            <tr>

                                <th scope="col">Schedule ID</th>
                                <th scope="col">Doctor ID</th>
                                <th scope="col">Title</th>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">No of Pateints</th>
                                <th scope="col">Fee</th>
                                <th></th>
                            </tr>

                            <% while (rs.next()) {

                            %>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= rs.getString("schedule_id")%></td>
                                <td><%= rs.getString("doctor_id")%></td>
                                <td><%= rs.getString("title")%></td>
                                <td><%= rs.getString("scheduledate")%></td>
                                <td><%= rs.getString("scheduletime")%></td>
                                <td><%= rs.getString("nop")%></td>
                                <td><%= rs.getString("fee")%></td>
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
