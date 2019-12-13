<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tag #</title>

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap-datepicker3.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap-datepicker.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js" type="text/javascript"></script>
	
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form resetForm" action="resetsubmit"
					method="POST">
					<span class="login100-form-title p-b-49"> <img
						src="images/PROTEANSOFT_SHORTLOGO.jpg" alt="Product Logo"
						style="max-height: 40px; max-width: 40px;">&nbsp;&nbsp;Tag #
					</span> 
					
					<input type="text" id="user_email" value="${email}" /> <br /> <br />
					<div class="wrap-input100 validate-input m-b-23">

						<input id="newPassword" type="text" name="new_password"
							placeholder="New Password"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>
					<br>
					<div class="wrap-input100 validate-input"
						data-validate="Password is required">

						<input id="confirmPassword" type="password" name="confirmPassword"
							placeholder="Confirm Password"> <span
							class="focus-input100" data-symbol="&#xf190;"></span>

					</div>
					<br />
					<br />
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="reset" >Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="copyright" id="copyright">
			&copy;
			<script>
				document.getElementById('copyright').appendChild(
						document.createTextNode(new Date().getFullYear()))
			</script>
			, Powered by <a href="https://www.proteansoft.in" target="_blank">Proteansoft</a>.
		</div>

	</div>

	

</body>
</html>
