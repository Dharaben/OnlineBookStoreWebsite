package com.bookstore.entity;
// Generated Sep 1, 2019 11:43:21 PM by Hibernate Tools 5.2.12.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CreditCart generated by hbm2java
 */
@Entity
@Table(name = "credit_cart", catalog = "bookstoredb")
public class CreditCart implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cardNumber;
	private int customerId;
	private Date expiringDate;
	private int cvc;
	private String holderName;

	public CreditCart() {
	}

	public CreditCart(int cardNumber, int customerId, Date expiringDate, int cvc, String holderName) {
		this.cardNumber = cardNumber;
		this.customerId = customerId;
		this.expiringDate = expiringDate;
		this.cvc = cvc;
		this.holderName = holderName;
	}

	@Id

	@Column(name = "card_number", unique = true, nullable = false)
	public int getCardNumber() {
		return this.cardNumber;
	}

	public void setCardNumber(int cardNumber) {
		this.cardNumber = cardNumber;
	}

	@Column(name = "customer_id", nullable = false)
	public int getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "expiring_date", nullable = false, length = 10)
	public Date getExpiringDate() {
		return this.expiringDate;
	}

	public void setExpiringDate(Date expiringDate) {
		this.expiringDate = expiringDate;
	}

	@Column(name = "cvc", nullable = false)
	public int getCvc() {
		return this.cvc;
	}

	public void setCvc(int cvc) {
		this.cvc = cvc;
	}

	@Column(name = "holder_name", nullable = false, length = 45)
	public String getHolderName() {
		return this.holderName;
	}

	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}

}
