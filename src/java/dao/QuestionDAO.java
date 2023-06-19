package dao;

import dbUtil.DBConnection;
import dto.QuestionDTO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Clob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Neel_Esh
 */
public class QuestionDAO {
    
    private QuestionDAO()
    {
        
    }
    private static PreparedStatement ps;
    private static Statement st;
    
    public static Boolean checkQuestionSpace(String contestId) throws SQLException
    {
        ps = DBConnection.getConnection().prepareStatement("SELECT \n"
                + "    (c.levels - COUNT(q.question_id)) AS remaining_questions\n"
                + "FROM \n"
                + "    contest c\n"
                + "LEFT JOIN \n"
                + "    questions q ON q.contest_id = c.contestid\n"
                + "WHERE \n"
                + "    c.contestid = ? \n"
                + "GROUP BY\n"
                + "    c.levels");
        
        ps.setString(1,contestId.trim());
        ResultSet rs= ps.executeQuery();
        if(rs.next())
        {
            if(rs.getInt(1)>0)
                return true;
        }
        return false; 
    }
    
    public static String getNewQuestionId(String contestId) throws SQLException
    {   
        if(checkQuestionSpace(contestId))
        {
            String[] arr=contestId.trim().split("_");
            ps=DBConnection.getConnection().prepareStatement("select count(*) from questions where contest_id=?");
            ps.setString(1,contestId.trim());
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                return "Q"+(rs.getInt(1)+1)+"_"+arr[1]+"_"+arr[2]+"_"+arr[3];    
            }
            return "Q1"+"_"+arr[1]+"_"+arr[2]+"_"+arr[3];
        }
        return "All Question Are Already setted";     
    } 
    
    public static String addNewQuestion(QuestionDTO que) throws SQLException
    {
        ps = DBConnection.getConnection().prepareStatement("INSERT INTO QUESTIONS (QUESTION_ID, CONTEST_ID, QUESTION, TEST_CASES, QUESTION_TITLE) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, que.getQuestionId());
        ps.setString(2, que.getContestId());
        ps.setCharacterStream(3,new StringReader(que.getQuestion()),que.getQuestion().length());       
        ps.setCharacterStream(4,new StringReader(que.getTestCases()),que.getTestCases().length()); 
        ps.setString(5, que.getQueTitle());
        
        int result= ps.executeUpdate();
        if(result==1)
            return "Success";
        else
            return "Failed"; 
    }
    
    public static String editQuestion(QuestionDTO que) throws SQLException
    {
        ps = DBConnection.getConnection().prepareStatement("update questions set question_title=?,question=?,test_cases=? where question_id=?");
        
        ps.setString(1, que.getQueTitle());
        ps.setCharacterStream(2,new StringReader(que.getQuestion()),que.getQuestion().length());       
        ps.setCharacterStream(3,new StringReader(que.getTestCases()),que.getTestCases().length()); 
        ps.setString(4, que.getQuestionId());
        
        int result= ps.executeUpdate();
        if(result==1)
            return "Success";
        else
            return "Failed"; 
    }
    
    public static JSONObject getQuestionByQuestionId(String queId) throws SQLException,IOException
    {
        System.out.println(queId);
        ps = DBConnection.getConnection().prepareStatement("select * from questions where question_id=?");
        ps.setString(1, queId);
        ResultSet rs=ps.executeQuery();
        JSONObject json=null;
        if(rs.next())
        {
            json=new JSONObject();
            json.put("Question_Id",rs.getString(1));
            json.put("Contest_Id",rs.getString(2));
            json.put("Question",clobToString1(rs.getCharacterStream(3)));
            json.put("Test_Cases",clobToString1(rs.getCharacterStream(4)));
            json.put("qLevel",rs.getInt(5));
            json.put("qTitle",rs.getString(6));  
        }
        System.out.println(json.toString());
        System.out.println(json.get("Question"));
        System.out.println("\n"+json.get("Test_Cases"));
        return json;
    }
    
    private static String clobToString1(Reader reader) throws SQLException, IOException {
        StringBuilder sb = new StringBuilder();
        char[] buffer = new char[4096];
        int bytesRead;
        while ((bytesRead = reader.read(buffer)) != -1) {
            sb.append(buffer, 0, bytesRead);
        }

        String codeSnippet = sb.toString();
        reader.close();
        return codeSnippet;
    }
    
    public static JSONArray getAllQuestionsByContestId(String contest_id) throws SQLException,IOException
    {
        Statement st=DBConnection.getConnection().createStatement();
        ResultSet rs=st.executeQuery("select * from questions where contest_id='"+contest_id.trim()+"' order by level_no");
        JSONArray jsonArr=new JSONArray();
        while(rs.next())
        {
            JSONObject json=new JSONObject();
            json.put("Question_Id",rs.getString(1));
            json.put("qTitle",rs.getString(6));  
            json.put("qLevel",rs.getInt(5));
            jsonArr.add((JSONObject)json);       
            System.out.println(json.toString());
        }
        System.out.println("GetAllQuestionsByContestId Array -\n"+jsonArr.toString());
        return jsonArr;
    }
    
}
