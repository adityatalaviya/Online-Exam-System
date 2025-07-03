package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ExamDAO;
import com.dao.QuestionDAO;
import com.dao.ResultDAO;
import com.model.QuestionVO;
import com.model.ResultVO;
import com.model.userVO;

@WebServlet("/ExamController")
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ExamController() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action"); 
	  
	    if ("exam".equals(action)) {  
	        startExam(request, response);
	        response.sendRedirect("exam.jsp");  
	    } else if ("result".equals(action)) {
            viewResult(request, response);
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");

		    if ("submit".equals(action)) {
		        submitExam(request, response);
		    }
	}
	
	//start exam
	protected void startExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int examId = Integer.parseInt(request.getParameter("id"));
	    userVO user = (userVO) request.getSession().getAttribute("user");
	    int userId = user.getId();
	    
	    ResultDAO d = new ResultDAO();
	    ResultVO existResult = d.getResult(userId, examId);
	    
	    ExamDAO e = new ExamDAO();
	    String examTitle = e.getExamTitle(examId);
	    int duration = e.getExamDuration(examId);

	    
	    if(existResult != null){
	    	request.setAttribute("result", existResult);
	    	request.setAttribute("examTitle", examTitle); 
	    	request.getRequestDispatcher("result.jsp").forward(request, response);
	    }else{
	    	QuestionDAO qd = new QuestionDAO();
	    	List questions = qd.getExamById(examId); 
	    	
	    	// Store start time if not already set
	        Long startTime = (Long) request.getSession().getAttribute("startTime");
	        if (startTime == null) {
	            request.getSession().setAttribute("startTime", System.currentTimeMillis());
	        }
	    	
	    	request.getSession().setAttribute("que", questions);
	    	request.getSession().setAttribute("eid", examId);
	    	request.getSession().setAttribute("duration", duration);
	    	request.getSession().setAttribute("examTitle", examTitle);
	    }

	}
	
	//result calculate
	protected void submitExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int examId = (int) request.getSession().getAttribute("eid");
        userVO user = (userVO) request.getSession().getAttribute("user");
        int userId = user.getId();
        String examTitle = (String) request.getSession().getAttribute("examTitle");
        List<QuestionVO> questions = (List<QuestionVO>) request.getSession().getAttribute("que");

        int score = 0;
        for (QuestionVO q : questions) {
            String userAnswer = request.getParameter("answer_" + q.getId());
            if (userAnswer != null && userAnswer.equals(q.getCorrect_option())) {
                score++;
            }
        }
        
     // Clear session attributes after exam submission
        request.getSession().removeAttribute("startTime");
        request.getSession().removeAttribute("duration");
        
        ResultDAO d = new ResultDAO();
        d.saveResult(userId, examId, score);

      
        ResultVO result = d.getResult(userId, examId);
        request.setAttribute("result", result);
        request.setAttribute("examTitle", examTitle);

       request.getRequestDispatcher("result.jsp").forward(request, response);
	   
	}
	
	
	protected void viewResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("id"));
        userVO user = (userVO) request.getSession().getAttribute("user");

        ResultDAO d = new ResultDAO();
        ResultVO result = d.getResult(user.getId(), examId);
        
        ExamDAO ed = new ExamDAO();
        String examTitle = ed.getExamTitle(examId);

        request.setAttribute("result", result);
        request.setAttribute("examTitle", examTitle);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

}
