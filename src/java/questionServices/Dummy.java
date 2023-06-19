/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package questionServices;

import dao.QuestionDAO;
import java.io.IOException;
import java.sql.SQLException;

/**
 *
 * @author Neel_Esh
 */
public class Dummy {
    public static void main(String[] args)throws SQLException, IOException
    {
        QuestionDAO.getQuestionByQuestionId("Q1_CODING_2023_1");
    }
}
