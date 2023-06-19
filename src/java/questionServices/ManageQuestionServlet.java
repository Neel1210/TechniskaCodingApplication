package questionServices;

import contestServices.ManageContest;
import java.io.IOException;
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
public class ManageQuestionServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        RequestDispatcher rd=null;
        HttpSession sess=request.getSession();
        String userid=(String)sess.getAttribute("name");
        if(userid==null)
        {
            sess.invalidate();
            response.sendRedirect("accessdenied.jsp");
        }
        
        String requestByClient=(String)request.getParameter("request");
        System.out.println("Inside Manage Question Servlet\nRequest Type - "+requestByClient);
        
         try 
        {
            switch(requestByClient)
            {
                case "Add":
                    rd = ManageQuestion.addQuestion(request, response, sess);
                    break;
                case "Edit":
                    rd = ManageQuestion.editQuestion(request, response, sess);
                    break;
                case "CheckQA": 
                    rd = ManageQuestion.getQuestionId(request, response, sess);
                    break;
                case "GetAllQuestions": 
                    rd = ManageQuestion.getAllQuestionByContestId(request, response, sess);
                    break;
                case "GetQuestionByQId":
                    rd = ManageQuestion.getQuestionById(request, response, sess);
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
    }// </editor-fold>

}
