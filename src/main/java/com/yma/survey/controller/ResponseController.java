package com.yma.survey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.yma.survey.model.ResponseResult;
import com.yma.survey.model.Survey;
import com.yma.survey.model.SurveyDAO;
import com.yma.survey.model.User;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/response")
public class ResponseController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private SurveyDAO surveyDAO;
	
	


	@Resource(name = "jdbc/survey")
	private DataSource dataSource;

	public ResponseController() {

	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		surveyDAO = new SurveyDAO(dataSource);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode = req.getParameter("mode");
		if (mode == null) {
			mode = "HOME";
		}
		switch (mode) {
		case "HOME":
			showResponseHome(req, resp);
			break;
		case "VIEW":
			showResponse(req, resp);
			break;
		default:
			resp.sendRedirect("template/response-list.jsp");
		}
	}
	
	
	private void showResponseHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		List<Survey> surveys = surveyDAO.getAllSurveysById(user.getId());
		req.setAttribute("surveys", surveys);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/response-list.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void showResponse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long surveyId = Long.parseLong(req.getParameter("surveyId"));
		Survey survey = surveyDAO.getSurveyById(surveyId);
		ArrayList<ResponseResult> rrs = surveyDAO.getResponseResult(surveyId);
		req.setAttribute("result", rrs);
		req.setAttribute("survey", survey);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/survey/response.jsp");
		dispatcher.forward(req, resp);
	} 	
}
