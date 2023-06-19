
package controller;


import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginControllerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("Inside servlet");
        RequestDispatcher rd=null;
        
        String userid=request.getParameter("userid");
        String password=request.getParameter("password");
        
        userid=userid.toUpperCase().trim();
        
        UserDTO user=new UserDTO(userid,password);
        try
        {
            user = UserDAO.validateUser(user);
            
            if(user==null)
            {
                request.setAttribute("result","error");
                rd=request.getRequestDispatcher("loginresponse.jsp");
            }
            else{
                request.setAttribute("name",user.getName());
                request.setAttribute("mail",user.getMail());
                request.setAttribute("mobile",user.getMobileNo());
                request.setAttribute("result",user.getUserType());
                request.setAttribute("userType",user.getUserType());
                rd=request.getRequestDispatcher("loginresponse.jsp");
            }    
        }
        catch(Exception ex){
           ex.printStackTrace();
           rd=request.getRequestDispatcher("showexception.jsp");
           request.setAttribute("Exception",ex);
        }
        finally{
            rd.forward(request,response);
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
