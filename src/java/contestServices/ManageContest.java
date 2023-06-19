/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contestServices;

import dao.ContestDAO;
import dao.CoordinatorDAO;
import dto.ContestDTO;
import dto.CoordinatorDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Neel_Esh
 */
public class ManageContest 
{    
    private ManageContest()
    {
        
    }
    
    public static RequestDispatcher addContest(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        ContestDTO contest = new ContestDTO();
        contest.setId(request.getParameter("id").trim());
        contest.setLevels(Integer.parseInt(request.getParameter("level").trim()));
        contest.setNo_of_participants(0);
        contest.setWinner("To Be Declared");
        contest.setStatus("On_Progress");
        if (ContestDAO.addNewContest(contest).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher startContest(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        String contestId=request.getParameter("contestId").trim();
        String status=request.getParameter("status").trim();
        int level=Integer.parseInt(request.getParameter("level").trim());
        
        if(ContestDAO.startContest(contestId, status, level).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else if(ContestDAO.startContest(contestId, status, level).equals("Failed")) 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
        else
        {
            return request.getRequestDispatcher("noMoreLevel.jsp");
        }
    }
    
    //For Admin
    public static RequestDispatcher getAllActiveContestForAdmin(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllActiveContest.jsp");
    }
    
    public static RequestDispatcher getAllContestForAdmin(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllContest.jsp");
    }
    
    //For Coordinator
    public static RequestDispatcher getAllActiveContestForCr(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllActiveContestCr.jsp");
    }
  
    public static RequestDispatcher getAllContestForCr(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllContestCr.jsp");
    }


    //For Participant
    public static RequestDispatcher getAllActiveContestForPt(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllActiveContestPt.jsp");
    }
  
    public static RequestDispatcher getAllContestForPt(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getAllContestPt.jsp");
    }    
    
    // Register & Remove In Coontest -->
    
    public static RequestDispatcher registerCoordinatorInContest(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        String result=ContestDAO.registerCoordinatorInContest(request.getParameter("c_id").trim(),request.getParameter("cr_id").trim());
        if(result.equals("Success"))
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else if(result.equals("Already Registered"))
        {
            return request.getRequestDispatcher("RecordAlreadyPresent.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher removeCoordinatorFromContest(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        String result=ContestDAO.removeCoordinatorFromContest(request.getParameter("c_id").trim(),request.getParameter("cr_id").trim());
        if(result.equals("Success"))
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else if(result.equals("Already Deleted"))
        {
            return request.getRequestDispatcher("RecordAlreadyDeleted.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher registerParticipantInContest(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        String result=ContestDAO.registerParticipantInContest(request.getParameter("c_id").trim(),request.getParameter("p_id").trim());
        if(result.equals("Success"))
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else if(result.equals("Already Registered"))
        {
            return request.getRequestDispatcher("RecordAlreadyPresent.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher removeParticipantFromContest(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        String result=ContestDAO.removeParticipantFromContest(request.getParameter("c_id").trim(),request.getParameter("p_id").trim());
        if(result.equals("Success"))
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else if(result.equals("Already Deleted"))
        {
            return request.getRequestDispatcher("RecordAlreadyDeleted.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
}
