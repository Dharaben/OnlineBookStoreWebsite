package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {

	private static CustomerDAO customerDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("dhaval@gmail.com");
		customer.setFullname("Dhaval Patel");
		customer.setCity("New Jersey");
		customer.setCountry("United State");
		customer.setAddress("245 Liberty Avenue");
		customer.setPassword("Dha@1");
		customer.setPhoneNumber("201981234");
		customer.setZipcode("07307");

		Customer savedCustomer = customer = customerDAO.create(customer);

		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		Integer customerId = 3;
		Customer customer = customerDAO.get(customerId);
		assertNotNull(customer);
	}

	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDAO.get(1);
		String zipcode = "07302";
		customer.setZipcode(zipcode);

		Customer updateCustomer = customerDAO.update(customer);

		assertTrue(updateCustomer.getZipcode().equals(zipcode));

	}

	@Test
	public void testDeleteCustomer() {
		Integer customerId = 4;
		customerDAO.delete(customerId);
		Customer customer = customerDAO.get(4);
		assertNull(customer);
	}

	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDAO.listAll();

		for (Customer customer : listCustomers) {
			System.out.println(customer.getFullname());
		}
		assertFalse(listCustomers.isEmpty());

	}

	@Test
	public void testCount() {
		long totalCustomers = customerDAO.count();
		System.out.println(totalCustomers);
		assertEquals(2, totalCustomers);

	}

	@Test
	public void testFindByEmail() {
		String email = "dhara@gmail.com";
		Customer customer = customerDAO.findByEmail(email);

		assertNotNull(customer);

	}

	@Test
	public void testCheckLoginSuccess() {
		String email = "dhara@gmail.com";
		String password = "secret";

		Customer customer = customerDAO.checkLogin(email, password);

		assertNotNull(customer);

	}

	@Test
	public void testCheckLoginFail() {
		String email = "dhar@gmail.com";
		String password = "secret";

		Customer customer = customerDAO.checkLogin(email, password);

		assertNull(customer);

	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

}
