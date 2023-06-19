<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.QuestionDAO"%>
<%
    System.out.println("Inside Get All Questions by Contest_Id jsp");
    String userid=(String)session.getAttribute("name");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out1 = response.getWriter();     
    JSONArray jsonObj=QuestionDAO.getAllQuestionsByContestId(request.getParameter("Contest_Id").trim());
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