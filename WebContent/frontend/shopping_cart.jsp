<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DkBookStore.com Shopping Cart</title>
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--jQuery bootstrap validation plugin -->
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
	text-transform: uppercase;
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
h3 {
	color: #FF0000;
	text-align: center;
	text-transform: uppercase,lowercase;
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	position: relative;
	margin: 25px 0 50px;
}


</style>

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<h2>Shopping Cart</h2>
	<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>

			</div>
		</c:if>

		<c:set var="cart" value="${sessionScope['cart']}" />

		<c:if test="${cart.totalItems==0 }">
			<h3>There's no items in your cart!</h3>
		</c:if>

		<c:if test="${cart.totalItems>0}">
			<form action="update_cart" method="post" id="cartForm">
	
    <div class="row" style="height: 1200px">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th><h4><b>Book</b></h4></th>
                        <th><h4><b>Quantity</b></h4></th>
                        <th class="text-center"><h4><b>Unit Price</b></h4></th>
                        <th class="text-center"><h4><b>SubTotal</b></h4></th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart.items}" var="item" varStatus="status">
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media" align="center">
                            <a class="thumbnail pull-left" href="view_book?id=${item.key.bookId}"> <img class="media-object"src="data:image/jpg;base64,${item.key.base64Image}" style="width: 100px; height: 120px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="view_book?id=${item.key.bookId}">${item.key.title}</a></h4>
                                <h5 class="media-heading"><a href="view_book?id=${item.key.bookId}">${item.key.author}</a></h5>
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="hidden" name="bookId" value="${item.key.bookId}" />
                        <input type="text" class="form-control" id="quantity" name="quantity${status.index + 1}" value="${item.value}">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong></strong><fmt:formatNumber value="${item.key.price}"
										type="currency" /></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong></strong><fmt:formatNumber value="${item.value*item.key.price}"
										type="currency" /></td>
                        <td class="col-sm-1 col-md-1">
                        <button type="button" class="btn btn-danger" onclick="location.href = 'remove_from_cart?book_id=${item.key.bookId}';">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </button></td>
                    </tr>
                   </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td>   </td>
                        <td> <i><b>${cart.totalQuantity} book(s)</b></i></td>
      
                        <td><h3>Total </h3></td>
                        <td align="center"><h3><fmt:formatNumber
										value="${cart.totalAmount}" type="currency" /></h3>	</td>
                        <td class="text-right"></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>  <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Update Cart
                        </button> </td>
                        <td> <button type="button" id="clearCart" value="Clear Cart" class="btn btn-danger">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Clear Cart
                        </button> </td>
                        <td>
                        <button type="button" class="btn btn-success" onclick="location.href = '${pageContext.request.contextPath}';">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></td>
                        <td>
                        <button type="button" class="btn btn-primary">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    </form>
    </c:if>
    
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">
	
		$(document).ready(function() {
			$("#clearCart").click(function() {
				window.location = 'clear_cart';
			});
			
			$("#cartForm").validate({
				rules : {
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						quantity${status.index + 1}: {
							required: true, number: true, min: 1
						},
					</c:forEach>
				},
				messages : {
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						quantity${status.index + 1}: { 
							required: "Please enter quantity!",
							number: "Quantity must be a number!",
							min: "Quantity must be greater than 0 !"
						},
					</c:forEach>					
				}
			});
		});
	</script>
</body>
</html>