
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String phone = request.getParameter("phone");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String role = request.getParameter("role");

    // Validation
    if (!password.equals(confirmPassword)) {
        response.sendRedirect("sign_up.jsp?s=2"); // Passwords don't match
    } else if (password.length() < 6) {
        response.sendRedirect("sign_up.jsp?s=3"); // Password too short
    } else if (!phone.matches("0\\d{9}")) {
        response.sendRedirect("sign_up.jsp?s=4"); // Invalid phone number
    } else {
        User user = new User(firstname, lastname, username, password, phone, gender, dob);
        Connection conn = null;
        try {
            conn = DbConnector.getConnection();
            if (user.register(conn)) {
                session.setAttribute("username", username);
                response.sendRedirect("sign_up.jsp?s=1"); // Success
            } else {
                response.sendRedirect("sign_up.jsp?s=0"); // Registration failed
            }
        } catch (Exception e) {
            response.sendRedirect("sign_up.jsp?s=5"); // Database error
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