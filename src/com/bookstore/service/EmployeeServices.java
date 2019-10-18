package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
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

	public EmployeeServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		employeeDAO = new EmployeeDAO();
	}

	public void listEmployee(String message) throws ServletException, IOException {
		List<Employee> listEmployees = employeeDAO.listAll();

		request.setAttribute("listEmployees", listEmployees);

		if (message != null) {
			request.setAttribute("message", message);
		}
		String listPage = "employee_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void listEmployee() throws ServletException, IOException {
		listEmployee(null);
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

	public void createEmployee() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");

		Employee exitsEmployee = employeeDAO.findByEmail(email);
		if (exitsEmployee != null) {
			String message = "Could not create employee. A employee with email " + email + " already exixts!";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {

			Employee newEmployee = new Employee(email, fullName, password);
			employeeDAO.create(newEmployee);
			listEmployee("New Employee created successfully!");
		}
	}

	public void editEmployee() throws ServletException, IOException {

		int employeeId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeDAO.get(employeeId);

		String editPage = "employee_form.jsp";
		if (employee == null) {
			editPage = "message.jsp";
			String errorMessage = "Could not find user with ID " + employeeId;
			request.setAttribute("message", errorMessage);
		} else {
			request.setAttribute("employee", employee);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);

	}

	public void updateEmployee() throws ServletException, IOException {
		int employeeId = Integer.parseInt(request.getParameter("employeeId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");

		Employee employeeById = employeeDAO.get(employeeId);

		Employee employeeByEmail = employeeDAO.findByEmail(email);

		if (employeeByEmail != null && employeeByEmail.getEmployeeId() != employeeById.getEmployeeId()) {
			String message = "Could not update employee. Employee with email " + email + " already exists!";
			request.setAttribute("message", message);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);

		} else {
			Employee employee = new Employee(employeeId, email, fullName, password);
			employeeDAO.update(employee);

			String message = "Employee has been updated successfully!";
			listEmployee(message);
		}

	}

	public void register() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");

		Employee exitsEmployee = employeeDAO.findByEmail(email);
		if (exitsEmployee != null) {
			String message = "Could not create employee. A employee with email " + email + " already exixts!";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		} else {

			Employee newEmployee = new Employee(email, fullName, password);
			employeeDAO.create(newEmployee);
//			String message = "New Employee created successfully!";
//			request.setAttribute("message", message);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			String message = "New Employee created successfully!";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");

			
			dispatcher.forward(request, response);
			//listEmployee("New Employee created successfully!");
		}
	}

}
