
<<<<<<< HEAD
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
=======
 <div class="my-custom-scrollbar my-custom-scrollbar-primary">
</div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">DK BookStore</a>
    </div>
    <form class="navbar-form navbar-left" action="#">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
      </div>
      <button type="submit" class="btn btn-danger">Search</button>

    </form>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     <li> <a href="#"><span class="glyphicon glyphicon-shopping-cart"> Shopping Cart</span>
        </a></li>
    </ul>
  </div>
>>>>>>> parent of ddf43aa... commit message goes here
</nav>
<script type="text/javascript">
	
		$(document).ready(function() {
			$("#clearCart").click(function() {
				window.location = 'clear_cart';
			});
			
			
		
		});
	</script>

