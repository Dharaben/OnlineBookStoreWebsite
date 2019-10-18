package com.bookstore.controller.frontend;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
<<<<<<< HEAD
		CategoryDAO categoryDAO=new CategoryDAO();
		BookDAO bookDAO=new BookDAO();
		
		List<Category> listCategory=categoryDAO.listAll();
		List<Book> listNewBooks=bookDAO.listNewBooks();
		List<Book> listBestSellingBooks=bookDAO.listBestSellingBooks();
		List<Book> listMostFavoredBooks=bookDAO.listMostFavoredBooks();
		
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listNewBooks", listNewBooks);
		request.setAttribute("listBestSellingBooks",listBestSellingBooks);
		request.setAttribute("listMostFavoredBooks", listMostFavoredBooks);
		
=======
>>>>>>> parent of ddf43aa... commit message goes here
		String homepage = "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}

}
