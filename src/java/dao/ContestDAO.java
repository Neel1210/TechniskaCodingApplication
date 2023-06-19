package dao;

import dbUtil.DBConnection;
import dto.ContestDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class ContestDAO {
    private static PreparedStatement ps;
    private static Statement st;
    
    public static String addNewContest(ContestDTO contest) throws SQLException
    {
        ps = DBConnection.getConnection().prepareStatement("insert into Contest values(?,?,?,?,?)");
        ps.setString(1, contest.getId());
        ps.setInt(2, contest.getLevels());
        ps.setInt(3, contest.getNo_of_participants());
        ps.setString(4,contest.getWinner());
        ps.setString(5,contest.getStatus());
        int result= ps.executeUpdate();
        if(result==1)
            return "Success";
        else
            return "Failed"; 
    }
    
    public static String getNewId() throws SQLException
    {   String year=""+(new Date().getYear()+1900);
        ps=DBConnection.getConnection().prepareStatement("select count(*) from Contest where contestid like '%"+year+"%'");
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            return "BUIT_CODING_"+year+"_"+(rs.getInt(1)+1);    
        }
        return "BUIT_CODING_"+year+"_1";
    }
    
    // For Admin
    
    public static JSONArray getAllContestForAdmin()throws SQLException
    {
        Statement st=DBConnection.getConnection().createStatement();
        ResultSet rs=st.executeQuery("select * from Contest order by contestid");
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {   
            JSONObject json1=new JSONObject();
            json1.put("ID",rs.getString(1));
            json1.put("Levels",rs.getInt(2));
            json1.put("No_of_participants",rs.getInt(3));
            json1.put("Winner",rs.getString(4));
            json1.put("Status",rs.getString(5));
            jsonArr.add((JSONObject)json1);
            System.out.println(json1.toString());
        }
        System.out.println("Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
    public static JSONArray getAllActiveContestForAdmin()throws SQLException
    {
        Statement st=DBConnection.getConnection().createStatement();
        ResultSet rs=st.executeQuery("select * from Contest where status <> 'Completed' order by contestid");
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {   
            JSONObject json1=new JSONObject();
            json1.put("ID",rs.getString(1));
            json1.put("Levels",rs.getInt(2));
            json1.put("No_of_participants",rs.getInt(3));
            json1.put("Winner",rs.getString(4));
            json1.put("Status",rs.getString(5));
            jsonArr.add((JSONObject)json1);
            System.out.println(json1.toString());
        }
        System.out.println("Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
    //For Coordinators
    
    public static JSONArray getAllContestForCr(String crId)throws SQLException
    {
        System.out.println("Inside Dao 2 --> "+crId);
        ps=DBConnection.getConnection().prepareStatement("SELECT * \n" +
            "FROM Contest \n" +
            "WHERE CONTESTID IN (\n" +
            "  SELECT CONTEST_ID \n" +
            "  FROM Contest_coordinators \n" +
            "  WHERE COORDINATOR_ID =?\n" +
            ") order by contestid");
        ps.setString(1,crId.trim());
        ResultSet rs=ps.executeQuery();
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {   
            JSONObject json1=new JSONObject();
            json1.put("ID",rs.getString(1));
            json1.put("Levels",rs.getInt(2));
            json1.put("No_of_participants",rs.getInt(3));
            json1.put("Winner",rs.getString(4));
            json1.put("Status",rs.getString(5));
            jsonArr.add((JSONObject)json1);
            System.out.println(json1.toString());
        }
        System.out.println("Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
    public static JSONArray getAllActiveContestForCr(String crId)throws SQLException
    {   
        System.out.println("Inside Dao 1 --> "+crId);
        ps=DBConnection.getConnection().prepareStatement("SELECT * \n" +
            "FROM Contest \n" +
            "WHERE CONTESTID IN (\n" +
            "  SELECT CONTEST_ID \n" +
            "  FROM Contest_coordinators \n" +
            "  WHERE COORDINATOR_ID =? and status <> 'Completed'\n"  +
            ") order by contestid");
        ps.setString(1, crId.trim());
        ResultSet rs=ps.executeQuery();
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {   
            JSONObject json1=new JSONObject();
            json1.put("ID",rs.getString(1));
            json1.put("Levels",rs.getInt(2));
            json1.put("No_of_participants",rs.getInt(3));
            json1.put("Winner",rs.getString(4));
            json1.put("Status",rs.getString(5));
            jsonArr.add((JSONObject)json1);
            System.out.println(json1.toString());
        }
        System.out.println("Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
     //For Participant
    
    public static JSONArray getAllContestForPt(String ptId)throws SQLException
    {
        System.out.println("Inside Dao 2 --> "+ptId);
        ps=DBConnection.getConnection().prepareStatement("SELECT * \n" +
            "FROM Contest \n" +
            "WHERE CONTESTID IN (\n" +
            "  SELECT CONTEST_ID \n" +
            "  FROM Contest_participants \n" +
            "  WHERE participant_ID =?\n" +
            ") order by contestid");
        ps.setString(1,ptId.trim());
        ResultSet rs=ps.executeQuery();
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {   
            JSONObject json1=new JSONObject();
            json1.put("ID",rs.getString(1));
            json1.put("Levels",rs.getInt(2));
            json1.put("No_of_participants",rs.getInt(3));
            json1.put("Winner",rs.getString(4));
            json1.put("Status",rs.getString(5));
            jsonArr.add((JSONObject)json1);
            System.out.println(json1.toString());
        }
        System.out.println("Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
    public static JSONArray getAllActiveContestForPt(String ptId)throws SQLException
    {   
        System.out.println("Inside Dao 1 --> "+ptId);
        ps=DBConnection.getConnection().prepareStatement("SELECT * \n" +
            "FROM Contest \n" +
            "WHERE CONTESTID IN (\n" +
            "  SELECT CONTEST_ID \n" +
            "  FROM Contest_participants \n" +
            "  WHERE participant_ID =? and status <> 'Completed'\n"  +
            ") order by contestid");
        ps.setString(1, ptId.trim());
        ResultSet rs=ps.executeQuery();
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {   
            JSONObject json1=new JSONObject();
            json1.put("ID",rs.getString(1));
            json1.put("Levels",rs.getInt(2));
            json1.put("No_of_participants",rs.getInt(3));
            json1.put("Winner",rs.getString(4));
            json1.put("Status",rs.getString(5));
            jsonArr.add((JSONObject)json1);
            System.out.println(json1.toString());
        }
        System.out.println("Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
    
    
    //For Regiser Coordinator & Participant in Contest
    
    public static String registerParticipantInContest(String cId,String pId)throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("select * from contest_participants where contest_id=? and participant_id=?");
        ps.setString(1, cId);
        ps.setString(2, pId);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            return "Already Registered";
        }
        
        ps=DBConnection.getConnection().prepareStatement("insert into contest_participants values(?,?)");
        ps.setString(1, cId);
        ps.setString(2, pId);
        int result=ps.executeUpdate();
        if(result==1)
            return "Success";
        else
            return "Failed";    
    }
    
    public static String removeParticipantFromContest(String cId,String pId)throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("select * from contest_participants where contest_id=? and participant_id=?");
        ps.setString(1, cId);
        ps.setString(2, pId);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            ps=DBConnection.getConnection().prepareStatement("delete from contest_participants where contest_id=? and participant_id=?");
            ps.setString(1, cId);
            ps.setString(2, pId);
            int result = ps.executeUpdate();
            if (result == 1) 
            {
                return "Success";
            } 
            else 
            {
                return "Failed";
            }
        }
        return "Already Deleted";   
    }
    
    public static String registerCoordinatorInContest(String cId,String crId)throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("select * from contest_coordinators where contest_id=? and coordinator_id=?");
        ps.setString(1, cId);
        ps.setString(2, crId);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            return "Already Registered";
        }
        
        ps=DBConnection.getConnection().prepareStatement("insert into contest_coordinators values(?,?)");
        ps.setString(1, cId);
        ps.setString(2, crId);
        int result=ps.executeUpdate();
        if(result==1)
            return "Success";
        else
            return "Failed";   
    }
    
    public static String removeCoordinatorFromContest(String cId,String crId)throws SQLException
    {
        ps=DBConnection.getConnection().prepareStatement("select * from contest_coordinators where contest_id=? and coordinator_id=?");
        ps.setString(1, cId);
        ps.setString(2, crId);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            ps=DBConnection.getConnection().prepareStatement("delete from contest_coordinators where contest_id=? and coordinator_id=?");
            ps.setString(1, cId);
            ps.setString(2, crId);
            int result = ps.executeUpdate();
            if (result == 1) 
            {
                return "Success";
            } 
            else 
            {
                return "Failed";
            }
        }
        return "Already Deleted";    
    } 
    
    public static String startContest(String contestId,String status,int level) throws SQLException
    {
        if(status.equalsIgnoreCase("On_progress"))
        {
            ps = DBConnection.getConnection().prepareStatement("update Contest set status='Level_1_Is_On_Progress' where contestid=?");
            ps.setString(1, contestId);
        }
        else
        {
            int level1=Integer.parseInt(status.replaceAll("\\D",""))+1;
            if(level>=(level1))
            {
                ps = DBConnection.getConnection().prepareStatement("update Contest set status='Level_"+level1+"_Is_On_Progress' where contestid=?");
                ps.setString(1, contestId);
            }
            else
            {
                return "No More Levels !!!";
            }
        }
        int result= ps.executeUpdate();
        if(result==1)
            return "Success";
        else
            return "Failed"; 
    }
}