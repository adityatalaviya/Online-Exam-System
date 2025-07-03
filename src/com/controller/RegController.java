package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.List;  // ✅ CORRECT IMPORT

import com.dao.ExamDAO;
import com.dao.RegDAO;
import com.model.ExamVO;
import com.model.userVO;


@WebServlet("/RegController")
public class RegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public RegController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");  
		    
		    if ("search".equals(action)) {  
		        search(request, response);
		        response.sendRedirect("user_dashboard.jsp");
		    } else if ("dashboard".equals(action)) {
	            loadDashboard(request, response);
	            request.getRequestDispatcher("student_dashboard.jsp").forward(request, response);
	        }else {
		        response.getWriter().println("Invalid action or missing parameter.");
		    }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("register")){
			register(request,response);
			response.sendRedirect("login.jsp");
		}else if(action.equals("login")){
			userVO user = match(request,response);
			if(user != null){
				HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                // Redirect based on role
                if ("admin".equals(user.getRole())) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("user_dashboard.jsp");
                }
			}else{
				response.sendRedirect("login.jsp");
			}
		}
	}
	
	//register the user
	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		userVO u = new userVO();
		u.setName(name);
		u.setEmail(email);
		
		RegDAO  d = new RegDAO();
		if (d.isAdminExists()) {
	        u.setRole("student"); 
	    } else {
	        u.setRole("admin"); 
	    }
		d.insert(u,pass);
	}
	
	//login the user
	protected userVO match(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
	
		RegDAO d = new RegDAO();
		return d.matched(email,pass);
	}
	
	//show the exam list
	protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ExamDAO d = new ExamDAO();
		List l = d.getAllExam();
		
		HttpSession s = request.getSession();
		s.setAttribute("data", l);
	}
	
	//show the exam list and attempted exams count
	 protected void loadDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        HttpSession session = request.getSession();
	        userVO user = (userVO) session.getAttribute("user");

	        if (user != null) {
	            ExamDAO d = new ExamDAO();
	            List<ExamVO> exams = d.getAllExam();
	            int attemptedExams = d.getAttemptedExamCount(user.getId());

	            session.setAttribute("data", exams);
	            session.setAttribute("attemptedExams", attemptedExams);
	            session.setAttribute("totalExams", exams.size());
	        }
	    }


}
