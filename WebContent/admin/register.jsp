<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700"
	rel="stylesheet">
<title>Register as a Employee</title>
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
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script
	src="js/<a href="https://www.jqueryscript.net/tags.php?/Validation/">Validation</a>FormScript.js"></script>

<style type="text/css">
body {
	color: #fff;
	background: #63738a;
	font-family: "Open Sans", sans-serif;
}

.form-control {
	height: 40px;
	box-shadow: none;
	color: #969fa4;
}

.form-control:focus {
	border-color: #5cb85c;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 400px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form h2 {
	color: #636363;
	margin: 0 0 15px;
	position: relative;
	text-align: center;
}

.signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 30%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
}

.signup-form h2:before {
	left: 0;
}

.signup-form h2:after {
	right: 0;
}

.signup-form .hint-text {
	color: #999;
	margin-bottom: 30px;
	text-align: center;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form input[type="checkbox"] {
	margin-top: 3px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	min-width: 140px;
	outline: none !important;
}

.signup-form .row div:first-child {
	padding-right: 10px;
}

.signup-form .row div:last-child {
	padding-left: 10px;
}

.signup-form a {
	color: #fff;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #5cb85c;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="signup-form">
		<c:if test="${message!=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>
		<form action="register" method="post" id="registerForm">
			<h2>Sign Up</h2>

			<p class="hint-text" id="head">Create your account. It's free and
				only takes a minute.</p>
			<div class="form-group">
				<div class="row"></div>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="fullName"
					id="fullName" placeholder="FullName">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="address" id="address"
					placeholder="Address">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="city" id="city"
					placeholder="City">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="phoneNumber"
					id="phoneNumber" placeholder="Phone Number">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id=email name="email"
					placeholder="Email">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="Password">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="confirmPassword"
					name="confirmPassword" placeholder="Confirm Password">
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-success btn-lg btn-block"
					id="SignUp">Sign Up</button>
			</div>
		</form>
		<div class="text-center" id="submit">
			Already have an account? <a href="login.jsp">Sign in</a>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#registerForm").validate({
		rules : {
			fullName : "required",
			address : "required",
			city : "required",
			phoneNumber : {
				required : true,
				phoneUS : true
			},
			email : {
				required : true,
				email : true
			},
			 password: {
			        required: true,
			        minlength : 5,
	                maxlength : 8,
	                passwordCheck: true
			      },
            confirmPassword : {
            	    required: true,
                    minlength : 5,
	                maxlength : 8,
                    equalTo : "#password"
            }
		},
		messages : {
			fullName : "Please enter a Full Name.",
			address : "Please enter Address.",
			city : "Please enter a city.",
			phoneNumber : {
				required : "Please enter phone number.",
				phoneUS : " Please enter a valid phone number."
			},
			email : {
				required : " Please enter email.",
				email : " Please enter an valid email address."
			},
			password: {
		        required: "Please enter a password.",
		        minlength: "Minimum password length is 5",
                maxlength: "Maximum password length is 8",
                passwordCheck: "Password must contain an uppercase, lowercase, number and special character"
		      },
			confirmPassword : {
				required: 	"Please enter a Confirm Password.",
		        minlength: "Minimum password length is 5",
                maxlength: "Maximum password length is 8",
                equalTo : "Please enter same password as above"
			}
		}
	});
	
	$.validator.addMethod("passwordCheck", function(value) {
	   return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value)
	       && /[a-z]/.test(value)
	       && /[A-Z]/.test(value)
	       && /\d/.test(value)
	       && /[\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\>\=\?\@\[\]\{\}\\\\\^\_\`\~]/.test(value)
	});
});
</script>
</html>
