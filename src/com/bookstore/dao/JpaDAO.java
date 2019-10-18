package com.bookstore.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

//This class JPA to implement some persistence operations
//that are common to all specific DAO classes
//All DAO class have subclasses of JpaDAO class.
//Alll DAO class implementing the Generic interface.
//<E> is Parameterize type of generic type E
//implement all operation for all subclasses
public class JpaDAO<E> {

	private static EntityManagerFactory entityManagerFactory;
	protected EntityManager entityManager;

	static {
		entityManagerFactory = Persistence.createEntityManagerFactory("OnlineBookStoreWebsite");
	}

	public JpaDAO() {

	}

	public E create(E entity) {

		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();

		entityManager.persist(entity);
		entityManager.flush();
		entityManager.refresh(entity);

		entityManager.getTransaction().commit();
		entityManager.close();

		return entity;
	}

	public E update(E entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.merge(entity);
		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}

	public E find(Class<E> type, Object id) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		E entity = entityManager.find(type, id);
		if (entity != null) {
			entityManager.refresh(entity);
		}
		entityManager.close();
		return entity;
	}

	public void delete(Class<E> type, Object id) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();

		Object reference = entityManager.getReference(type, id);
		entityManager.remove(reference);

		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public List<E> findWithNamedQuery(String queryName) {
		// this method returns a list of entity objects
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Query query = entityManager.createNamedQuery(queryName); // create query object from the entity manager
		List<E> result = query.getResultList(); // returns results
		
		entityManager.close();
		return result;
	}

	public List<E> findWithNamedQuery(String queryName, String paramName, Object paramValue) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);

		query.setParameter(paramName, paramValue);
		List<E> result = query.getResultList();
		entityManager.close();

		return result;
	}

	public List<E> findWithNamedQuery(String queryName, Map<String, Object> parameters) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);

		Set<Entry<String, Object>> setParameters = parameters.entrySet();

		for (Entry<String, Object> entry : setParameters) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<E> result = query.getResultList();

		entityManager.close();

		return result;
	}

	// list new book
	public List<E> findWithNamedQuery(String queryName, int firstResult, int maxResult) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);

		List<E> result = query.getResultList();

		entityManager.close();

		return result;
	}
	
	// list new book
	public List<Object[]> findWithNamedQueryObjects(String queryName, int firstResult, int maxResult) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);

		List<Object[]> result = query.getResultList();

		entityManager.close();

		return result;
	}

	public long countWithNamedQuery(String QueryName) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(QueryName);
		long result = (long) query.getSingleResult();
		entityManager.close();

		return result;
	}

	public long countWithNamedQuery(String QueryName, String paramName, Object paramValue) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(QueryName);

		query.setParameter(paramName, paramValue);
		long result = (long) query.getSingleResult();
		entityManager.close();

		return result;
	}

	public void close() {
		if (entityManagerFactory != null) {
			entityManagerFactory.close();
		}
	}

}