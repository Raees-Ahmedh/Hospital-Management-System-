
<%@page import="app.classes.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HABS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >

    </head>
    <body>
        <style>
            .card.cascading-right {
                background: hsla(0, 0%, 100%, 0.8); /* Slightly increase transparency for readability */
                backdrop-filter: blur(10px); /* Blur the background behind the card */
            }
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
                <% String value = (String) session.getAttribute("username");

                    if (value == null) {
                        response.sendRedirect("../index.jsp");
                    }

                    String query = "SELECT * FROM doctor";
                    Connection con = DbConnector.getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                %>
                <div  class="card-body p-5 shadow-5 text-center">
                    <h1>Doctors</h1>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Doctor Name</th>
                            <th scope="col">Specialization</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                        </tr>
                        <% while (rs.next()) {
                                String doctorName = rs.getString("firstname") + " " + rs.getString("lastname");
                        %>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%= doctorName%></td>
                            <td><%= rs.getString("specialization")%></td>
                            <td><%= rs.getString("gender")%></td>
                            <td><%= rs.getString("phone")%></td>
                            <td><%= rs.getString("email")%></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>


                
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>

    </body>
</html>
