<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Book</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- jQuery library -->
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<script
	src="js/<a href="https://www.jqueryscript.net/tags.php?/Validation/">Validation</a>FormScript.js"></script>
<!-- DatetimePicker library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<style>
.inputstl {
	padding: 9px;
	border: solid 1px #FFA07A;
	outline: 0;
	background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF),
		color-stop(4%, #A4FFA4), to(#FFFFFF));
	background: -moz-linear-gradient(top, #FFFFFF, #A4FFA4 1px, #FFFFFF 25px);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
}
</style>
<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container" style="height: 1200px">
		<div class="panel-group">
				<div class="panel-heading" align="center">
					<h3>
						<c:if test="${book !=null}">
						 <h3><button type="button" class="btn btn-danger btn-lg btn-block">Update book Information</button></h3>
						 </c:if>

						<c:if test="${book ==null}">
							<h3><button type="button" class="btn btn-danger btn-lg btn-block">New book Information</button></h3>
	
						</c:if>
					</h3>
				</div>
		
		</div>
		<c:if test="${book !=null}">
			<form class="form-horizontal" action="update_book" method="post"
				id="bookForm" enctype="multipart/form-data">
				<input type="hidden" class="form-control" name="bookId"
					value="${book.bookId}">
		</c:if>
		<c:if test="${category==null}">
			<form class="form-horizontal" action="create_book" method="post"
				id="bookForm" enctype="multipart/form-data">
		</c:if>
		<div class="form-group">
			<label class="control-label col-sm-2" for="title">Category: </label>
			<div class="col-md-4 selectContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-list"></i></span> <select name="category"
						class="form-control inputstl">
						<option>Please select your Category</option>
						<c:forEach items="${listCategory}" var="category">
							<c:if test="${category.categoryId eq book.category.categoryId}">
								<option value="${category.categoryId}" selected>
							</c:if>
							<c:if test="${category.categoryId ne book.category.categoryId}">
								<option value="${category.categoryId}">
							</c:if>
							${category.name}
							</option>
						</c:forEach>

					</select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="title">Title: </label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="title"
					placeholder="Enter Book Title" name="title" value="${book.title}">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="author">Author: </label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="author"
					placeholder="Enter Book Author" name="author"
					value="${book.author}">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-sm-2" for="isbn">ISBN: </label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="isbn"
					placeholder="Enter Book ISBN Number" name="isbn"
					value="${book.isbn}">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="publishedDate">Publish
				Date: </label>
			<div class="col-sm-3 input-group date">
				<input type="text" class="form-control inputstl"
					name="publishedDate" id="publishedDate"
					value="<fmt:formatDate pattern='MM/dd/yyyy' value='${book.publishedDate}'/>"
					placeholder="Select Date">
				<span class="input-group-addon"> <i
					class="glyphicon glyphicon-calendar"></i>
				</span>

			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="title">Book Image:
			</label>
			<div class="col-sm-10">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01"></span>
					</div>
					<div class="custom-file">
						<input type="file" class="form-control inputstl" id="bookImage"
							name="bookImage" aria-describedby="inputGroupFileAddon01">


						<img id="thumbnail" alt="Image Preview"
							style="width: 30%; margin-top: 10px"
							src="data:image/jpg;base64,${book.base64Image}" />
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">

			<label class="control-label col-sm-2" for="price">Price:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="price"
					placeholder="Enter Book Price" name="price" value="${book.price}">
			</div>
		</div>
				<div class="form-group">

			<label class="control-label col-sm-2" for="stockAvailable" >Stock Available:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="stockAvailable"
					placeholder="Enter Stock Available" name="stockAvailable" value="${book.unitstock}">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="description">Book
				Description: </label>
			<div class="col-sm-10">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-pencil"></i></span>
					<textarea class="form-control inputstl" name="description"
						rows="10 placeholder=" placeholder="Enter Book Description">${book.description}</textarea>

				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger" value="Save">
					<span class="glyphicon glyphicon-save"></span> Add Book
				</button>
				<button type="submit" class="btn btn-danger" value="Cancel"
					id="buttonCancel" onClick="javascript:history.go(-1);">
					<span class=""></span>Cancel
				</button>
			</div>
	
		</div>
	
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type='text/javascript'>
	$(document).ready(function() {
		$('.col-sm-3.date').datepicker({
			
		});
		$('#bookImage').change(function() {
			showImageThumbnail(this);
		});
		$("#bookForm").validate({
			rules : {
				category : "required",
				title : "required",
				author : "required",
				isbn : "required",
				publishDate : "required",
				
				<c:if test="${book==null}">
				bookImage : "required",
				</c:if>
				
				price : "required",
				stockAvailable:"required",
				description : "required",
			},
			messages : {
				category : "Please select a category for the book.",
				title : "Please enter title of the book.",
				author : "Please enter author of the book.",
				isbn : "Please enter ISBN of thr book.",
				publishDate : "Please enter publish date of the book.",
				bookImage : "Please choose an image of the book.",
				price : "Please enter price of the book.",
				stockAvailable:"Please enter Unit Stock Available Quantity. ",
				description : "Please enter description of the book.",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});

	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	}
</script>
</html>