<%@page import="dto.ParticipantDTO"%>
<%@page import="dao.ParticipantDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>

<%
    System.out.println("Inside getParticipantRecord jsp");
    String userid=(String)session.getAttribute("name");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    String id;
    String type=request.getParameter("type");
    System.out.println(type);
    ParticipantDTO pt=null;
    if(type.equalsIgnoreCase("remove"))
    {
        id=request.getParameter("r_id").toUpperCase();
    } 
    else
    {   
        id=request.getParameter("u_id").toUpperCase();   
    }  
    pt= ParticipantDAO.getParticipantDetailsById(id);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out1 = response.getWriter();     
    JSONObject jsonObj=new JSONObject(); 
    if(pt==null)
    {
        jsonObj.put("pt_result","Not Found");
        out1.println(jsonObj.toString());
    }
    else
    {
        jsonObj.put("pt_id",id);
        jsonObj.put("pt_name", pt.getName());
        jsonObj.put("pt_mail", pt.getMailId());
        jsonObj.put("pt_mobile", pt.getMobile());
        jsonObj.put("pt_sem", "" + pt.getSemester());
        jsonObj.put("pt_branch", pt.getBranch());
        out1.println(jsonObj.toString());
        jsonObj.toJSONString();
    }
    out1.flush();    
%>