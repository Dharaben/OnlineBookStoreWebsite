<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Books - DK Bookstore Administration</title>
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
<body>
	<jsp:directive.include file="header.jsp" />
	<h3><button type="button" class="btn btn-danger btn-lg btn-block">Book Management</button></h3>
		<div class="panel-group">
				<div class="panel-body">
					<div align="center">
						<h4>
						<button type="button" class="btn btn-success btn-lg" onclick="location.href = 'new_book';">Add Book</button>
						</h4>
					</div>
					<c:if test="${message != null}">
						<div align="center">
							<h4>${message}</h4>
						</div>
					</c:if>
					<table class="table">
						<thead>
							<tr class="danger">
								<th>Index</th>
								<th>ID</th>
								<th>Image</th>
								<th>Title</th>
								<th>Author</th>
								<th>Category</th>
								<th>Price</th>
								<th>Stock Available</th>
								<th>Last Updated</th>
								<th>Actions</th>
							</tr>
						</thead>
						<c:forEach var="book" items="${listBooks}" varStatus="status">
							<tbody>
								<tr class="info">
									<td>${status.index + 1}</td>
									<td>${book.bookId}</td>
									<td><img src="data:image/jpg;base64,${book.base64Image}"
										width="84" height="110" /></td>
									<td>${book.title}</td>
									<td>${book.author}</td>
									<td>${book.category.name}</td>
									<td>$${book.price}</td>
									<td>${book.unitstock}</td>
									<td><fmt:formatDate pattern='MM/dd/yyyy'
											value='${book.lastUpdateTime}' /></td>
									<td>

										<div class="btn-group">
											<button type="button" class="btn btn-success"
												onclick="location.href = 'edit_book?id=${book.bookId}';"> <span class="glyphicon glyphicon-edit"></span> Edit</button>
											<button type="button" class="btn btn-danger"
												onclick="deleteFunction(this.id);"  id="${book.bookId}">     <span class="glyphicon glyphicon-remove-circle"></span> Delete</button>
										</div>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script>
				function deleteFunction(bookId) {
					console.log("Book id: " + bookId);
					if(confirm('Are you sure you want to soft delete the book with ID '+ bookId +'?'))
					{
						window.location='delete_book?id=' + bookId;
					}
				}
	</script>
</html>