package com.yma.survey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.google.gson.Gson;
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

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/survey")
	private DataSource dataSource;

	private SurveyDAO surveyDAO;

	public DashboardController() {
		// TODO Auto-generated constructor stub
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
			mode = "DASHBOARD";
		}
		switch (mode) {
		case "DASHBOARD":
			showDashboard(req, resp);
			break;
		default:
			resp.sendRedirect("template/dashboard.jsp");

		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	private void showDashboard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/dashboard.jsp");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		int numberOfSurveyCreated = surveyDAO.getSurveyCreated(user.getId());
		int surveyResponses = surveyDAO.getSurveyResponses(user.getId());
		int surveyResponsesByAnonymouns = surveyDAO.getSurveyResponsesByAnonymous(user.getId());
		int activeSurvey = surveyDAO.getActiveSurvey(user.getId());
		List<Integer> chartData = surveyDAO.getResponseForChart();
		ArrayList<Survey> surveys = surveyDAO.getSurveysForDB(user.getId(), user.getUsername());
		
		req.setAttribute("chartData",  new Gson().toJson(chartData));
		req.setAttribute("numberOfSurveyCreated", numberOfSurveyCreated);
		req.setAttribute("surveyResponses", surveyResponses);
		req.setAttribute("activeSurvey", activeSurvey);
		req.setAttribute("inactiveSurvey", numberOfSurveyCreated - activeSurvey);
		req.setAttribute("anonymousPercentage", (surveyResponsesByAnonymouns * 100) / surveyResponses);
		req.setAttribute("surveys", surveys);
		dispatcher.forward(req, resp);
	}

}
