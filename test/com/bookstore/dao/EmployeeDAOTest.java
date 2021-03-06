package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Employee;

public class EmployeeDAOTest {
	private static EmployeeDAO employeeDAO;

	@BeforeClass // before all test methods in the test class
	public static void setUpBeforeClass() {

		employeeDAO = new EmployeeDAO();
	}

	@Test // This annotation specifies the annotated method is a test method.
	public void testCreateEmployee() {
		Employee employee1 = new Employee();
		employee1.setFullName("Mr. Milan Patel");
		employee1.setAddress("223 Columbia Avenue");
		employee1.setCity("NJ");
		employee1.setPhoneNumber("201346543");
		employee1.setEmail("milan@yahoo.com");
		employee1.setPassword("1234");
		employee1.setConfirmPassword("1234");
		employee1 = employeeDAO.create(employee1);

		assertTrue(employee1.getEmployeeId() > 0); // condition is true
	}

	@Test(expected = PersistenceException.class) //
	public void testCreateEmployeeFieldsNotSet() {
		Employee employee1 = new Employee();

		employee1 = employeeDAO.create(employee1);

	}

	@Test
	public void testUpadteEmployee() {
		Employee employee = new Employee();
		employee.setEmployeeId(8);
		employee.setFullName("Mr. Kelvin Patel");
		employee.setAddress("223 Columbia Avenue");
		employee.setCity("NJ");
		employee.setPhoneNumber("201654329");
		employee.setEmail("kelvin@yahoo.com ");
		employee.setPassword("4321");
		employee.setConfirmPassword("4321");

		employee = employeeDAO.update(employee);
		String expected = "4321";
		String actual = employee.getConfirmPassword();

		assertEquals(expected, actual); // Two values are equal
	}

	@Test
	public void testGetEmployeeFound() {
		Integer employeeId = 1;
		Employee employee = employeeDAO.get(employeeId);

		if (employee != null) {
			System.out.println(employee.getEmail());
		}
		assertNotNull(employee); // object is not null
	}

	@Test
	public void testGetEmployeeNotFound() {
		Integer employeeId = 100;
		Employee employee = employeeDAO.get(employeeId);

		assertNull(employee); // object null
	}

	@Test
	public void testDeleteEmployee() {
		Integer employeeId = 34;
		employeeDAO.delete(employeeId);

		Employee employee = employeeDAO.get(employeeId);
		assertNull(employee);
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistEmployee() {
		Integer employeeId = 50;
		employeeDAO.delete(employeeId);

	}

	@Test
	public void testListAll() {
		List<Employee> listUsers = employeeDAO.listAll();

		for (Employee employee : listUsers) {
			System.out.println(employee.getEmail());
		}
		assertTrue(listUsers.size() > 0);
	}

	@Test
	public void testCount() {
		long totalUsers = employeeDAO.count();
		System.out.println(totalUsers);
		//assertEquals(4, totalUsers);
		assertTrue(totalUsers>0);
	}

	@Test
	public void testFindByEmail() {
		String email = "kiran@yahoo.com";
		Employee employee = employeeDAO.findByEmail(email);

		assertNotNull(employee);
	}

	@Test
	public void testCheckLoginSuccess() {
		String email = "dharapatel@yahoo.com";
		String password = "1234";
		boolean loginResult = employeeDAO.checkLogin(email, password);
		System.out.println("Login successfully.");
		assertTrue(loginResult);
	}

	@Test
	public void testCheckLoginFailed() {
		String email = "dharapatel1@yahoo.com";
		String password = "12342";
		boolean loginResult = employeeDAO.checkLogin(email, password);
		System.out.println("Login failed.");
		assertFalse(loginResult); // condition is false
	}

	@AfterClass // After all test methods in the test class
	public static void tearDownAfterClass() {
		employeeDAO.close();
	}

}
