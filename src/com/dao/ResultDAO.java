package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.ResultVO;
import com.model.userVO;
import com.sun.corba.se.spi.orbutil.fsm.State;
import com.util.DButil;

public class ResultDAO {
	
	//store result in db
	 public void saveResult(int userId, int examId, int score) {
	        try {
	            Connection c = DButil.getConnection();
	            Statement st = c.createStatement();
	            // Check if the user already has a result for this exam
	            String checkQuery = "SELECT * FROM results WHERE user_id = '" + userId + "' AND exam_id = '" + examId + "'";
	            ResultSet rs = st.executeQuery(checkQuery);

	            if (rs.next()) {
	                // Update existing result
	                String updateQuery = "UPDATE results SET score = '" + score + "' WHERE user_id = '" + userId + "' AND exam_id = '" + examId + "'";
	                st.executeUpdate(updateQuery);
	            } else {
	                // Insert new result
	                String insertQuery = "INSERT INTO results(user_id, exam_id, score) VALUES ('" + userId + "', '" + examId + "', '" + score + "')";
	                st.executeUpdate(insertQuery);
	            }
	            rs.close();
	            st.close();
	            c.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	 public ResultVO getResult(int userId, int examId) {
	        ResultVO result = null;
	        try {
	            Connection c = DButil.getConnection();
	            Statement st = c.createStatement();
		        ResultSet rs = st.executeQuery("SELECT * FROM results WHERE user_id = '" + userId + "' AND exam_id = '" + examId + "'");
		        
		        if (rs.next()) {
		            result = new ResultVO();
		            result.setId(rs.getInt("id"));
		            result.setUser_id(rs.getInt("user_id"));
		            result.setExam_id(rs.getInt("exam_id"));
		            result.setScore(rs.getInt("score"));
		            
		            
		        }
		        rs.close();
		        st.close();
	            c.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return result;
	    }
	 
	 public List getAllResults(){
		 List l = new ArrayList<>();
		 
		 try{
			 Connection c = DButil.getConnection();
			 Statement st = c.createStatement();
			 String query = "SELECT r.id, r.user_id, u.name AS user_name, r.exam_id, e.title AS exam_title, r.score " +
                           "FROM results r " +
                           "JOIN users u ON r.user_id = u.id " +
                           "JOIN exams e ON r.exam_id = e.id";
			 ResultSet rs = st.executeQuery(query);
			 
			 while(rs.next()){
				 ResultVO v = new ResultVO();
				 	v.setId(rs.getInt("id"));
	                v.setUser_id(rs.getInt("user_id"));
	                v.setExam_id(rs.getInt("exam_id"));
	                v.setScore(rs.getInt("score"));
	                v.setUserName(rs.getString("user_name"));
	                v.setExamTitle(rs.getString("exam_title"));
	                l.add(v);
			 }
			 	rs.close();
	            st.close();
	            c.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 return l;
	 }
	 
}
