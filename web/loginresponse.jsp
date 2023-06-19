<%@page import="dao.ParticipantDAO"%>
<%@page import="dao.CoordinatorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
    RequestDispatcher rd=null;
    System.out.println("Inside To JSP");
    String name=(String)request.getAttribute("name");
    String result=(String)request.getAttribute("userType");
    
    if(name!=null && result!=null)
    {
       HttpSession sess=request.getSession();
       sess.setAttribute("name",name);
       sess.setAttribute("email",(String)request.getAttribute("mail"));
       sess.setAttribute("userType",result.trim());
       String url="";
        if(result.equalsIgnoreCase("Admin"))
        {
            System.out.println("Inside Admin Login redirect");
            url="AdminControllerServlet;jsessionid="+sess.getId();
            out.print(url);
        }    
        else if(result.equalsIgnoreCase("Coordinator"))
        {
            sess.setAttribute("Cr_Id",CoordinatorDAO.getIdByMail((String)request.getAttribute("mail")));
            System.out.println("Inside Coordinator Login redirect");
            url="CoordinatorControllerServlet;jsessionid="+sess.getId(); 
            out.print(url);
        }
        else
        {
            sess.setAttribute("Pt_Id",ParticipantDAO.getIdByMail((String)request.getAttribute("mail")));
            System.out.println("Inside Participants Login redirect");
            url="ParticipantControllerServlet;jsessionid="+sess.getId(); 
            out.print(url);
        }
    }
    else
    {
      System.out.println("Inside Error JSP");
      out.print("error");
    }
%>