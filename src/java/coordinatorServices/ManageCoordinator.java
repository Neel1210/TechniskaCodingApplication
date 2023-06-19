package coordinatorServices;

import dao.CoordinatorDAO;
import dto.CoordinatorDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManageCoordinator {
 
    private ManageCoordinator()
    {
        
    }
    
    public static RequestDispatcher addCoordinator(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        CoordinatorDTO cr = new CoordinatorDTO();
        cr.setId(request.getParameter("id").trim());
        cr.setName(request.getParameter("name").trim());
        cr.setMailId(request.getParameter("email").trim().toUpperCase());
        cr.setMobile(request.getParameter("mobile").trim());
        cr.setPassword(request.getParameter("password").trim());
        cr.setBranch(request.getParameter("branch").trim());
        cr.setSemester(request.getParameter("semester").trim());
        cr.setStatus("Active");
        cr.setUserType("Coordinator");
        if (CoordinatorDAO.addNewCoordintaor(cr).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher updateCoordinator(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        CoordinatorDTO cr = new CoordinatorDTO();
        cr.setId(request.getParameter("u_id").trim());
        cr.setName(request.getParameter("u_name").trim());
        cr.setMailId(request.getParameter("u_email").trim().toUpperCase());
        cr.setMobile(request.getParameter("u_mobile").trim());
        cr.setPassword(request.getParameter("u_password").trim());
        cr.setBranch(request.getParameter("u_branch").trim());
        cr.setSemester(request.getParameter("u_semester").trim());
        if (CoordinatorDAO.updateCoordintaor(cr).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher removeCoordinator(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        CoordinatorDTO cr = new CoordinatorDTO();
        cr.setId(request.getParameter("r_id").trim());
        cr.setName(request.getParameter("r_name").trim());
        cr.setMailId(request.getParameter("r_email").trim().toUpperCase());
        cr.setMobile(request.getParameter("r_mobile").trim());
        if (CoordinatorDAO.removeCoordinator(cr).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher getAllCoordinator(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllCoordinators.jsp");
    }
    
    public static RequestDispatcher getCoordinatorDetailsById(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getCoordinatorRecord.jsp");
    }
}
