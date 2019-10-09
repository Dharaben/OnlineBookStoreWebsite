<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review Posted - Online Book Store</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700|Open+Sans:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<style type="text/css">
body {
	background: #e2eaef;
	font-family: "Open Sans", sans-serif;
}

h3 {
	color: #333;
	text-align: center;
	text-transform: uppercase;
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	position: relative;
	margin: 25px 0 50px;
}

h3::after {
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
	color: #FF0000;
	text-align: center;
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
	<div id="myCarousel" class="carousel slide" align="center">
		<h3>Your Reviews</h3>
		<h3>${loggedCustomer.fullname}</h3>


		<form id="reviewForm" action="submit_review" method="post">
			<table class="normal" width="60%">

				<tr>
					<td colspan="3"><hr /></td>
				</tr>
				<tr>
					<td><span id="book-title"><h3>
								<b>${book.title}</b>
							</h3></span><br />
					<br /> <img class="book-large"
						src="data:image/jpg;base64,${book.base64Image}" width="200"
						height="270	" /></td>
					<td>
						<h4>Your review has been posted. Thank you!</h4>
					</td>
				</tr>
			</table>

		</form>
		<br />
		<div class="form-group" align="center">
			<div align="center">
				<button type="submit" class="btn btn-danger" id="buttonCancel">
					<span class=""></span><b>Cancel</b>
				</button>
			</div>
		</div>

	</div>

	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript">
	$(document).ready(function() {

		$("#buttonCancel").click(function() {
			history.go(-2);
		});

	});
</script>
</html>