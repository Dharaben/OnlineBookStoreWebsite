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

<title>Forever Books - Online Books Store</title>
</head>
<body>
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
	<jsp:directive.include file="footer.jsp" />
</body>
</html>