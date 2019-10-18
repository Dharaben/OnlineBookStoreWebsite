<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DK Bookstore Administration</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h3>
			<button type="button" class="btn btn-success btn-lg btn-block">Administration
				DashBoard</button>
		</h3>
	</div>
	<div class="container" style="height: 1200px">
	<div class="panel-group" align="center">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3><b>Recent sales</b></h3>
			</div>
			<div class="panel-body">
					<table class="table">
					<thead>
						<tr class="danger">
							<th>Order ID</th>
							<th>Ordered By</th>
							<th>Book Copies</th>
							<th>Total</th>
							<th>Credit Card Method</th>
							<th>Status</th>
							<th>Order Date</th>
						</tr>
					</thead>
					<c:forEach items="${listMostREcentSales}" var="order"
						varStatus="status">
						<tbody>
							<tr class="info">
								<td><a href="view_order?id=${order.orderId}">${order.orderId}</a></td>
								<td>${order.customer.fullname}</td>
								<td>${order.bookCopies}</td>
								<td><fmt:formatNumber value="${order.orderTotal}"
										type="currency" /></td>
								<td>${order.paymentMethod}</td>
								<td>${order.orderStatus}</td>
								<td>${order.orderDate}</td>
							</tr>
								</tbody>
					</c:forEach>
				</table>
			</div>

		</div>
	</div>

	<div class="panel panel-info" align="center">
		<div class="panel-heading">
			<h3><b>Recent Review</b></h3>
		</div>
		<div class="panel-body">
				<table class="table">
				<thead>
					<tr class="danger">
						<th>Book</th>
						<th>Rating</th>
						<th>Headline</th>
						<th>Customer</th>
						<th>Review ON</th>
					</tr>
				</thead>
				<c:forEach items="${listMostRecentReviews}" var="review">
					<tbody>
					<tr class="info">
						<td>${review.book.title}</td>
						<td>${review.rating}</td>
						<td><a href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
						<td>${review.customer.fullname}</td>
						<td>${review.reviewTime}</td>
					</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="panel panel-warning" align="center">
		<div class="panel-heading">
			<h3><b>Statistics</b></h3>
		</div>
		<div class="panel-body"><b>Total Employees:</b> ${totalEmployees}
			&nbsp; &nbsp; &nbsp; &nbsp; <b>Total Books:</b> ${totalBooks} &nbsp; &nbsp;
			&nbsp; &nbsp; <b>Total Categories:</b> ${totalCategories} &nbsp; &nbsp;
			&nbsp; &nbsp; <b>Total Customers:</b> ${totalCustomer} &nbsp; &nbsp; &nbsp;
			&nbsp; <b>Total Reviews:</b> ${totalRevies} &nbsp; &nbsp; &nbsp; &nbsp;
			<b>Total Orders:</b> ${totalOrdes} &nbsp; &nbsp; &nbsp; &nbsp;</div>
	</div>

</div>

	<jsp:directive.include file="footer.jsp" />
</body>
</html>