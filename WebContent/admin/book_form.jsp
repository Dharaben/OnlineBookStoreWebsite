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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<!-- BootSrap library -->
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	<!-- JQuery Library -->
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

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
    background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #A4FFA4), to(#FFFFFF)); 
    background: -moz-linear-gradient(top, #FFFFFF, #A4FFA4 1px, #FFFFFF 25px); 
    box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 

    } 
   
</style>
<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container" style="height: 1150px">
		<div class="panel-group">
			<div class="panel panel-info">
				<div class="panel-heading" align="center">
						<h3>
							<c:if test="${book !=null}">
						 Update Book Information
						 </c:if>
						
							<c:if test="${book ==null}">
								<b>New book Information</b>
							</c:if>
						</h3>
				</div>
			</div>
		</div>
		<c:if test="${book !=null}">
			<form class="form-horizontal" action="update_book" method="post"
				id="bookForm" role="form" data-toggle="validator" enctype="multipart/form-data">
				<input type="hidden" class="form-control" name="bookId"
					value="${book.bookId}">
		</c:if>
		<c:if test="${category==null}">
			<form class="form-horizontal" action="create_book" method="post"
				id="bookForm" role="form" data-toggle="validator" enctype="multipart/form-data">
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
					placeholder="Enter Book Title" name="title" value="${book.title}"
					required="required" data-error="Please enter your Book Title.">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="author">Author: </label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="author"
					placeholder="Enter Book Author" name="author"
					value="${book.author}" required="required"
					data-error="Please enter your Book Author.">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-sm-2" for="isbn">ISBN: </label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="isbn"
					placeholder="Enter Book ISBN Number" name="isbn" value="${book.isbn}"
					required="required" data-error="Please enter your Book ISBN.">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="publishedDate">Publish
				Date: </label>
			<div class="col-sm-3 input-group date">
				<input type="text" class="form-control inputstl" name="publishedDate" id="publishedDate"  value="<fmt:formatDate pattern='MM/dd/yyyy' value='${book.publishedDate}'/>"
					placeholder="Select Date"  data-error="Please select your date."> <span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
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
						
						
							<img id="thumbnail"
					alt="Image Preview" style="width: 30%; margin-top: 10px"
					src="data:image/jpg;base64,${book.base64Image}" />
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">

			<label class="control-label col-sm-2" for="price">Price:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control inputstl" id="price"
					placeholder="Enter Book Price" name="price" value="${book.price}"
					required="required" data-error="Please enter your Book Price.">
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
						rows="10 placeholder=" placeholder="Enter Book Description" >${book.description}</textarea>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger" value="Save"><span class="glyphicon glyphicon-save"> Add
					Book</button>
				<button type="submit" class="btn btn-danger" value="Cancel"
					id="buttonCancel" onClick="javascript:history.go(-1);">Cancel</button>
			</div>
	
		</div>
	
	</div>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type='text/javascript'>
<<<<<<< HEAD
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
=======
	$(function() {
		$('.col-sm-3.date').datepicker({});
		
	});
	$('#bookImage').change(function() {
		showImageThumbnail(this);
>>>>>>> parent of ddf43aa... commit message goes here
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