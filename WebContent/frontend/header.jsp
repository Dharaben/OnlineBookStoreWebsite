<script src='https://kit.fontawesome.com/a076d05399.js'>
	
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand">DK BookStore</a> <a class="navbar-brand"
				href="${pageContext.request.contextPath}/"><span
				class="glyphicon glyphicon-home"></span> Home</a>

			<ul class="nav navbar-nav navbar-left">

				<li class="dropdown"><a class="glyphicon glyphicon-th-list"
					data-toggle="dropdown" href="#"> Category <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:forEach var="category" items="${listCategory}"
							varStatus="status">
							<li><a href="view_category?id=${category.categoryId}"><font
									size="+1" color="red"> <c:out value="${category.name}" /></font>
							</a></li>
						</c:forEach>
					</ul></li>
			</ul>
		</div>

		<form class="navbar-form navbar-left" action="search" method="get">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					name="keyword">
			</div>
			<button type="submit" class="btn btn-danger">Search</button>

		</form>
		<ul class="nav navbar-nav navbar-right">

			<c:if test="${loggedCustomer==null}">
				<li><a href="login"><span
						class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
				<li><a href="register"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</c:if>

			<c:if test="${loggedCustomer!=null}">
				<li><a href="view_profile">Hello,
						${loggedCustomer.fullname}</a></li>
				<li><a href="view_orders"><span
						class="glyphicon glyphicon-sort-by-order"></span> Orders</a></li>
					
				<li><a href="logout">
				
				 <span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						
			</c:if>
       
			<li><a href="view_cart" id="cart"><i
					class="fa fa-shopping-cart "></i> Cart <span class="badge"
					style="color: orange;" ><b>${cart.totalQuantity}</b></span></a></li>
					
			

		</ul>

	</div>
</nav>
<script type="text/javascript">
	
		$(document).ready(function() {
			$("#clearCart").click(function() {
				window.location = 'clear_cart';
			});
			
			
		
		});
	</script>

