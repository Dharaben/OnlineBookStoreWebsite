<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Books in ${category.name} - Online DK Book Store</title>
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
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase;
	position: relative;
	margin: 30px 0 60px;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 4px;
	border-radius: 1px;
	background: #7ac400;
	left: 0;
	right: 0;
	bottom: -20px;
}

.carousel {
	margin: 50px auto;
	padding: 0 70px;
}

.carousel .item {
	color: #747d89;
	min-height: 325px;
	text-align: center;
	overflow: hidden;
}

.carousel .thumb-wrapper {
	padding: 25px 15px;
	background: #fff;
	border-radius: 6px;
	text-align: center;
	position: relative;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.2);
}

.carousel .item .img-box {
	height: 120px;
	margin-bottom: 20px;
	width: 100%;
	position: relative;
}

.carousel .item img {
	max-width: 100%;
	max-height: 100%;
	display: inline-block;
	position: absolute;
	bottom: 0;
	margin: 0 auto;
	left: 0;
	right: 0;
}

.carousel .item h4 {
	font-size: 18px;
}

.carousel .item h4, .carousel .item p, .carousel .item ul {
	margin-bottom: 5px;
}

.carousel .thumb-content .btn {
	color: #7ac400;
	font-size: 11px;
	text-transform: uppercase;
	font-weight: bold;
	background: none;
	border: 1px solid #7ac400;
	padding: 6px 14px;
	margin-top: 5px;
	line-height: 16px;
	border-radius: 20px;
}

.carousel .thumb-content .btn:hover, .carousel .thumb-content .btn:focus
	{
	color: #fff;
	background: #7ac400;
	box-shadow: none;
}

.carousel .thumb-content .btn i {
	font-size: 14px;
	font-weight: bold;
	margin-left: 5px;
}

.carousel .carousel-control {
	height: 44px;
	width: 40px;
	background: #7ac400;
	margin: auto 0;
	border-radius: 4px;
	opacity: 0.8;
}

.carousel .carousel-control:hover {
	background: #78bf00;
	opacity: 1;
}

.carousel .carousel-control i {
	font-size: 36px;
	position: absolute;
	top: 50%;
	display: inline-block;
	margin: -19px 0 0 0;
	z-index: 5;
	left: 0;
	right: 0;
	color: #fff;
	text-shadow: none;
	font-weight: bold;
}

.carousel .item-price {
	font-size: 13px;
	padding: 2px 0;
}

.carousel .item-price strike {
	opacity: 0.7;
	margin-right: 5px;
}

.carousel .carousel-control.left i {
	margin-left: -2px;
}

.carousel .carousel-control.right i {
	margin-right: -4px;
}

.carousel .carousel-indicators {
	bottom: -50px;
}

.carousel-indicators li, .carousel-indicators li.active {
	width: 10px;
	height: 10px;
	margin: 4px;
	border-radius: 50%;
	border: none;
}

.carousel-indicators li {
	background: rgba(0, 0, 0, 0.2);
}

.carousel-indicators li.active {
	background: rgba(0, 0, 0, 0.6);
}

.carousel .wish-icon {
	position: absolute;
	right: 10px;
	top: 10px;
	z-index: 99;
	cursor: pointer;
	font-size: 16px;
	color: #abb0b8;
}

.carousel .wish-icon .fa-heart {
	color: #ff6161;
}

.star-rating li {
	padding: 0;
}

.star-rating i {
	font-size: 14px;
	color: #ffc000;
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="row">
		<div class="col-md-12">
			<h2>
				<b>${category.name}</b>
			</h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel"
				data-interval="0">

				<!-- Wrapper for carousel items -->
				<div class="carousel-inner">
					
						<div class="row">
							<c:forEach items="${listBooks}" var="book">
								<div class="col-sm-3">
									<div class="thumb-wrapper" style="width: 80%; margin: 0 auto;">
										<div class="img-box" align=center>
											<a href="view_book?id=${book.bookId}"> <img
												src="data:image/jpg;base64,${book.base64Image}"
												class="img-responsive img-fluid" width="128" height="164" />
											</a>
										</div>
										<div class="thumb-content">
											<h4>
												<a href="view_book?id=${book.bookId}"> <b>${book.title}</b>
												</a>
											</h4>
											<div>
												<i>by ${book.author}</i>
											</div>
											<div>
											<jsp:directive.include file="book_rating.jsp"/>
											<a href="view_book?id=${book.bookId}">(${fn:length(book.reviews)})</a>
											</div>
											<p class="item-price">
												<strike></strike> <b>$ ${book.price}</b>
											</p>

											<a href="add_to_cart?book_id=${book.bookId}" class="btn btn-primary">Add to Cart</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
				
				</div>
				<!-- Carousel controls -->
				<a class="carousel-control left carousel-control-prev"
					href="#myCarousel" data-slide="prev"> <i
					class="fa fa-angle-left"></i>
				</a> <a class="carousel-control right carousel-control-next"
					href="#myCarousel" data-slide="next"> <i
					class="fa fa-angle-right"></i>
				</a>
			</div>
		</div>
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".wish-icon i").click(function() {
			$(this).toggleClass("fa-heart fa-heart-o");
		});
	});
</script>
</html>
