package com.bookstore.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EmployeeTest {

	public static void main(String[] args) {
		Employee employee1 = new Employee();
		employee1.setEmail("dharapatel@yahoo.com");
		employee1.setFullName("Mrs. Dhara Patel");
		employee1.setPassword("1234");

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
