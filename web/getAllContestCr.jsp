<%@page import="dao.ContestDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%
    String userid=(String)session.getAttribute("name");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out1 = response.getWriter();   
    System.out.println("The cr value is --> "+request.getParameter("cr_id").trim());
    JSONArray jsonObj=ContestDAO.getAllContestForCr(request.getParameter("cr_id"));
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