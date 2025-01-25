package com.yma.survey.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.google.gson.Gson;
import com.yma.survey.model.Question;
import com.yma.survey.model.Response;
import com.yma.survey.model.Survey;
import com.yma.survey.model.SurveyDAO;
import com.yma.survey.model.User;
import com.yma.survey.model.Category;
import com.yma.survey.model.JsonMapper;
import com.yma.survey.model.JsonMapperSurveyComplete;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private SurveyDAO surveyDAO;

	@Resource(name = "jdbc/survey")
	private DataSource dataSource;

	public HomeController() {
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
			showHome(req, resp);
			break;
		case "FORM":
			showToCreateSurveyForm(req, resp);
			break;
		case "CREATE":
			createSurvey(req, resp);
			break;
		case "PARTICIPATE":
			participateSurvey(req, resp);
			break;
		case "SUBMIT":
			submitSurvey(req, resp);
			break;
		case "SEARCH":
			searchSurvey(req, resp);
			break;
		default:
			resp.sendRedirect("template/index.jsp");
		}
	}

	private void searchSurvey(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search").trim();
		if (search == "") {
			showHome(req, resp);
		} else {
			ArrayList<Survey> surveys = surveyDAO.searchSurvey(search);
			req.setAttribute("surveys", surveys);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
			dispatcher.forward(req, resp);
		}
	}

	private void submitSurvey(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BufferedReader reader = req.getReader();
		Gson gson = new Gson();
		ArrayList<Response> responses = new ArrayList<Response>();
		JsonMapperSurveyComplete jsonMapper = gson.fromJson(reader, JsonMapperSurveyComplete.class);
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			user = surveyDAO.getDefaultUser();
		}

		for (Question q : jsonMapper.getQuestions()) {
			for (String answer : q.getAnswers()) {
				Long optionId = surveyDAO.getOptionIdByName(answer, q.getQuestionId());
				responses.add(new Response(user, new Question(q.getQuestionId()), optionId, null));
			}
		}

		boolean successSubmit = surveyDAO.submitSurvey(responses);
		boolean successCreate = surveyDAO.createSurveyUser(
				surveyDAO.getSurveyIdByQuestionId(responses.get(0).getQuestion().getQuestionId()), 1L);
		if (successSubmit && successCreate) {
			System.out.println("You have successfully participated.");
			req.getRequestDispatcher("template/index.jsp").forward(req, resp);
		} else {
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			PrintWriter out = resp.getWriter();
			out.print("{\"status\": false, \"message\": \"Failed to create survey.\"}");
			out.flush();
		}
	}

	private void participateSurvey(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/authentication/login.jsp");
			dispatcher.forward(req, resp);
		} else {
			Long surveyId = Long.parseLong(req.getParameter("surveyId"));
			ArrayList<Question> questions = surveyDAO.getAllQuestionBySurveyId(surveyId);
			Survey survey = surveyDAO.getSurveyById(surveyId);
			req.setAttribute("questions", questions);
			req.setAttribute("survey", survey);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/survey/complete-survey.jsp");
			dispatcher.forward(req, resp);
		}
	}

	private void createSurvey(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		BufferedReader reader = req.getReader();
		Gson gson = new Gson();
		JsonMapper jsonMapper = gson.fromJson(reader, JsonMapper.class);
		Survey survey = new Survey(jsonMapper.getTitle(), jsonMapper.getDescription(),
				new User(user.getId(), user.getUsername()), new Category(1L), jsonMapper.isPublic(),
				jsonMapper.getStartDateTime(), jsonMapper.getEndDateTime());
		List<Question> questions = new ArrayList<Question>();
		for (Question q : jsonMapper.getQuestions()) {
			questions.add(q);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		boolean isCreated = surveyDAO.createSurvey(survey, questions);
		if (isCreated) {
			req.getRequestDispatcher("template/index.jsp").forward(req, resp);
		} else {
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			PrintWriter out = resp.getWriter();
			out.print("{\"status\": false, \"message\": \"Failed to create survey.\"}");
			out.flush();
		}
	}

	private void showToCreateSurveyForm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/survey/create-survey.jsp");
		dispatcher.forward(req, resp);
	}

	private void showHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if(user != null) {
			List<Survey> surveys = surveyDAO.getAllSurveysByUserId(user.getId());
			req.setAttribute("surveys", surveys);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
			dispatcher.forward(req, resp);			
		}else {
			List<Survey> surveys = surveyDAO.getAllSurveys();
			req.setAttribute("surveys", surveys);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
			dispatcher.forward(req, resp);		
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
