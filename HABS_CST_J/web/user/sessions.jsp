
<%@page import="app.classes.Schedule"%>
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
        <title>Book Session</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >

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
            .card.cascading-right {
                background: hsla(0, 0%, 100%, 0.8); /* Slightly increase transparency for readability */
                backdrop-filter: blur(10px); /* Blur the background behind the card */
            }
            .navbar-nav .nav-item.d-flex.align-items-center {
                margin-right: 10px;
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <section class="text-lg-start">
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
                <div class="card-body p-5 shadow-5">
                    <h1 class="text-center">Sessions</h1>
                    <%
                        if (request.getParameter("s") != null) {
                            String message = "";
                            String message1 = "";
                            if (request.getParameter("s").equals("0")) {
                                message = "<center><h4 class='text-danger'>Error Occurred.</h4><center>";
                            } else {
                                String an = request.getParameter("an");
                                message = "<center><h4 class='text-success'>Appointment confirmed successfully</h4></center>";
                                message1 = "<center><h5 class='text-success'>Your Appoinment number is "+an+"</h5></center>";
                            }
                            out.println(message);
                            out.println(message1);
                        }
                    %>
                    <div class="d-flex flex-wrap justify-content-start gap-3">
                        <%
                            String value = (String) session.getAttribute("username");

                            if (value == null) {
                                response.sendRedirect("../index.jsp");
                            }
                            
                            Schedule schedule = new Schedule();
                            List<Schedule> sch = schedule.getAllSchedules(DbConnector.getConnection());

                            for (Schedule s : sch) {
                        %>
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <form action="bookSession.jsp" method="GET">
                                    <h5 class="card-title"><%= s.getTitle()%></h5>
                                    <h6 class="card-subtitle mb-2 text-muted">Dr. <%= s.getFirstname()%> <%= s.getLastname()%></h6>
                                    <p class="card-text">Date : <%= s.getScheduledate()%></p>
                                    <p class="card-text">Starts at <%= s.getScheduletime()%></p>

                                    <input type="hidden" name="schedule_id" value="<%= s.getSchedule_id()%>"/>
                                    <input type="hidden" name="title" value="<%= s.getTitle()%>"/>
                                    <input type="hidden" name="firstname" value="<%= s.getFirstname()%>"/>
                                    <input type="hidden" name="lastname" value="<%= s.getLastname()%>"/>
                                    <input type="hidden" name="email" value="<%= s.getEmail()%>"/>
                                    <input type="hidden" name="scheduledate" value="<%= s.getScheduledate()%>"/>
                                    <input type="hidden" name="scheduletime" value="<%= s.getScheduletime()%>"/>
                                    <input type="hidden" name="fee" value="<%= s.getFee()%>"/>

                                    <button class="btn btn-outline-primary me-5 btn-hover-fill" type="submit"> Book</button>

                                </form>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    
                </div>

                <!--<td><button type="submit" name="action" value="delete_sch" class="btn btn-danger btn-sm">Delete</button></td>-->



            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>

    </body>
</html>
