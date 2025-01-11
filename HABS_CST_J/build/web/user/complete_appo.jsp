
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

        String p = request.getParameter("patient_id");
        int intp = Integer.parseInt(p);
        String s = request.getParameter("schedule_id");
        int ints = Integer.parseInt(s);
        String d = request.getParameter("date");
        Appointment a = new Appointment(ints, intp, d);
        int ap = a.addAppointment(DbConnector.getConnection());
        if (ap!=-1) {
            response.sendRedirect("sessions.jsp?s=1&an="+ap);
        } else {
            response.sendRedirect("sessions.jsp?s=0");
        }



%>