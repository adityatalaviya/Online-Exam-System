package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExamDAO;
import com.dao.QuestionDAO;
import com.model.QuestionVO;

@WebServlet("/QueController")
public class QueController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QueController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("addQue".equals(action)) {
            boolean isAdded = addQue(request, response);
            if (isAdded) {
            	// Refresh the session with updated exams
                HttpSession session = request.getSession();
                ExamDAO d = new ExamDAO();
                List updatedExams = d.getAllExam();
                session.setAttribute("exams", updatedExams);
                response.sendRedirect("admin.jsp");
            } else {
                response.getWriter().println("Error: pls corrected exam-id enter then add que");
            }
        }

	}

	// add que manage
	protected boolean addQue(HttpServletRequest request, HttpServletResponse response) {
		try {
			int examId = Integer.parseInt(request.getParameter("exam_id"));
			String que_txt = request.getParameter("question_text");
			String optionA = request.getParameter("option_a");
			String optionB = request.getParameter("option_b");
			String optionC = request.getParameter("option_c");
			String optionD = request.getParameter("option_d");
			String correct_option = request.getParameter("correct_option");

			QuestionVO v = new QuestionVO();
			v.setExamId(examId);
			v.setQuestion_text(que_txt);
			v.setOption_a(optionA);
			v.setOption_b(optionB);
			v.setOption_c(optionC);
			v.setOption_d(optionD);
			v.setCorrect_option(correct_option);

			QuestionDAO d = new QuestionDAO();
			return d.addQuestions(v);

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}
