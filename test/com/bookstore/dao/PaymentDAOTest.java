package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Payment;

public class PaymentDAOTest {
	private static PaymentDAO paymentDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		paymentDAO = new PaymentDAO();
	}

	@Test
	public void testCreatePayment() {
		Payment payment = new Payment();
		payment.setNameCard("Mr Kiran");
		payment.setCardNumber("1234567891234507");
		payment.setExpiratinDate("10/10/25");
		payment.setCvc(234);

		Payment savedPayment = paymentDAO.create(payment);

		assertTrue(savedPayment.getPaymentId() > 0);

	}

	@Test
	public void testGet() {
		Integer paymentId = 1;
		Payment payment = paymentDAO.get(paymentId);

		assertNotNull(payment);
	}

	@Test
	public void testDeleteObject() {
		Integer paymentId = 4;
		paymentDAO.delete(paymentId);
		Payment payment = paymentDAO.get(4);

		assertNull(payment);
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistEmployee() {
		Integer paymentId = 50;
		paymentDAO.delete(paymentId);

	}

	@Test
	public void testListAll() {
		List<Payment> listPayment = paymentDAO.listAll();

		for (Payment payment : listPayment) {
			System.out.println(payment.getNameCard());
		}

		assertTrue(listPayment.size() > 0);
	}

	@Test
	public void testCount() {
		long totalPayment = paymentDAO.count();
		System.out.println(totalPayment);
		// assertEquals(4, totalUsers);
		assertTrue(totalPayment > 0);

	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		paymentDAO.close();
	}
}
