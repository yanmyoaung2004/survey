package com.yma.survey.controller;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)req;
		HttpServletResponse httpResponse = (HttpServletResponse) res;
		
		HttpSession session = httpRequest.getSession();
		boolean isAuth = session.getAttribute("user") != null;
		boolean isLogin  = httpRequest.getRequestURI().contains("sign-in");
		boolean isRegister  = httpRequest.getRequestURI().contains("sign-up");
		boolean isHome  = httpRequest.getRequestURI().contains("home");
		String modeParam = httpRequest.getParameter("mode");
//        boolean isParticipateMode = "PARTICIPATE".equals(modeParam);
//        boolean isSubmitMode = "SUBMIT".equals(modeParam);
//        boolean isViewMode = "VIEW".equals(modeParam);
        System.out.println(modeParam);
        
		if(isAuth || isLogin || isRegister || isHome) {
			filterChain.doFilter(httpRequest, httpResponse);
		}
		else {
			httpResponse.sendRedirect("sign-in");
		}
		
		
		
	}

}
