
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String value = (String) session.getAttribute("username");
    if (value == null) {
        response.sendRedirect("../index.jsp");
    }
    String sid = request.getParameter("schedule_id");
    if (sid != null && !sid.isEmpty()) {
        int schedule_id = Integer.parseInt(sid);

    } else {
        int schedule_id = 0;
    }
    String title = request.getParameter("title");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String email = request.getParameter("email");
    String date = request.getParameter("scheduledate");
    String time = request.getParameter("scheduletime");

    String fee = request.getParameter("fee");
//    float fee = Float.parseFloat(f);

    String pid = (String) session.getAttribute("patient_id");

    if (pid != null && !pid.isEmpty()) {
        int patientid = Integer.parseInt(pid);

    } else {
        int patientid = 0;
    }

%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Confirm Appointment</title>
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
                                    <span class="username"><% out.println(session.getAttribute("username"));%></span>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link btn btn-purple" href="../sign_out.jsp">Sign Out</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="card-body p-5 shadow-5 text-center">
                    <h1>Confirm Appointment</h1>

                    <div class="card mb-3">

                        <div class="card-body">
                            <h5 class="card-title">Session Details</h5>
                            <p class="card-text">Doctor name : <%= firstname%> <%= lastname%></p>
                            <p class="card-text">Doctor Email : <%= email%></p>
                            <p class="card-text">Session Title : <%= title%></p>
                            <p class="card-text">Session Scheduled Date : <%= date%></p>
                            <p class="card-text">Session Starts : <%= time%></p>
                            <p class="card-text">Channeling fee : LKR. <%= fee%></p>
                        </div>
                    </div>

                    <form action="complete_appo.jsp">
                        <input type="hidden" name="schedule_id" value="<%= sid%>"/>
                        <input type="hidden" name="patient_id" value="<%= pid%>"/>
                        <input type="hidden" name="date" value="<%= date %>"/>

                        <button type="submit">Confirm</button>


                    </form>


                </div>
            </div>
            
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>

    </body>
</html>

