package com.bookstore.entity;
// Generated Sep 1, 2019 11:43:21 PM by Hibernate Tools 5.2.12.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Employee generated by hbm2java
 */
@Entity
@Table(name = "employee", catalog = "bookstoredb")
@NamedQueries({ @NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e ORDER BY e.fullName"),
		@NamedQuery(name = "Employee.findByEmail", query = "SELECT e FROM Employee e where e.email=:email"),
		@NamedQuery(name = "Employee.countAll", query = "SELECT Count(e.employeeId) FROM Employee e"),
		@NamedQuery(name = "Employee.checkLogin", query = "SELECT e FROM Employee e WHERE e.email=:email AND e.password=:password")

})
public class Employee implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer employeeId;
	private String email;
	private String password;
	private String fullName;

	public Employee() {
	}

	public Employee(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public Employee(String email, String fullName, String password) {
		this.email = email;
		this.fullName = fullName;
		this.password = password;
	}

	public Employee(Integer employeId, String email, String fullName, String password) {
		this(email, fullName, password);
		this.employeeId = employeId;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "employee_Id", unique = true, nullable = false)
	public Integer getEmployeeId() {
		return this.employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	@Column(name = "email", nullable = false, length = 45)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password", nullable = false, length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "fullName", nullable = false, length = 45)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

}
