<%
    String userid=(String)session.getAttribute("userid");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    out.println("failed");
%>