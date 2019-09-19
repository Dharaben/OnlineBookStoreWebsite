<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New category</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.css">
<!-- jQuery library -->
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
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
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div class="container" style="height:1000px">
		<div class="panel-group">
			<div class="panel panel-info">
				<div class="panel-heading" align="center">
						<h3>
						 <c:if test="${category !=null}">
						 Update category Information
						 </c:if>
						
						 	 <c:if test="${category ==null}">
							<b>New Category Information</b>
							</c:if>
					</h3>
				</div>
			</div>
		</div>
		<c:if test="${category !=null}">
		<form class="form-horizontal" action="update_category" method="post" id="categoryForm" role="form" data-toggle="validator">
			<input type="hidden" class="form-control" name="categoryId" value="${category.categoryId}">
			</c:if>
			<c:if test="${category==null}">
		<form class="form-horizontal" action="create_category" method="post" id="categoryForm" role="form" data-toggle="validator"> 
			</c:if>
		
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Category Name: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control inputstl" id="name"
						placeholder="Enter Category Name" name="name" value="${category.name}" required="required" data-error="Please enter your Categort Name.">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-danger" value="Save"><span class="glyphicon glyphicon-save"> Add category</button>
					<button type="submit" class="btn btn-danger" value="Cancel" id="buttonCancel" onClick="javascript:history.go(-1);">Cancel</button>
				</div>
			</div>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
</html>