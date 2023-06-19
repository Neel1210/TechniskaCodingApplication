
package dao;

import dbUtil.DBConnection;
import dto.ParticipantDTO;
import dto.UserDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class ParticipantDAO {
    
    private static PreparedStatement ps;
    private static Statement st;
    
    public static String getNewId() throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("select count(*) from participants");
        ResultSet rs=ps.executeQuery();
        rs.next();
        int id=rs.getInt(1);
        ps=null;
        if(id==0)
        {
            return "BUIT_PT_101";
        }   
        else
        {
            return "BUIT_PT_"+(101+id);
        }
    }
    
    public static String addNewParticipant(ParticipantDTO pt)throws SQLException
    {
        //1st Query
        ps=DBConnection.getConnection().prepareStatement("insert into participants values(?,?,?,?,?,?)");
        ps.setString(1,pt.getId().trim());
        ps.setString(2,pt.getName().trim());
        ps.setString(3,pt.getMailId().trim().toUpperCase());
        ps.setString(4,pt.getMobile());
        ps.setInt(5,Integer.parseInt(pt.getSemester().trim()));
        ps.setString(6,pt.getBranch().trim());
        //ps.setString(7,pt.getStatus().trim());
        
        //2nd Query 
        boolean result2=UserDAO.addNewUser(new UserDTO(pt.getName().trim(),pt.getMailId().trim().toUpperCase(),pt.getMobile(),pt.getPassword(),pt.getUserType()));
        boolean result1=ps.executeUpdate()==1;
        ps=null;
        if(result1==result2)
            return "Success";
        else
            return "Failed";
    }
    
    public static String getIdByMail(String mail) throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("SELECT p.id\n" +
            "FROM participants p\n" +
            "where p.email=?");
        ps.setString(1, mail);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
            return rs.getString(1);
        return null;
    }
    
    public static String updateParticipant(ParticipantDTO pt)throws SQLException
    {
        //1st Query
        ps=DBConnection.getConnection().prepareStatement("update participants set name=?,semester=?,branch=? where email=?");
        ps.setString(1,pt.getName().trim());
        ps.setInt(2,Integer.parseInt(pt.getSemester().trim()));
        ps.setString(3,pt.getBranch().trim());
        ps.setString(4,pt.getMailId().toUpperCase().trim());
        
        //2nd Query 
        boolean result2=UserDAO.updateUser(new UserDTO(pt.getName().trim(),pt.getMailId().trim().toUpperCase(),pt.getMobile(),pt.getPassword(),pt.getUserType()));
        boolean result1=ps.executeUpdate()==1;
        ps=null;
        if(result1==result2)
            return "Success";
        else
            return "Failed";
    }
    
    public static ParticipantDTO getParticipantDetailsById(String id)throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("SELECT u.name,u.mobile,u.email,c.semester,c.branch\n" +
        "FROM users u\n" +
        "JOIN participants c ON u.email = c.email\n" +
        "WHERE c.id =? AND u.status != 'Un-Active'");
        
        ps.setString(1,id.toUpperCase());
        ResultSet rs=ps.executeQuery();
        ParticipantDTO pt=null;
        ps=null;
        if(rs.next())
        {
            pt=new ParticipantDTO();
            pt.setName(rs.getString(1));
            pt.setMobile(rs.getString(2));
            pt.setMailId(rs.getString(3));
            pt.setSemester(""+rs.getInt(4));
            pt.setBranch(rs.getString(5));
        }
        return pt;
    }
    
    public static JSONArray getAllParticipants()throws SQLException
    {
        Statement st=DBConnection.getConnection().createStatement();
        ResultSet rs=st.executeQuery("SELECT c.id,u.name,u.email,u.mobile,c.semester,c.branch\n" +
            "FROM users u\n" +
            "JOIN participants c ON u.email = c.email\n" +
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
    
    public static String removeParticipant(ParticipantDTO cr)throws SQLException
    {
        UserDTO user=new UserDTO();
        user.setMail(cr.getMailId().trim());
        user.setMobileNo(cr.getMobile().trim());
        return UserDAO.removeUser(user);
    }
}
