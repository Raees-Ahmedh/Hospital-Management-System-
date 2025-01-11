
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Schedule"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("docid");
    int doctor_id = Integer.parseInt(id);
    
    String title = request.getParameter("title");
    String scheduledate = request.getParameter("date");
    String scheduletime = request.getParameter("time");
    
    String n = request.getParameter("nop");
    int nop = Integer.parseInt(n);
    
    String f = request.getParameter("fee");
    float fee = Float.parseFloat(f);

    Schedule s = new Schedule(doctor_id, title, scheduledate, scheduletime, nop, fee);
    if (s.addSchedule(DbConnector.getConnection())) {

        response.sendRedirect("all_doctors.jsp?s=1");
    } else {
        response.sendRedirect("all_doctors.jsp?s=0");
    }

%>