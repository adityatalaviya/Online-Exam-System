package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.ExamVO;
import com.util.DButil;

public class ExamDAO {
	
	//store as add exam data in db
	public void addExam(String title,int duration,int total_que){
		try{
			Connection c = DButil.getConnection();
			Statement st = c.createStatement();
			String query = "Insert into exams(title,duration,total_questions) values ('" + title + "','" + duration + "', '" + total_que + "')";
			st.executeUpdate(query);
			st.close();
			c.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//user to show and also admin to show
	public List getAllExam() {  
	    List l = new ArrayList<>();  

        try {
            Connection c = DButil.getConnection();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery("SELECT e.id, e.title, e.duration, e.total_questions, " +
                    "(SELECT COUNT(*) FROM questions WHERE exam_id = e.id) AS added_questions " +
                    "FROM exams e");

//            ResultSet rs = st.executeQuery("SELECT * FROM exams");

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                int duration = rs.getInt("duration");
                int total_que = rs.getInt("total_questions");
                int add_que = rs.getInt("added_questions");

                ExamVO exam = new ExamVO();
                exam.setId(id);
                exam.setTitle(title);
                exam.setDuration(duration);
                exam.setTotal_questions(total_que);
                exam.setAdded_questions(add_que);
                l.add(exam);
            }

            rs.close();
            st.close();
            c.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return l;
    }
	
	public int getExamDuration(int examId) {
	    int duration = 0;
	    try {
	        Connection c = DButil.getConnection();
	        Statement st = c.createStatement();
	        ResultSet rs = st.executeQuery("SELECT duration FROM exams WHERE id = " + examId);

	        if (rs.next()) {
	            duration = rs.getInt("duration");
	        }

	        rs.close();
	        st.close();
	        c.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return duration;
	}

	
	public String getExamTitle(int examId) {
	    String title = null;
	    try {
	        Connection c = DButil.getConnection();
	        Statement st = c.createStatement();
	        ResultSet rs = st.executeQuery("SELECT title FROM exams WHERE id = " + examId);

	        if (rs.next()) {
	            title = rs.getString("title");
	        }

	        rs.close();
	        st.close();
	        c.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return title;
	}
	
	// Get the count of attempted exams by a user
	public int getAttemptedExamCount(int userId) {
	    int count = 0;
	    try {
	        Connection c = DButil.getConnection();
	        Statement st = c.createStatement();
	        ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM results WHERE user_id = " + userId);

	        if (rs.next()) {
	            count = rs.getInt("count");
	        }

	        rs.close();
	        st.close();
	        c.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}


}
