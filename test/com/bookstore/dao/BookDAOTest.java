package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOTest {

	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDAO = new BookDAO();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("java");
		category.setCategoryId(1);
		newBook.setCategory(category);

		newBook.setTitle("Effective Java(3rd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New Coverage-of generics,enums,annotations,autoboxing");
		newBook.setPrice(38.87f);
		newBook.setUnitstock(12);
		newBook.setIsbn("0-13-468599-7");

		DateFormat dateFormate = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormate.parse("05/28/2008");
		newBook.setPublishedDate(publishDate);

		String imagePath = "./books/Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);

		Book createBook = bookDAO.create(newBook);
		assertTrue(createBook.getBookId() > 0);
	}

	@Test
	public void testCreate2Book() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("java");
		category.setCategoryId(1);
		newBook.setCategory(category);

		newBook.setTitle("Java 8 in Action");
		newBook.setAuthor("Raoul-Gabriel Urma");
		newBook.setDescription("java 8 in Action is a clearly written guide to the new features of Java 8");
		newBook.setPrice(36.72f);

		newBook.setIsbn("1-61-729199-4");

		DateFormat dateFormate = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormate.parse("08/28/2014");
		newBook.setPublishedDate(publishDate);

		String imagePath = "./books/Java 8 in Action.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);

		Book createBook = bookDAO.create(newBook);
		assertTrue(createBook.getBookId() > 0);
	}

	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book exitBook = new Book();
		exitBook.setBookId(4);

		Category category = new Category("Java Programming");
		category.setCategoryId(1);
		exitBook.setCategory(category);

		exitBook.setTitle("Effective Java(3rd Edition)");
		exitBook.setAuthor("Joshua Bloch");
		exitBook.setDescription("New Coverage-of generics,enums,annotations,autoboxing");
		exitBook.setPrice(40f);

		exitBook.setIsbn("0-13-468599-8");

		DateFormat dateFormate = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormate.parse("05/28/2008");
		exitBook.setPublishedDate(publishDate);

		String imagePath = "./books/Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		exitBook.setImage(imageBytes);

		Book updatedBook = bookDAO.update(exitBook);
		assertEquals(updatedBook.getTitle(), "Effective Java(3rd Edition)");
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDAO.delete(bookId);
	}

	@Test
	public void testGetBookFail() {
		Integer bookId = 99;
		Book book = bookDAO.get(bookId);

		assertNull(book);
	}

	@Test
	public void testGetBookSuccess() {
		Integer bookId = 4;
		Book book = bookDAO.get(bookId);

		assertNotNull(book);
	}

	@Test //list all book
	public void testListAll() {
		List<Book> listBooks = bookDAO.listAll();

		for (Book aBook : listBooks) {
			System.out.println(aBook.getTitle() + "-" + aBook.getAuthor());
		}
		assertFalse(listBooks.isEmpty());
	}

	@Test
	public void testCount() {
		long totalBooks = bookDAO.count();
		System.out.println("Total Book Count: " + totalBooks);
		assertEquals(2, totalBooks);
	}

	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 10;
		bookDAO.delete(bookId);

		assertTrue(true);
	}

	@Test
	public void testFindByTitleNotExist() {
		String title = "Thinking in java";
		Book book = bookDAO.findByTitle(title);

		assertNull(book);
	}

	@Test
	public void testFindByTitleExist() {
		String title = "Effective Java(3rd Edition)";
		Book book = bookDAO.findByTitle(title);
		System.out.println("Book Author:" + book.getAuthor());
		System.out.println("Book Price" + book.getPrice());
		assertNotNull(book);
	}

	@Test
	public void testListByCategory() {
		int categoryId = 1;

		List<Book> listBooks = bookDAO.listByCategory(categoryId);

		assertTrue(listBooks.size() > 0);
	}

	@Test
	public void testSearchBookInTitle() {
		String keyword = "java";
		List<Book> result = bookDAO.search(keyword);

		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		assertEquals(3, result.size());
	}

	@Test
	public void testSearchBookInAuthor() {
		String keyword = "Craig Walls";
		List<Book> result = bookDAO.search(keyword);

		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		assertEquals(1, result.size());
	}

	@Test
	public void testSearchBookInDescription() {
		String keyword = "CompletableFuture";
		List<Book> result = bookDAO.search(keyword);

		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		assertEquals(1, result.size());
	}

	@Test
	public void testCountByCategory() {
		int categoryId = 69;
		long numOfBooks = bookDAO.countByCategory(categoryId);
		assertTrue(numOfBooks == 7);
	}

	@Test // list new Books
	public void testListByNewBooks() {
		List<Book> listNewBooks = bookDAO.listNewBooks();
		for (Book aBook : listNewBooks) {
			System.out.println(aBook.getTitle() + "-" + aBook.getPublishedDate());
		}
		assertEquals(4, listNewBooks.size());
	}

	@Test // list best selling books
	public void testListBestSellingBooks() {
		List<Book> topBestSellingBooks = bookDAO.listBestSellingBooks();

		for (Book book : topBestSellingBooks) {
			System.out.println(book.getTitle());
		}
		assertEquals(4, topBestSellingBooks.size());
	}

	@Test // list Most Favourite book
	public void testListMostFavoredBooks() {
		List<Book> topFavoredBooks = bookDAO.listMostFavoredBooks();

		for (Book book : topFavoredBooks) {
			System.out.println(book.getTitle());
		}
		assertEquals(4, topFavoredBooks.size());
	}

	@AfterClass // After all test methods in the test After class
	public static void tearDownAfterClass() {
		bookDAO.close();
	}
}
