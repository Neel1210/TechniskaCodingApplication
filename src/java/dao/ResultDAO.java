/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbUtil.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Neel_Esh
 */
public class ResultDAO {
    private static PreparedStatement ps;
    private static Statement st;
    
    private ResultDAO()
    {
        
    }
    
    public static String checkForNextLevel(String cId,String ptId,int level,String status)throws SQLException
    {
        int level1=Integer.parseInt(status.replaceAll("\\D",""))-1;
        ps = DBConnection.getConnection().prepareStatement("select result from results where participant_id=? and contest_id=? and levels=?");
        ps.setString(1, ptId);
        ps.setString(2, cId);
        ps.setInt(3, level1);
        ResultSet rs= ps.executeQuery();
        if(rs.next())
        {
            if(rs.getString(1).equalsIgnoreCase("Pass"))
                return "Success";
        }
        return "Failed";
    }
}
