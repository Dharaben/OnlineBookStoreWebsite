package com.bookstore.controller.backend.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CategoryServices;

@WebServlet("/admin/edit_category")
public class EditCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditCategoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryServices categoryService = new CategoryServices(request, response);
		categoryService.editCategory();
	}

}