package com.bookstore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Employee;

//// we just re-implement the all method with specific entity type
public class EmployeeDAO extends JpaDAO<Employee> implements GenericDAO<Employee> {

	public EmployeeDAO() {
		super();

	}

	public Employee create(Employee employee) {
		return super.create(employee);
	}

	@Override
	public Employee update(Employee employee) {
		return super.update(employee);
	}

	@Override
	public Employee get(Object employeeId) {
		return super.find(Employee.class, employeeId);
	}

	public Employee findByEmail(String email) {
		List<Employee> listEmployees = super.findWithNamedQuery("Employee.findByEmail", "email", email);

		if (listEmployees != null && listEmployees.size() > 0) {
			return listEmployees.get(0);
		}
		return null;
	}

	public boolean checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", password);

		List<Employee> listEmployee = super.findWithNamedQuery("Employee.checkLogin", parameters);

		if (listEmployee.size() == 1) {
			return true;
		}
		return false;
	}

	@Override
	public void delete(Object employeeId) {
		super.delete(Employee.class, employeeId);

	}

	@Override
	public List<Employee> listAll() {
		return super.findWithNamedQuery("Employee.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Employee.countAll");
	}

}
