
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@ page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String specialization = request.getParameter("specialization");
    String gender = request.getParameter("gender");
    String phone = request.getParameter("phone");
    String username = request.getParameter("username");

    // Validate phone number
    if (!phone.matches("0\\d{9}")) {
        response.sendRedirect("admin/doctor_add.jsp?s=2"); // Invalid phone number
    } else {
        User user = new User(firstname, lastname, specialization, gender, phone, username);
        Connection conn = null;
        try {
            conn = DbConnector.getConnection();
            if (user.adddoctor(conn)) {
                response.sendRedirect("admin/doctor_add.jsp?s=1"); // Success
            } else {
                response.sendRedirect("admin/doctor_add.jsp?s=0"); // Failed to add doctor
            }
        } catch (Exception e) {
            response.sendRedirect("admin/doctor_add.jsp?s=3"); // Database error
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    // Log the exception
                }
            }
        }
    }
%>