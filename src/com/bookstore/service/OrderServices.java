package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.controller.frontend.shoppingCart.ShoppingCart;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.PaymentDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Order;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.Payment;

public class OrderServices {
	private OrderDAO orderDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.orderDAO = new OrderDAO();
	}

	public void listAllOrder() throws ServletException, IOException {
		listAllOrder(null);
	}

	public void listAllOrder(String message) throws ServletException, IOException {
		List<Order> listOrder = orderDAO.listAll();
		if (message != null) {
			request.setAttribute("message", message);
		}
		request.setAttribute("listOrder", listOrder);
		String listPage = "order_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void viewOrderDetailForAdmin() throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("id"));

		Order order = orderDAO.get(orderId);
		if (order != null) {
			request.setAttribute("order", order);

			String detailPage = "order_detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
			dispatcher.forward(request, response);
		} else {
			String message = "Could not find order with ID " + orderId;
			request.setAttribute(message, message);
		}

	}

	public void deleteOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		Order order = orderDAO.get(orderId);
		if (order != null) {
			orderDAO.delete(orderId);
			String message = "The order ID " + orderId + " has been deleted!";
			listAllOrder(message);
		} else {
			String message = "Could not find order with ID " + orderId
					+ ", or it might have been deleted by another admin.";
			request.setAttribute(message, message);
		}
	}

	public void showEditOrderForm() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		Order order = orderDAO.get(orderId);
		if (order == null) {
			String message = "Could not find order with ID " + orderId;
			request.setAttribute(message, message);
			return;
		}
		HttpSession session = request.getSession();
		Object isPendingBook = session.getAttribute("NewBookPendingToAddToOrder");
		if (isPendingBook == null) {
			session.setAttribute("order", order);
		} else {
			session.removeAttribute("NewBookPendingToAddToOrder");
		}

		String resultPage = "order_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(resultPage);
		dispatcher.forward(request, response);

	}

	public void showCheckOutForm() throws ServletException, IOException {
		
		String checkOutPage = "frontend/checkout.jsp";
		int orderId = 114;

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");

		Order order = orderDAO.get(orderId, customer.getCustomerId());
		request.setAttribute("order", order);

		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(checkOutPage);
		requestDispatcher.forward(request, response);

	}

	public void placeOrder() throws ServletException, IOException {
		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
		String paymentMethod = request.getParameter("paymentMethod");
		String shippingAddress = address + ", " + city + ", " + zipcode + ", " + country;
		String nameCard = request.getParameter("nameCard");
		String cardNumber = request.getParameter("cardNumber");
		String expDate = request.getParameter("expDate");
		Integer cvc = Integer.parseInt(request.getParameter("cvc"));

		Order order = new Order();
		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(shippingAddress);
		order.setPaymentMethod(paymentMethod);

		Payment payment = new Payment();
		payment.setNameCard(nameCard);
		payment.setCardNumber(cardNumber);
		payment.setExpiratinDate(expDate);
		payment.setCvc(cvc);

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		//payment.setNameCard(nameCard);
		order.setCustomer(customer);
		order.setPayment(payment);
		
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		Map<Book, Integer> items = shoppingCart.getItems();

		Iterator<Book> iterator = items.keySet().iterator();

		Set<OrderDetail> orderDetails = new HashSet<>();
	
		while (iterator.hasNext()) {
			Book book = iterator.next();
			Integer quantity = items.get(book);
			float subtotal = quantity * book.getPrice();

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			
			orderDetails.add(orderDetail);
		}
		
		order.setOrderDetails(orderDetails);
		order.setOrderTotal(shoppingCart.getTotalAmount());

		PaymentDAO paymentDAO = new PaymentDAO();
		paymentDAO.create(payment);

		orderDAO.create(order);

		shoppingCart.clear();

		/*
		 * String message = "Thank you. Your order has been received." +
		 * "We will deliver your books within a few days.";
		 * request.setAttribute("message", message);
		 * 
		 * String messagePage = "frontend/message.jsp"; RequestDispatcher
		 * requestDispatcher = request.getRequestDispatcher(messagePage);
		 * requestDispatcher.forward(request, response);
		 */

		String message = "Thank you. Your order has been received." + "We will deliver your books within a few days.";
		request.setAttribute("message", message);
        request.setAttribute("order", order);
        request.setAttribute("payment", payment);
        String messagePage = "frontend/orderSummary.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
		requestDispatcher.forward(request, response);

	}

	public void listOrderByCustomer() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		List<Order> listOrders = orderDAO.listByCustomer(customer.getCustomerId());

		request.setAttribute("listOrders", listOrders);

		String historyPage = "frontend/order_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(historyPage);
		requestDispatcher.forward(request, response);

	}

	public void showOrderDetailForCustomer() throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");

		Order order = orderDAO.get(orderId, customer.getCustomerId());
		request.setAttribute("order", order);

		String historyPage = "frontend/order_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(historyPage);
		requestDispatcher.forward(request, response);

	}

	public void updateOrder() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");

		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String shippingAddress = request.getParameter("shippingAddress");
		String paymentMethod = request.getParameter("paymentMethod");
		String orderStatus = request.getParameter("orderStatus");

		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(shippingAddress);
		order.setPaymentMethod(paymentMethod);
		order.setOrderStatus(orderStatus);

		String[] arrayBookId = request.getParameterValues("bookId");
		String[] arrayPrice = request.getParameterValues("price");
		String[] arrayQuantity = new String[arrayBookId.length];

		for (int i = 1; i <= arrayQuantity.length; i++) {
			arrayQuantity[i - 1] = request.getParameter("quantity" + i);
		}

		Set<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails.clear();

		float totalAmount = 0.0f;

		for (int i = 0; i < arrayBookId.length; i++) {
			int bookId = Integer.parseInt(arrayBookId[i]);
			int quantity = Integer.parseInt(arrayQuantity[i]);
			float price = Float.parseFloat(arrayPrice[i]);

			float subtotal = price * quantity;

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(new Book(bookId));
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			orderDetail.setOrder(order);

			orderDetails.add(orderDetail);

			totalAmount += subtotal;
		}

		order.setOrderTotal(totalAmount);

		orderDAO.update(order);

		String message = "The order " + order.getOrderId() + " has been updated successfully!";

		listAllOrder(message);
	}

	public void orderSummary() throws ServletException, IOException{
		
		String placeOrderPage = "frontend/orderSummary.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(placeOrderPage);
		requestDispatcher.forward(request, response);

	}

}
