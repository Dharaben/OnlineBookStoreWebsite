package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.Customer;

public class CustomerServices {

	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.customerDAO = new CustomerDAO();
	}

	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDAO.listAll();

		if (message != null) {
			request.setAttribute("message", message);
		}

		request.setAttribute("listCustomer", listCustomer);

		String listPage = "customer_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}

	public void listCustomers() throws ServletException, IOException {

		listCustomers(null);
	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);

		if (existCustomer != null) {
			String message = "Could not register: the email " + email + " is already registered by another customer!";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/register_form.jsp");
			dispatcher.forward(request, response);
		} else {
			String fullname = request.getParameter("fullname");
			String password = request.getParameter("password");
			String phoneNumber = request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String zipcode = request.getParameter("zipcode");
			String country = request.getParameter("country");

			Customer newCustomer = new Customer();
			newCustomer.setEmail(email);
			newCustomer.setFullname(fullname);
			newCustomer.setPassword(password);
			newCustomer.setPhoneNumber(phoneNumber);
			newCustomer.setAddress(address);
			newCustomer.setCity(city);
			newCustomer.setZipcode(zipcode);
			newCustomer.setCountry(country);

			customerDAO.create(newCustomer);
			String message = "You have registered successfully! Thank you. <br/> "
					+ "<a href='frontend/login.jsp'>Click here</a> to login !";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/register_form.jsp");
			dispatcher.forward(request, response);
		}
	}

	public void showLogin() throws ServletException, IOException {

		String loginPage = "frontend/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);

	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Customer customer = customerDAO.checkLogin(email, password);

		if (customer == null) {
			String message = "Login failed. Please check your email and password!";
			request.setAttribute("message", message);
			showLogin();
		} else {
			HttpSession session = request.getSession(true);//Reuse existing
			session.setAttribute("loggedCustomer", customer);
			session.setMaxInactiveInterval(30); //30 second
			
			  Cookie ck=new Cookie("customer", email); //store cookies
	          response.addCookie(ck);
			Object objRedirectURL = session.getAttribute("redirectURL");

			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showCustomerHomePage();
			}

		}

	}

	public void showCustomerProfile() throws ServletException, IOException {
		String profilePage = "frontend/customer_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		String editPage = "frontend/edit_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
		dispatcher.forward(request, response);
	}

	public void showCustomerHomePage() throws ServletException, IOException {
	
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
		
		String homepage = "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}

	private void updateCustomerFieldsForm(Customer customer) {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");

		if (email != null && !email.equals("")) {
			customer.setEmail(email);
		}

		customer.setFullname(fullname);

		if (password != null && !password.equals("")) {
			customer.setPassword(password);
		}
		customer.setPhoneNumber(phoneNumber);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setZipcode(zipcode);
		customer.setCountry(country);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsForm(customer);

		customerDAO.update(customer);
		showCustomerProfile();
	}
}