package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Neel_Esh
 */
public class ParticipantControllerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd=null;
        System.out.println("Inside Admin Controller servlet");
        HttpSession sess=request.getSession();
        System.out.println(sess);
        try
        {
            String userid=(String)sess.getAttribute("name");
            
            System.out.println(userid);
            if(userid==null)
            {
                sess.invalidate();
                response.sendRedirect("accessdenied.jsp");
                return;
            }
            rd=request.getRequestDispatcher("ParticipantOptions.jsp");
        }
        catch(Exception ex){
            ex.printStackTrace();
            rd=request.getRequestDispatcher("showexception.jsp");
            request.setAttribute("Exception",ex);
        }
        finally{
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
