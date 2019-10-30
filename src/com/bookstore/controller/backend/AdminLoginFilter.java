package com.bookstore.controller.backend;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminLoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AdminLoginFilter() {

	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {

	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false); 

		boolean loggedIn = session != null && session.getAttribute("employeeemail") != null;
		String loginURI = httpRequest.getContextPath() + "/admin/login";
		String employeeRegisterPage = "/admin/register.jsp";
		
		boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
		boolean loginPage = httpRequest.getRequestURI().endsWith("login.jsp");
		
		if (loggedIn && (loginRequest || loginPage)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
			dispatcher.forward(request, response);
		} else if (loggedIn || loginRequest) {
			System.out.println("Employee logged in");
			chain.doFilter(request, response);
			
		} else {
			System.out.println("Employee not logged in");
	        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length()).replaceAll("[/]+$", ""); 
			System.out.println(path);
	        if(path.equals(employeeRegisterPage)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
				dispatcher.forward(request, response);
			}else if(path.equals("/admin/register")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/register");
				dispatcher.forward(request, response);
			}else
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
