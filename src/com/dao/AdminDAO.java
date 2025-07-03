package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import com.util.DButil;

public class AdminDAO {

    public int getTotalUsers() {
        int count = 0;
        try {
            Connection conn = DButil.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users");
            if (rs.next()) {
                count = rs.getInt(1);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getTotalExams() {
        int count = 0;
        try {
            Connection conn = DButil.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM exams");
            if (rs.next()) {
                count = rs.getInt(1);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
