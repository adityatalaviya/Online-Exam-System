package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.ExamVO;
import com.model.QuestionVO;
import com.util.DButil;

public class QuestionDAO {
		
	public List getExamById(int examId) {  
	    List l = new ArrayList<>();  

        try {
            Connection c = DButil.getConnection();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM questions where exam_id = "+ examId);

            while (rs.next()) {
                int id = rs.getInt("id");
                String que_text = rs.getString("question_text");
                String option_a = rs.getString("option_a");
                String option_b = rs.getString("option_b");
                String option_c = rs.getString("option_c");
                String option_d = rs.getString("option_d");
                String correct_opt = rs.getString("correct_option");

                QuestionVO q = new QuestionVO();
                q.setId(id);
                q.setQuestion_text(que_text);
                q.setOption_a(option_a);
                q.setOption_b(option_b);
                q.setOption_c(option_c);
                q.setOption_d(option_d);
                q.setCorrect_option(correct_opt);

                l.add(q);
            }

            rs.close();
            st.close();
            c.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return l;
    }

	//add que in db
	public boolean addQuestions(QuestionVO q) {
		boolean b = false;
		try {
            Connection c = DButil.getConnection();
            Statement st = c.createStatement();

            String query = "INSERT INTO questions (exam_id,question_text, option_a, option_b, option_c, option_d, correct_option) VALUES ('"+q.getExamId()+"','" 
                            + q.getQuestion_text() + "','" + q.getOption_a() + "','" + q.getOption_b() + "','" + q.getOption_c() + "','" + q.getOption_d() + "','"+q.getCorrect_option()+"')";
            
            int row = st.executeUpdate(query);
            if(row > 0){
            	String updateQuery = "UPDATE exams SET added_questions = added_questions + 1 WHERE id = " + q.getExamId();
            	b = true;
            }
            st.close();
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return b;
	}
}
