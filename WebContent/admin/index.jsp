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

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
<div class="container">
  <div class="panel-group">
     <div class="panel panel-success">
      <div class="panel-heading"><center><h3><b>Administrative Dashboard</b></h3></center></div>
    </div>

    <div class="panel panel-primary">
      <div class="panel-heading"><b>Quick Action</b></div>
      <div class="panel-body">
      	<center><b>
      	  <a href="employee_form.jsp">New Employee</a> &nbsp; 
      	        <a href="new_book">New Book</a> &nbsp; 
				<a href="category_form.jsp">New Category</a> &nbsp; 
				<a href="customer_form.jsp">New Customer</a>
		</b></center>
      </div>
    </div>

    <div class="panel panel-success">
      <div class="panel-heading"><b>Recent sales</b></div>
      <div class="panel-body"></div>
    </div>

    <div class="panel panel-info">
      <div class="panel-heading"><b>Recent Review</b></div>
      <div class="panel-body"></div>
    </div>

    <div class="panel panel-warning">
      <div class="panel-heading"><b>Statistics</b></div>
      <div class="panel-body"></div>
    </div>
  </div>
</div>

	<jsp:directive.include file="footer.jsp" />
</body>
</html>