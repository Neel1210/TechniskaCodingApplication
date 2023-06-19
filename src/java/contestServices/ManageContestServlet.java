package contestServices;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManageContestServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        RequestDispatcher rd = null;
        
        HttpSession sess = request.getSession();
        String userid = (String) sess.getAttribute("name");
        if (userid == null) {
            sess.invalidate();
            response.sendRedirect("accessdenied.jsp");
        }

        String requestByClient = (String)request.getParameter("request");
        System.out.println("Inside Manage Contest\nRequest Type - "+requestByClient);

        try 
        {
            switch(requestByClient)
            {
                case "Add":
                    rd = ManageContest.addContest(request, response, sess);
                    break;
                case "startContest":
                    rd = ManageContest.startContest(request, response, sess);
                    break;
                case "GetAllContest": // For Admin
                    rd = ManageContest.getAllContestForAdmin(request, response, sess);
                    break;
                case "GetAllActiveContest": // For Admin
                    rd = ManageContest.getAllActiveContestForAdmin(request, response, sess);
                    break;
                case "GetAllContestForCr": // For Coordinator
                    rd = ManageContest.getAllContestForCr(request, response, sess);
                    break;
                case "GetAllActiveContestForCr": // For Coordinator
                    rd = ManageContest.getAllActiveContestForCr(request, response, sess);
                    break;
                case "GetAllContestForPt": // For Coordinator
                    rd = ManageContest.getAllContestForPt(request, response, sess);
                    break;
                case "GetAllActiveContestForPt": // For Coordinator
                    rd = ManageContest.getAllActiveContestForPt(request, response, sess);
                    break;
                case "registerParticipantInContest": // Register Participant in Contest
                    rd = ManageContest.registerParticipantInContest(request, response, sess);
                    break;
                case "removeParticipantFromContest": // Remove Participant in Contest
                    rd = ManageContest.removeParticipantFromContest(request, response, sess);
                    break;
                case "registerCoordinatorInContest": // Register Coordinator in Contest
                    rd = ManageContest.registerCoordinatorInContest(request, response, sess);
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
    }
}
