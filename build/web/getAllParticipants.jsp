<%@page import="dao.ParticipantDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%
    System.out.println("Inside getAllparticipants jsp");
    String userid=(String)session.getAttribute("name");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out1 = response.getWriter();     
    JSONArray jsonObj=ParticipantDAO.getAllParticipants();
    if(jsonObj.isEmpty())
    {
        out1.print("{\"Result\":\"Empty\"}");
    }    
    else
    {
        out1.print(jsonObj.toString());
    }
    out1.flush();    
%>