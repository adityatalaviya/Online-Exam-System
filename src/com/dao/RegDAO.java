package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.model.userVO;
import com.util.DButil;


public class RegDAO {
	public void insert(userVO v,String password){
		try{
			
			Connection c = DButil.getConnection();
            Statement st = c.createStatement();
            String query = "INSERT INTO users(name, email, password, role) VALUES ('" + v.getName() + "', '" + v.getEmail() + "', '" + password + "', '"  + v.getRole() + "')";
            st.executeUpdate(query);
            st.close();
            c.close();
            
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public boolean isAdminExists() {
	    boolean exists = false;
	    try {
	        Connection c = DButil.getConnection();
	        Statement st = c.createStatement();
	        ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM users WHERE role='admin'");

	        if (rs.next() && rs.getInt(1) > 0) {
	            exists = true;
	        }

	        rs.close();
	        st.close();
	        c.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return exists;
	}

	
	public userVO matched(String email,String password){
		userVO user = null;
	    try {
	        Connection c = DButil.getConnection();
	        Statement st = c.createStatement();
	        ResultSet rs = st.executeQuery("SELECT id, name, email, role FROM users WHERE email = '" + email + "' AND password = '" + password + "'");
	        
	        if (rs.next()) {
	            user = new userVO();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setRole(rs.getString("role"));
	        }
	        
	        rs.close();
	        st.close();
	        c.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return user;
	}
	
	
}
