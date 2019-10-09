package com.bookstore.service;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.EmployeeDAO;
import com.bookstore.entity.Employee;

public class EmployeeServices {
	private EmployeeDAO employeeDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public EmployeeServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		employeeDAO = new EmployeeDAO();
	}

	public void login() throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		boolean loginResult = employeeDAO.checkLogin(email, password);

		if (loginResult) {
			System.out.println("Employee logged In successfully with " + email);
			request.getSession().setAttribute("employeeemail", email);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin/");
			requestDispatcher.forward(request, response);

		} else {
			String message = "Login Failed!";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);

		}

	}

	public void register() throws ServletException, IOException {
		String fullName = request.getParameter("fullName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		Employee exitsEmployee = employeeDAO.findByEmail(email);
		if (exitsEmployee != null) {
			String message = "Could not register. The email " + email + " is already registered by another employee.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		} else {

			Employee newEmployee = new Employee(fullName, address, phoneNumber, email, password, confirmPassword, city);
			employeeDAO.create(newEmployee);
			String message = "You have registered successfully! Thank you. <br/> "
					+ "<a href='login.jsp'>Click here</a> to login !";

			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
	}

}
