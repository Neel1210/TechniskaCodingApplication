/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package questionServices;

import dao.QuestionDAO;
import dto.QuestionDTO;
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
public class ManageQuestion {
    private ManageQuestion()
    {
        
    }
    
    public static RequestDispatcher addQuestion(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        QuestionDTO que = new QuestionDTO();
        que.setContestId(request.getParameter("contestId").trim());
        que.setQuestionId(request.getParameter("questionId").trim());
        que.setQueTitle(request.getParameter("qTitle").trim());
        que.setQuestion(request.getParameter("question").trim());
        que.setTestCases(request.getParameter("testCase").trim());
        que.setLevels(0);        
        if (QuestionDAO.addNewQuestion(que).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher editQuestion(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        QuestionDTO que = new QuestionDTO();
        que.setContestId(request.getParameter("contestId").trim());
        que.setQuestionId(request.getParameter("questionId").trim());
        que.setQueTitle(request.getParameter("qTitle").trim());
        que.setQuestion(request.getParameter("question").trim());
        que.setTestCases(request.getParameter("testCase").trim());
        que.setLevels(0);        
        if (QuestionDAO.editQuestion(que).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
    
    public static RequestDispatcher getQuestionId(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getQId.jsp");
    }
    
    public static RequestDispatcher getQuestionById(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getQuestionById.jsp");
    }
    
    public static RequestDispatcher getAllQuestionByContestId(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        return request.getRequestDispatcher("getQuestionsByContestId.jsp");
    }
}
