package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Payment;

public class PaymentDAO extends JpaDAO<Payment> implements GenericDAO<Payment> {
	

	@Override
	public Payment create(Payment payment) {
		return super.create(payment);
	}

	@Override
	public Payment get(Object id) {
		return super.find(Payment.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Payment.class, id);

	}

	@Override
	public List<Payment> listAll() {
		return super.findWithNamedQuery("Payment.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Payment.countAll");
	}

}
