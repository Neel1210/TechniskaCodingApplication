package dao;

import dbUtil.DBConnection;
import dto.CoordinatorDTO;
import dto.UserDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    
    private static PreparedStatement ps;

    private static UserDTO setdata(UserDTO user,ResultSet rs)throws SQLException
    {
        user.setName(rs.getString(1));
        user.setMail(rs.getString(2)); 
        user.setMobileNo(rs.getString(3));
        user.setPassword("");
        user.setUserType(rs.getString(5));
        return user;
    }
    
    public static boolean addNewUser(UserDTO user) throws SQLException
    {
        ps = DBConnection.getConnection().prepareStatement("insert into users values(?,?,?,?,?,?)");
        ps.setString(1, user.getName());
        ps.setString(2, user.getMail().toUpperCase().trim());
        ps.setString(3, user.getMobileNo());
        ps.setString(4, user.getPassword());
        ps.setString(5, user.getUserType());
        ps.setString(6,"Active");
        return 1== ps.executeUpdate();
    }
    
    public static boolean updateUser(UserDTO user) throws SQLException
    {
        ps = DBConnection.getConnection().prepareStatement("update users set name=?,password=? where email=?");
        ps.setString(1, user.getName());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getMail().toUpperCase().trim());
        return 1== ps.executeUpdate();
    }
    
    public static UserDTO validateUser(UserDTO user) throws SQLException {
        ps = DBConnection.getConnection().prepareStatement("select * from users where email=? and password=? and status='Active'");
        ps.setString(1, user.getMail().toUpperCase().trim());
        ps.setString(2, user.getPassword());
        ResultSet rs = ps.executeQuery();
        ps=null;
        if(rs.next()) {
            setdata(user, rs);
            return user;
        }
        return null;
    }
    
    public static String removeUser(UserDTO user)throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("update users set status='Un-Active' where email=? and mobile=?");
        ps.setString(1,user.getMail().trim());
        ps.setString(2,user.getMobileNo());
        if(1==ps.executeUpdate())
            return "Success";
        return "Failed";  
    }
}
