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

@WebServlet("/sign-up")
public class RegisterController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/survey")
	private DataSource dataSource;

	private AuthenticationDAO authenticationDAO;

	public RegisterController() {
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
			mode = "REGISTER_FORM";
		}
		switch (mode) {
		case "REGISTER_FORM":
			showRegisterForm(req, resp);
			break;
		default:
			resp.sendRedirect("template/authentication/login.jsp");

		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		createUser(req, resp);
	}

	private void createUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String username = req.getParameter("username");
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    HttpSession session = req.getSession();
	    if (username == null || email == null || password == null || 
	        username.isEmpty() || email.isEmpty() || password.isEmpty()) {
	        req.setAttribute("toastMessage", "All fields are required!");
	        req.getRequestDispatcher("template/authentication/register.jsp").forward(req, resp);
	        return;
	    }
	    try {
	        if (authenticationDAO.getUserByEmail(email) != null) {
	            req.setAttribute("toastMessage", "User already exists with this email!");
	            req.getRequestDispatcher("template/authentication/register.jsp").forward(req, resp);
	        } else {
	            boolean isCreated = authenticationDAO.createUser(new User(username, email, password));
	            if (isCreated) {
	                req.setAttribute("toastMessage", "User created successfully. Please log in!");
	                req.getRequestDispatcher("template/authentication/login.jsp").forward(req, resp);
	            } else {
	                req.setAttribute("toastMessage", "User creation failed!");
	                req.getRequestDispatcher("template/authentication/register.jsp").forward(req, resp);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        session.setAttribute("toastMessage", "An error occurred. Please try again later.");
	        req.getRequestDispatcher("template/authentication/register.jsp").forward(req, resp);
	    }
	}


	private void showRegisterForm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/authentication/register.jsp");
		dispatcher.forward(req, resp);
	}

}
