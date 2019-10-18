package com.bookstore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.EmployeeDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Order;
import com.bookstore.entity.Review;

@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeServlet() {
        super();
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EmployeeDAO employeeDAO = new EmployeeDAO();
		OrderDAO orderDAO = new OrderDAO();
		ReviewDAO reviewDAO = new ReviewDAO();
		BookDAO bookDAO = new BookDAO();
		CategoryDAO categoryDAO=new CategoryDAO();
		CustomerDAO customerDAO = new CustomerDAO();

		List<Order> listMostRecentSales = orderDAO.listMostRecentSales();
		List<Review> listMostRecentReviews = reviewDAO.listMostRecent();

		long totalEmployees = employeeDAO.count();
		long totalCategories=categoryDAO.count();
		long totalBooks = bookDAO.count();
		long totalCustomer = customerDAO.count();
		long totalRevies = reviewDAO.count();
		long totalOrdes = orderDAO.count();

		request.setAttribute("listMostREcentSales", listMostRecentSales);
		request.setAttribute("listMostRecentReviews", listMostRecentReviews);

		request.setAttribute("totalEmployees", totalEmployees);
		request.setAttribute("totalCategories",totalCategories);
		request.setAttribute("totalBooks", totalBooks);
		request.setAttribute("totalCustomer", totalCustomer);
		request.setAttribute("totalRevies", totalRevies);
		request.setAttribute("totalOrdes", totalOrdes);
	
		String homePage = "index.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(homePage);
		requestDispatcher.forward(request, response);
	}


}
