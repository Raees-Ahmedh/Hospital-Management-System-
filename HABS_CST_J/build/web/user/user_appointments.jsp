
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String value = (String) session.getAttribute("username");
    if (value == null) {
        response.sendRedirect("../index.jsp");
    }

    String query = "SELECT * FROM appoint WHERE patient_id = ?";

    String pid = (String) session.getAttribute("patient_id");
    int patientid = Integer.parseInt(pid);

    Connection con = DbConnector.getConnection();
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setInt(1, patientid);
    ResultSet rs = pstmt.executeQuery();

%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Your Appointments</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
        <style>
            .navbar-nav .nav-item.d-flex.align-items-center {
                margin-right: 10px;
                font-weight: bold;
            }
        </style>
        <section class="text-center text-lg-start">
            <div class="container py-4">
                <nav class="navbar navbar-expand-lg navbar-light bg-white">
                    <div class="container-fluid">

                        <a class="navbar-brand" href="../home.jsp">HABS</a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="sessions.jsp">Make appointments</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="user_appointments.jsp">Your appointments</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item d-flex align-items-center">
                                    <span class="username"><% out.println(session.getAttribute("username")); %></span>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link btn btn-purple" href="../sign_out.jsp">Sign Out</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="card-body p-5 shadow-5 text-center">
                    <h1>Your Appointments</h1>
                    <table class="table">
                        <thead>
                            <tr>

                                <th scope="col">Doctor Name</th>
                                <th scope="col">Title</th>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Appoinment number</th>
                                <th scope="col">Fee</th>
                            </tr>

                            <% while (rs.next()) {
                                    // String query2 = "SELECT * FROM schedule INNER JOIN doctor on schedule.doctor_id = doctor.doctor_id WHERE schedule_id = ?";
                                    String query2 = "SELECT d.firstname AS doctor_firstname,d.lastname AS doctor_lastname, s.title AS schedule_title,s.scheduledate AS schedule_date,s.scheduletime AS schedule_time,a.appoint_num AS appointment_number,s.fee AS fee FROM doctor d INNER JOIN schedule s ON d.doctor_id = s.doctor_id INNER JOIN appoint a ON s.schedule_id = a.schedule_id WHERE s.schedule_id = ?;";

                                    PreparedStatement pstmt2 = con.prepareStatement(query2);
                                    String sid = rs.getString("schedule_id");
                                    int schedule_id = Integer.parseInt(sid);
                                    pstmt2.setInt(1, schedule_id);
                                    ResultSet rs2 = pstmt2.executeQuery();
                                    String doctorname = "";

                                    String title = "";
                                    String date = "";
                                    String time = "";
                                    int appoinmentNum = 0;
                                    String fee = "";
                                    while (rs2.next()) {
                                        doctorname = rs2.getString("doctor_firstname") + " " + rs2.getString("doctor_lastname");
                                        title = rs2.getString("schedule_title");
                                        date = rs2.getString("schedule_date");
                                        time = rs2.getString("schedule_time");
                                        appoinmentNum = rs2.getInt("appointment_number");
                                        fee = rs2.getString("fee");
                                    }
                            %>
                        </thead>
                        <tbody>
                            <tr>

                                <td><%= doctorname%></td>
                                <td><%= title%></td>
                                <td><%= date%></td>
                                <td><%= time%></td>
                                <td><%= appoinmentNum%></td>
                                <td><%= fee%></td>

                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>

    </body>
</html>

