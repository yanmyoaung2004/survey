package com.yma.survey.controller;

import java.io.IOException;

import javax.sql.DataSource;

import com.yma.survey.model.AuthenticationDAO;
import com.yma.survey.model.User;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sign-in")
public class LoginController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/survey")
	private DataSource dataSource;

	private AuthenticationDAO authenticationDAO;

	public LoginController() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		authenticationDAO = new AuthenticationDAO(dataSource);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode = req.getParameter("mode");
		if (mode == null) {
			mode = "LOGIN_FORM";
		}
		switch (mode) {
		case "LOGIN_FORM":
			showLoginForm(req, resp);
			break;
		case "LOG_OUT":
			logout(req, resp);
			break;
		default:
			resp.sendRedirect("template/authentication/login.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		loginUser(req, resp);
	}

	private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		boolean isAuthenticated = authenticationDAO.isAuthenticated(email, password);
		if(isAuthenticated ) {
			User authenticatedUser = authenticationDAO.getUserByEmail(email);
			HttpSession session = req.getSession();
			session.setAttribute("user", authenticatedUser);
			resp.sendRedirect("home");
		}else {
			req.setAttribute("ok", false);
			showLoginForm(req, resp);
		}
		
	}
	
	protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		resp.sendRedirect("sign-in");
	}
	
	private void showLoginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/authentication/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	

}
