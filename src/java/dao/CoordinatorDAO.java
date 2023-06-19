/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbUtil.DBConnection;
import dto.CoordinatorDTO;
import dto.UserDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class CoordinatorDAO {
    
    private static PreparedStatement ps;
    private static Statement st;
    
    public static String getNewId() throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("select count(*) from coordinators");
        ResultSet rs=ps.executeQuery();
        rs.next();
        int id=rs.getInt(1);
        ps=null;
        if(id==0)
        {
            return "BUIT_CR_101";
        }   
        else
        {
            return "BUIT_CR_"+(101+id);
        }
    }
    
    public static String getIdByMail(String mail) throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("SELECT c.id\n" +
            "FROM coordinators c\n" +
            "where c.email=?");
        ps.setString(1, mail);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
            return rs.getString(1);
        return null;
    }
    
    public static String addNewCoordintaor(CoordinatorDTO cr)throws SQLException
    {
        //1st Query
        ps=DBConnection.getConnection().prepareStatement("insert into coordinators values(?,?,?,?,?,?)");
        ps.setString(1,cr.getId().trim());
        ps.setString(2,cr.getName().trim());
        ps.setString(3,cr.getMailId().trim().toUpperCase());
        ps.setString(4,cr.getMobile());
        ps.setInt(5,Integer.parseInt(cr.getSemester().trim()));
        ps.setString(6,cr.getBranch().trim());
        //ps.setString(7,cr.getStatus().trim());
        
        //2nd Query 
        boolean result2=UserDAO.addNewUser(new UserDTO(cr.getName().trim(),cr.getMailId().trim().toUpperCase(),cr.getMobile(),cr.getPassword(),cr.getUserType()));
        boolean result1=ps.executeUpdate()==1;
        ps=null;
        if(result1==result2)
            return "Success";
        else
            return "Failed";
    }
    
    public static String updateCoordintaor(CoordinatorDTO cr)throws SQLException
    {
        //1st Query
        ps=DBConnection.getConnection().prepareStatement("update coordinators set name=?,semester=?,branch=? where email=?");
        ps.setString(1,cr.getName().trim());
        ps.setInt(2,Integer.parseInt(cr.getSemester().trim()));
        ps.setString(3,cr.getBranch().trim());
        ps.setString(4,cr.getMailId().toUpperCase().trim());
        
        //2nd Query 
        boolean result2=UserDAO.updateUser(new UserDTO(cr.getName().trim(),cr.getMailId().trim().toUpperCase(),cr.getMobile(),cr.getPassword(),cr.getUserType()));
        boolean result1=ps.executeUpdate()==1;
        ps=null;
        if(result1==result2)
            return "Success";
        else
            return "Failed";
    }
    
    public static CoordinatorDTO getCoordinatorDetailsById(String id)throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("SELECT u.name,u.mobile,u.email,c.semester,c.branch\n" +
        "FROM users u\n" +
        "JOIN coordinators c ON u.email = c.email\n" +
        "WHERE c.id =? AND u.status != 'Un-Active'");
        
        ps.setString(1,id.toUpperCase());
        ResultSet rs=ps.executeQuery();
        CoordinatorDTO cr=null;
        ps=null;
        if(rs.next())
        {
            cr=new CoordinatorDTO();
            cr.setName(rs.getString(1));
            cr.setMobile(rs.getString(2));
            cr.setMailId(rs.getString(3));
            cr.setSemester(""+rs.getInt(4));
            cr.setBranch(rs.getString(5));
        }
        return cr;
    }
    
    public static JSONArray getAllCoordinators()throws SQLException
    {
        Statement st=DBConnection.getConnection().createStatement();
        ResultSet rs=st.executeQuery("SELECT c.id,u.name,u.email,u.mobile,c.semester,c.branch\n" +
            "FROM users u\n" +
            "JOIN coordinators c ON u.email = c.email\n" +
            "WHERE u.status != 'Un-Active' order by c.id");
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {
            JSONObject json1=new JSONObject();
            json1.put("ID",rs.getString(1));
            json1.put("Name",rs.getString(2));
            json1.put("Email",rs.getString(3));
            json1.put("Mobile",rs.getString(4));
            json1.put("Semester",rs.getInt(5));
            json1.put("Branch",rs.getString(6));
            jsonArr.add((JSONObject)json1);
            
            System.out.println(json1.toString());
        }
        System.out.println("Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
    public static String removeCoordinator(CoordinatorDTO cr)throws SQLException
    {
        UserDTO user=new UserDTO();
        user.setMail(cr.getMailId().trim());
        user.setMobileNo(cr.getMobile().trim());
        return UserDAO.removeUser(user);
    }
}
