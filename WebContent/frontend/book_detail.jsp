<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${book.title}-OnlineDKBookStore</title>
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

h2 {
	color: #333;
	text-align: center;
	text-transform: uppercase,lowercase;
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

.carousel {
	width: 650px;
	margin: 0 auto;
	padding-bottom: 50px;
}

.carousel .item {
	color: #999;
	font-size: 14px;
	text-align: center;
	overflow: hidden;
	min-height: 340px;
}

.carousel .item a {
	color: #eb7245;
}

.carousel .img-box {
	width: 145px;
	height: 145px;
	margin: 0 auto;
	border-radius: 50%;
}

.carousel .img-box img {
	width: 100%;
	height: 100%;
	display: block;
	border-radius: 50%;
}

.carousel .testimonial {
	color: #eb7245;
	padding: 30px 0 10px;
}

.carousel .overview {
	text-align: center;
	padding-bottom: 5px;
}

.carousel .overview b {
	color: #333;
	font-size: 15px;
	text-transform: uppercase;
	display: block;
	padding-bottom: 5px;
}

.carousel .star-rating i {
	font-size: 18px;
	color: #ffdc12;
}

.carousel .carousel-control {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: #999;
	text-shadow: none;
	top: 4px;
}

.carousel-control i {
	font-size: 20px;
	margin-right: 2px;
}

.carousel-control.left {
	left: auto;
	right: 40px;
}

.carousel-control.right i {
	margin-right: -2px;
}

.carousel .carousel-indicators {
	bottom: 15px;
}

.carousel-indicators li, .carousel-indicators li.active {
	width: 11px;
	height: 11px;
	margin: 1px 5px;
	border-radius: 50%;
}

.carousel-indicators li {
	background: #e2e2e2;
	border-color: transparent;
}

.carousel-indicators li.active {
	border: none;
	background: #888;
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<h2>${book.title}</h2>
	<div align="center">
		<b></b>
	</div>
	<br />
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<div class="item carousel-item active">
				<div class="img-box">
					<img class="book-large"
						src="data:image/jpg;base64,${book.base64Image}" />
				</div>
				<p class="testimonial">${book.description}</p>
				<p class="overview">
					<b><i>${book.author}</i></b>
				</p>
				<div>
					<jsp:directive.include file="book_rating.jsp" />&nbsp;&nbsp;&nbsp;
					<a href="#reviews">${fn:length(book.reviews)} Customer Reviews</a>
				</div>
				<div>
				<h3>
					<b>$ ${book.price}</b>	</h3>
					<h4><span>Status: </span>
					<c:choose>
						<c:when test = "${book.unitstock > 0}">
							<span class="text-success"><strong>In Stock</strong></span>
						</c:when>
						<c:otherwise>
							<span class="text-success"><strong>Out of Stock</strong></span>
	   					</c:otherwise>
   					</c:choose>
					</h4>
			
				
</div>
				<button type="submit" class="btn btn-success" id="buttonAddToCart">
					<b>Add to Cart</b>
				</button>

				<button type="button" class="btn btn-danger" id="buttonWriteReview" >
					<b>Write a Customer Review</b>
				</button>
				<h3>
					<a id="reviews"> <b>Customer Reviews</b></a>
				</h3>

				<table align="center">
					<c:forEach items="${book.reviews}" var="review">
						<tr>
							<td><c:forTokens items="${review.stars}" delims=","
									var="star">
									<c:if test="${star eq 'on'}">
										<img src="images/rating-on.png" />
									</c:if>

									<c:if test="${star eq 'off'}">
										<img src="images/rating-off.png" />
									</c:if>

								</c:forTokens> - <b>${review.headline}</b></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>by ${review.customer.fullname} on ${review.reviewTime}</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td><i>${review.comment}</i></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#buttonWriteReview").click(function() {
			window.location='write_review?book_id=' + ${book.bookId};
		});
		$("#buttonAddToCart").click(function() {
			window.location='add_to_cart?book_id=' + ${book.bookId};
		});
	});
		</script>
</html>
