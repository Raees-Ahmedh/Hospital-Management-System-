
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username.equals("habs@gmail.com")) {
        User user = new User(username, password);
        if (user.authenticateAdmin(DbConnector.getConnection())) {
            session.setAttribute("admin", username);
            response.sendRedirect("admin/doctor_add.jsp");
        } else {
            response.sendRedirect("index.jsp?s=0");
        }
    } else {
        User user = new User(username, password);
        if (user.authenticate(DbConnector.getConnection())) {    
            session.setAttribute("username", username);
            String pid = String.valueOf(user.getId());
            session.setAttribute("patient_id", pid);
            response.sendRedirect("user/index.jsp");
        } else {
            response.sendRedirect("index.jsp?s=0");
        }
    }
%>
