
<%@page import="app.classes.Function"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String apid = request.getParameter("appointment_id");
    String did = request.getParameter("doctor_id");
    
    int appointment_id = (apid != null && !apid.isEmpty()) ? Integer.parseInt(apid) : 0;
    int doctor_id = (did != null && !did.isEmpty()) ? Integer.parseInt(did) : 0;
    
    
    if("delete_apo".equals(request.getParameter("action"))){
        
        Function function = new Function(appointment_id);
        if(function.deleteappointment(DbConnector.getConnection())){
            response.sendRedirect("admin/manage_appointment.jsp?s=1");
        } else {
            response.sendRedirect("admin/manage_appointment.jsp?s=0");
        } 
        
    } 
%>