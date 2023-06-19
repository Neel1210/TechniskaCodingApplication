package dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    final static String DB_URL = "jdbc:oracle:thin:@OracleDB2_high?TNS_ADMIN=/Users/Oracle_Files/Wallet_OracleDB2";
    final static String DB_USER_NAME = "teckniska";
    final static String DB_PASS = "Barkatullha12102000";

    private static Connection conn = null;

    static {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER_NAME, DB_PASS);
            System.out.println("Connect Open succesfully");
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error in DBConnection :- ");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Error in DBConnection :- ");
        }
    }

    public static Connection getConnection() {
        if(conn==null)
            openConnection();
        return conn;
    }

    private static void openConnection() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER_NAME, DB_PASS);
            System.out.println("Connect Open succesfully");
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error in DBConnection :- ");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Error in DBConnection :- ");
        }
    }

    public static void closeConnection() {
        if (conn != null) {

            try {
                conn.close();
                System.out.println("conn close successfully");
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }
    }

}
