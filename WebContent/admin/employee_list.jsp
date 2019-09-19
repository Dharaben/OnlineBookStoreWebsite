<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Employees - DK Bookstore Administration</title>
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
		<div class="panel-group">
			<div class="panel panel-info">
				<div class="panel-body">
					<div align="center">
						<h3>Employee Management</h3>
						<br/>
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
								<th>Email</th>
								<th>Full Name</th>
								<th>Actions</th>
							</tr>
						</thead>
						<c:forEach var="employee" items="${listEmployees}"
							varStatus="status">
							<tbody>
								<tr class="info">
									<td>${status.index+1}</td>
									<td>${employee.employeeId}</td>
									<td>${employee.email}</td>
									<td>${employee.fullName}</td>
									<td>
										<div class="btn-group">
											<button type="button" class="btn btn-danger"
												onclick="location.href = 'javascript:confirmationDelete()';"><span class="glyphicon glyphicon-edit"></span> Delete</button>
										</div>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	<jsp:directive.include file="footer.jsp" />
</body>
</html>