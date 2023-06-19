<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.CoordinatorDAO"%>
<%@page import="dto.CoordinatorDTO"%>
<%
    System.out.println("Inside getCoordinatorRecord jsp");
    String userid=(String)session.getAttribute("name");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    String id;
    String type=request.getParameter("type");
    System.out.println(type);
    CoordinatorDTO cr=null;
    if(type.equalsIgnoreCase("remove"))
    {
        id=request.getParameter("r_id").toUpperCase();
        cr= CoordinatorDAO.getCoordinatorDetailsById(id);
    } 
    else
    {   
        id=request.getParameter("u_id").toUpperCase();
        cr= CoordinatorDAO.getCoordinatorDetailsById(id);
    }  
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out1 = response.getWriter();     
    JSONObject jsonObj=new JSONObject(); 
    if(cr==null)
    {
        jsonObj.put("cr_result","Not Found");
        out1.println(jsonObj.toString());
    }
    else
    {
        jsonObj.put("cr_id",id);
        jsonObj.put("cr_name", cr.getName());
        jsonObj.put("cr_mail", cr.getMailId());
        jsonObj.put("cr_mobile", cr.getMobile());
        jsonObj.put("cr_sem", "" + cr.getSemester());
        jsonObj.put("cr_branch", cr.getBranch());
        out1.println(jsonObj.toString());
        jsonObj.toJSONString();
    }
    out1.flush();    
%>