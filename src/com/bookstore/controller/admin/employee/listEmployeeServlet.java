package com.bookstore.controller.admin.employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.EmployeeServices;

/**
 * Servlet implementation class listEmployeeServlet
 */
@WebServlet("/admin/list_employee")
public class listEmployeeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public listEmployeeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmployeeServices employeeService=new EmployeeServices(entityManager, request, response);
		employeeService.listEmployee();
	}

}
