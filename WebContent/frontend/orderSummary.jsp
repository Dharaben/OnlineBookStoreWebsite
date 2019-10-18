<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Summary -DK BookStore</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: #e2eaef;
	font-family: "Open Sans", sans-serif;
}

h2 {
	color: #333;
	text-align: center;
	text-transform: uppercase, lowercase;
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	position: relative;
	margin: 25px 0 50px;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 3px;
	background: #ffdc12;
	left: 0;
	right: 0;
	bottom: -10px;
}

h4 {
	color: #333;
	text-align: left;
	text-transform: uppercase, lowercase;
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	position: relative;
	margin: 25px 0 50px;
}

</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<h2>Ordered Summary</h2>
	<div class="row invoice row-printable">
		<div class="col-md-7 col-md-offset-2">
			<!-- col-lg-12 start here -->
			<div class="panel panel-default plain" id="dash_0">
				<!-- Start .panel -->
				<div class="panel-body p30">
					<div class="row">
						<!-- Start .row -->
						<div class="col-lg-6">
							<!-- col-lg-6 start here -->
							<div class="invoice-logo">DKbookstore.com</div>
						</div>
						<!-- col-lg-6 end here -->
						<div class="col-lg-6">
							<!-- col-lg-6 start here -->
							<div class="invoice-from">
								<ul class="list-unstyled text-right">
									<li>DK Book Store</li>
									<li>2224 Columbia Avenue</li>
									<li>Jersey City,07303</li>
									<li>New Jersey</li>
									<li>USA</li>
									<li></li>
									<li></li>
									<li><b>Order Date: </b></li>
								</ul>
							</div>
						</div>
					
						<!-- col-lg-6 end here -->
						<div class="col-lg-12">
							<form id="orderForm" action="place_order" method="post">
								<!-- col-lg-12 start here -->
								<div class="invoice-details mt25">
									<div class="well">
										<ul class="list-unstyled mb0">
											<li><strong><h4>Shipping Address:</h4></strong></li>
											<li><strong>Name:</strong>${loggedCustomer.fullname}</li>
											<li><strong>Address:</strong>${loggedCustomer.address}</li>
											<li><strong>City:</strong>${loggedCustomer.city}</li>
											<li><strong>Country:</strong>${loggedCustomer.country}</li>
											<li><strong>Zip Code:</strong>${loggedCustomer.zipcode}
											</li>
											<li><strong>Phone Number:</strong>${loggedCustomer.phoneNumber}
											</li>

										</ul>
									</div>
								</div>

								<div class="invoice-details mt25">
									<div class="well">
										<ul class="list-unstyled mb0">
											<li><strong>Payment Method:</strong>${order.paymentMethod}</li>
											<li><strong>CVC</strong>
										</ul>
									</div>
								</div>
								<div class="invoice-items">
									<div class="table-responsive"
										style="overflow: hidden; outline: none;" tabindex="0">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th class="per5 text-center">ID</th>
													<th class="per70 text-center">Book</th>
													<th class="per5 text-center">Qty</th>
													<th class="per25 text-center">Total</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td></td>
													<td></td>
													<td class="text-center"></td>
													<td class="text-center"></td>
												</tr>
												<tr>
											</tbody>
											<tfoot>
												<tr>
													<th colspan="3" class="text-right">${cart.totalQuantity}
														book(s)</th>
													<th class="text-center"></th>
												</tr>
												<tr>
													<th colspan="3" class="text-right">Sub Total:</th>
													<th class="text-center"></th>
												</tr>
												<tr>
												<tr>
													<th colspan="3" class="text-right">Shipping Charge:</th>
													<th class="text-center"></th>
												</tr>
												<tr>
													<th colspan="3" class="text-right">Total:</th>
													<th class="text-center"></th>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
							</form>
						</div>
						<!-- col-lg-12 end here -->
					</div>
					<!-- End .row -->
				</div>
			</div>
			<!-- End .panel -->
		</div>
		<!-- col-lg-12 end here -->
	</div>


	<jsp:directive.include file="footer.jsp" />
</body>
</html>