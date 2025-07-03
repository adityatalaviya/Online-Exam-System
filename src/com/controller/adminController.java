package com.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDAO;
import com.dao.ExamDAO;
import com.dao.ResultDAO;

@WebServlet("/adminController")
public class adminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public adminController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");

        if ("viewResults".equals(action)) {
            viewResults(request, response);
            response.sendRedirect("viewResults.jsp");
        } else if ("dashboard".equals(action)) {
            loadDashboard(request, response);
            response.sendRedirect("dashboard.jsp");
        }else {
            viewExamAdmin(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addExam".equals(action)) {
            addExam(request, response);
            viewExamAdmin(request, response);  
        }
    }

    // Add exam to database
    protected void addExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int total_que = Integer.parseInt(request.getParameter("total_questions"));

        ExamDAO d = new ExamDAO();
        d.addExam(title, duration, total_que);
        
    }

    // Fetch and display all exams for admin
    protected void viewExamAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ExamDAO d = new ExamDAO();
        List exams = d.getAllExam();
        request.getSession().setAttribute("exams", exams);  
        request.getRequestDispatcher("admin.jsp").forward(request, response); 
    }
    
    //view result
    protected void viewResults(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultDAO d = new ResultDAO();
        List l = d.getAllResults();
        request.getSession().setAttribute("results", l);
        
    }
    
    protected void loadDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        int totalUsers = dao.getTotalUsers();
        int totalExams = dao.getTotalExams();

        HttpSession session = request.getSession();
        session.setAttribute("totalUsers", totalUsers);
        session.setAttribute("totalExams", totalExams);

        //response.sendRedirect("dashboard.jsp");
    }

}
