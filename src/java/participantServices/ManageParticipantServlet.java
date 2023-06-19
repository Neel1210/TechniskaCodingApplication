package participantServices;

import coordinatorServices.ManageCoordinator;
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
public class ManageParticipantServlet extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd=null;
        HttpSession sess=request.getSession();
        String userid=(String)sess.getAttribute("name");
        if(userid==null){
            sess.invalidate();
            response.sendRedirect("acessdenied.html");
        }
        
        String requestByClient=(String)request.getParameter("request");
        System.out.println("Inside Manage Participant\nRequest Type - "+requestByClient);
        
        try 
        {
            switch(requestByClient)
            {
                case "Add":
                    rd = ManageParticipant.addParticipant(request, response, sess);
                    break;
                case "Update": 
                    rd = ManageParticipant.updateParticipant(request, response, sess);
                    break;
                case "Remove": 
                    rd = ManageParticipant.removeParticipant(request, response, sess);
                    break;
                case "getRecord": 
                    rd = ManageParticipant.getParticipantDetailsById(request, response, sess);
                    break;
                case "GetAllParticipant": 
                    rd = ManageParticipant.getAllParticipants(request, response, sess);
                    break;  
            }    
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
            rd = request.getRequestDispatcher("showexception.jsp");
            request.setAttribute("Exception", ex);
        } 
        finally 
        {
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
