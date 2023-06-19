/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resultServices;

import dao.ResultDAO;
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
public class ManageResult {
    
    private ManageResult()
    {
        
    }
    
    public static RequestDispatcher checkForNextLevel(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException,SQLException
    {
        String cId,pId,status;
        int level,level1;
        cId=request.getParameter("cId").trim();
        pId=request.getParameter("pId").trim();
        level=Integer.parseInt(request.getParameter("level").trim());
        status=request.getParameter("status").trim();
        
        if (ResultDAO.checkForNextLevel(cId, pId, level, status).equals("Success")) 
        {
            return request.getRequestDispatcher("success.jsp");
        } 
        else 
        {
            return request.getRequestDispatcher("failure.jsp");
        }
    }
}
