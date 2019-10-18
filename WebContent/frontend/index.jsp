<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DK Bookstore Administration</title>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<<<<<<< HEAD
h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase,lowercase;
	position: relative;
	margin: 30px 0 60px;
}
=======
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
>>>>>>> parent of ddf43aa... commit message goes here

<title>Forever Books - Online Books Store</title>
</head>
<body>
<<<<<<< HEAD
	<jsp:directive.include file="header.jsp" />
	<div class="row">
		<div class="col-md-12">
			<h2>
				<b>New Books</b>
			</h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel"
				data-interval="0">

				<!-- Wrapper for carousel items -->
				<div class="carousel-inner">
			
						<div class="row">
							<c:forEach items="${listNewBooks}" var="book">
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
												<i><b>${book.author}</b></i>
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
	<hr>
	<div class="row">
		<div class="col-md-12">
			<h2>
				<b>Best-Selling Books</b>
			</h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel"
				data-interval="0">

				<!-- Wrapper for carousel items -->
				<div class="carousel-inner">
			
						<div class="row">
							<c:forEach items="${listBestSellingBooks}" var="book">
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
												<i><b>${book.author}</b></i>
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
	<hr>
	<div class="row">
		<div class="col-md-12">
			<h2>
				<b>Most-Favored Books</b>
			</h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel"
				data-interval="0">

				<!-- Wrapper for carousel items -->
				<div class="carousel-inner">
			
						<div class="row">
							<c:forEach items="${listMostFavoredBooks}" var="book">
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
												<i><b>${book.author}</b></i>
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
=======
<jsp:directive.include file="header.jsp" />
<div class="container">
<br/>
<br/>

    <div class="panel panel-primary">
      <div class="panel-heading"><center><b>New Books</b></center></div>
      <div class="panel-body"></div>
    </div>

    <div class="panel panel-success">
      <div class="panel-heading"><center><b>Best-Selling Books</b></center></div>
      <div class="panel-body"></div>
    </div>

    <div class="panel panel-info">
      <div class="panel-heading"><center><b>Most-Favored Books</b></center></div>
      <div class="panel-body"></div>
    </div>
  </div>
>>>>>>> parent of ddf43aa... commit message goes here
	<jsp:directive.include file="footer.jsp" />
</body>
</html>