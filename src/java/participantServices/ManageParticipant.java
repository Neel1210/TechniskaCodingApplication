package participantServices;

import dao.ParticipantDAO;
import dto.ParticipantDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManageParticipant 
{
    
    private ManageParticipant()
    {
        
    }
    
    public static RequestDispatcher addParticipant(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        ParticipantDTO pt = new ParticipantDTO();
        pt.setId(request.getParameter("id").trim());
        pt.setName(request.getParameter("name").trim());
        pt.setMailId(request.getParameter("email").trim().toUpperCase());
        pt.setMobile(request.getParameter("mobile").trim());
        pt.setPassword(request.getParameter("password").trim());
        pt.setBranch(request.getParameter("branch").trim());
        pt.setSemester(request.getParameter("semester").trim());
        pt.setStatus("Active");
        pt.setUserType("Participant");
        if(ParticipantDAO.addNewParticipant(pt).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        }
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher removeParticipant(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        ParticipantDTO pt = new ParticipantDTO();
        pt.setId(request.getParameter("r_id").trim());
        pt.setName(request.getParameter("r_name").trim());
        pt.setMailId(request.getParameter("r_email").trim().toUpperCase());
        pt.setMobile(request.getParameter("r_mobile").trim());
        if(ParticipantDAO.removeParticipant(pt).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        }
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher updateParticipant(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        ParticipantDTO pt = new ParticipantDTO();
        pt.setId(request.getParameter("u_id").trim());
        pt.setName(request.getParameter("u_name").trim());
        pt.setMailId(request.getParameter("u_email").trim().toUpperCase());
        pt.setMobile(request.getParameter("u_mobile").trim());
        pt.setPassword(request.getParameter("u_password").trim());
        pt.setBranch(request.getParameter("u_branch").trim());
        pt.setSemester(request.getParameter("u_semester").trim());
        if(ParticipantDAO.updateParticipant(pt).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        }
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher getAllParticipants(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllParticipants.jsp");
    }
    
    public static RequestDispatcher getParticipantDetailsById(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getParticipantRecord.jsp");
    }
}
