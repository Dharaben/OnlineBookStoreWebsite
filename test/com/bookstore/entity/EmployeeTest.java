package com.bookstore.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EmployeeTest {

	public static void main(String[] args) {
		Employee employee1 = new Employee();
		employee1.setFullName("Mr. Milan Patel");
		employee1.setAddress("223 Columbia Avenue");
		employee1.setCity("NJ");
		employee1.setPhoneNumber("201346543");
		employee1.setEmail("milan@yahoo.com");
		employee1.setPassword("1234");
		employee1.setConfirmPassword("1234");

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("OnlineBookStoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin();
		entityManager.persist(employee1);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();

		System.out.print("A Employee object was persisted");

	}

}
