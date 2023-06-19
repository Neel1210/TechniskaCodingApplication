<%
    String userid=(String)session.getAttribute("name");
    if(userid==null){
        session.invalidate();
        response.sendRedirect("accessdenied.jsp");
    }
    out.print("Record Already Deleted");
%>