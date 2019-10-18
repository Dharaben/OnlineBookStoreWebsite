package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Order;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.Payment;

public class OrderDAOTest {

	private static OrderDAO orderDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@Test
	public void testCreateOrder() {
		Order order = new Order();
		Customer customer = new Customer();
		customer.setCustomerId(1);
		
		order.setCustomer(customer);
		order.setRecipientName("Dhara");
		order.setRecipientPhone("2016549865");
		order.setShippingAddress("223 Columbia Avenue");

		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();

		Book book = new Book(4);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(120f);
		orderDetail.setOrder(order);

		orderDetails.add(orderDetail);

		order.setOrderDetails(orderDetails);

		orderDAO.create(order);

		assertTrue(order.getOrderId() > 0);

	}

	@Test
	public void testCreateBookOrder2() {
		Order order = new Order();
		Customer customer = new Customer();
		customer.setCustomerId(3);

		order.setCustomer(customer);
		order.setRecipientName("Kiran");
		order.setRecipientPhone("2016549865");
		order.setShippingAddress("223 Columbia Avenue");

		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail1 = new OrderDetail();

		Book book1 = new Book(5);
		orderDetail1.setBook(book1);
		orderDetail1.setQuantity(2);
		orderDetail1.setSubtotal(77.74f);
		orderDetail1.setOrder(order);

		orderDetails.add(orderDetail1);

		Book book2 = new Book(10);
		OrderDetail orderDetail2 = new OrderDetail();
		orderDetail2.setBook(book2);
		orderDetail2.setQuantity(1);
		orderDetail2.setSubtotal(33.99f);
		orderDetail2.setOrder(order);

		orderDetails.add(orderDetail2);

		order.setOrderDetails(orderDetails);

		orderDAO.create(order);

		assertTrue(order.getOrderId() > 0 && order.getOrderDetails().size() == 2);

	}

	@Test

	public void testUpdatOrderShippingAddress() {
		Integer orderId = 10;
		Order order = orderDAO.get(orderId);
		order.setShippingAddress("223 columbia Avenue");

		orderDAO.update(order);

		Order updatedOrder = orderDAO.get(orderId);

		assertEquals(order.getShippingAddress(), updatedOrder.getShippingAddress());
	}

	@Test
	public void testUpdateOrderDetail() {
		Integer orderId = 10;
		Order order = orderDAO.get(orderId);

		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 4) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(120f);
			}
		}

		orderDAO.update(order);

		Order updatedOrder = orderDAO.get(orderId);

		iterator = order.getOrderDetails().iterator();

		int expectedQuantity = 3;
		float expectedSubtotal = 120f;
		int actualQuantity = 0;
		float actualSubtotal = 0;

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 4) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}

		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);

	}

	@Test
	public void testGet() {
		Integer orderId = 10;
		Order order = orderDAO.get(orderId);
		System.out.println(order.getRecipientName());
		System.out.println(order.getRecipientPhone());
		System.out.println(order.getShippingAddress());
		System.out.println(order.getOrderStatus());
		System.out.println(order.getOrderTotal());
		System.out.println(order.getPaymentMethod());

		assertEquals(1, order.getOrderDetails().size());
	}

	@Test
	public void testDeleteOrder() {
		int orderId = 9;
		orderDAO.delete(orderId);

		Order order = orderDAO.get(orderId);

		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<Order> listOrders = orderDAO.listAll();

		for (Order order : listOrders) {
			System.out.println(order.getOrderId() + " - " + order.getCustomer().getFullname() + " - "
					+ order.getOrderTotal() + " - " + order.getOrderStatus());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}

		assertTrue(listOrders.size() > 0);

	}

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();

		assertEquals(3, totalOrders);
	}

	@Test
	public void testListByCustomerNoOrders() {
		Integer customerId = 99;
		List<Order> listOrders = orderDAO.listByCustomer(customerId);

		assertTrue(listOrders.isEmpty());
	}

	@Test
	public void testListByCustomerHaveOrders() {
		Integer customerId = 1;
		List<Order> listOrders = orderDAO.listByCustomer(customerId);

		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testGetByIdAndCustomerNull() {
		Integer orderId = 38;
		Integer customerId = 1;

		Order order = orderDAO.get(orderId, customerId);
		assertNull(order);
	}

	@Test
	public void testGetByIdAndCustomerNotNull() { // success order detail
		Integer orderId = 25;
		Integer customerId = 1;

		Order order = orderDAO.get(orderId, customerId);
		assertNotNull(order);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testListMostRecentSales() {
		List<Order> recentOrders = orderDAO.listMostRecentSales();
		System.out.println("List recent order" + recentOrders);
		assertEquals(3, recentOrders.size());
	}
}
