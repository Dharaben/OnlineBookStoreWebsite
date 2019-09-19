package com.bookstore.dao;

import java.util.List;

//GenericDAO interface define operations that 
//are common to all specific DAO classes
public interface GenericDAO<T> {
	public T create(T t);

	public T update(T t);

	public T get(Object id);

	public void delete(Object id);

	public List<T> listAll();

	public long count(); // this method returns total 
	                     //number of entity and total number of rows in a table

}