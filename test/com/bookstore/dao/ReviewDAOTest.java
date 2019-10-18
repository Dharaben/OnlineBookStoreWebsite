package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {

	private static ReviewDAO reviewDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
	}

	@Test
	public void testCreateReview() {
		Review review = new Review();
		Book book = new Book();
		book.setBookId(4);

		Customer customer = new Customer();
		customer.setCustomerId(3);

		review.setBook(book);
		review.setCustomer(customer);

		review.setHeadline("Excellent Book!");
		review.setRating(5);
		review.setComment("A comprehensive book about Spring framework. Very good.");

		Review savedReview = reviewDAO.create(review);

		assertTrue(savedReview.getReviewId() > 0);

	}

	@Test
	public void testGet() {
		Integer reviewId = 1;
		Review review = reviewDAO.get(reviewId);

		assertNotNull(review);
	}

	@Test
	public void testUpdateReview() {
		Integer reviewId = 1;
		Review review = reviewDAO.get(reviewId);

		review.setHeadline("Excellent Book!");

		Review updatedReview = reviewDAO.update(review);

		assertEquals(review.getHeadline(), updatedReview.getHeadline());
	}

	@Test
	public void testListAll() {
		List<Review> listReview = reviewDAO.listAll();
		for (Review review : listReview) {
			System.out.println(review.getReviewId() + " - " + review.getBook().getTitle() + " - "
					+ review.getCustomer().getFullname() + " - " + review.getHeadline() + " - " + review.getRating());
		}
		assertTrue(listReview.size() > 0);
	}

	@Test
	public void testDeleteReview() {
		int reviewId = 1;
		reviewDAO.delete(reviewId);

		Review review = reviewDAO.get(reviewId);

		assertNull(review);
	}

	@Test
	public void testCount() {
		long totalReviews = reviewDAO.count();
		System.out.println("Total Reviews:" + totalReviews);
		assertTrue(totalReviews > 0);
	}

	@Test
	public void testFindByCustomerAndBookFound() {
		Integer customerId = 1;
		Integer bookId = 4;

		Review result = reviewDAO.findByCustomerAndBook(customerId, bookId);

		assertNotNull(result);
	}

	@Test
	public void testFindByCustomerAndBookNotFound() {
		Integer customerId = 100;
		Integer bookId = 99;

		Review result = reviewDAO.findByCustomerAndBook(customerId, bookId);

		assertNull(result);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

}
