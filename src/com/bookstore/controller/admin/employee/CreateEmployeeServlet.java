package com.bookstore.controller.admin.employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.EmployeeServices;

/**
 * Servlet implementation class CreateEmployeeServlet
 */
@WebServlet("/admin/create_employee")
public class CreateEmployeeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateEmployeeServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmployeeServices employeeService = new EmployeeServices(entityManager, request, response);
		employeeService.createEmployee();
		

	}

}
