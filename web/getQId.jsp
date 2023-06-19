<%@page import="dao.QuestionDAO"%>
<%
    System.out.println("Inside QId jsp");
    String userid=(String)session.getAttribute("name");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    out.print(QuestionDAO.getNewQuestionId(request.getParameter("Contest_Id").trim()));
%>