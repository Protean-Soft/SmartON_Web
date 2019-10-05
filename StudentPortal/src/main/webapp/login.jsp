<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tag #</title>
	
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap-datepicker3.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
		<div style="width:100%;display:none;" class="alertDiv"></div>
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<c:if test="${not empty errorMessage}">
					  <div style="width:100%;text-align:center" class="alert alert-danger alert-dismissible fade show">
						    <strong>Error!</strong> ${errorMessage}.
						</div>
				</c:if>
				<form class="login100-form validate-form" action="login" method="POST">
					<span class="login100-form-title p-b-49">
						<img src="images/ProductLogo.jpg" alt="Product Logo" style="max-height:40px;max-width:40px;">&nbsp;&nbsp;Tag #
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>
					<div class="text-right p-t-8">
						<span>
							Version 1.0
						</span>
					</div>
					<!--
					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Or Sign Up Using
						</span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>-->

					<div class="flex-col-c p-t-30">
						<span class="txt1 p-b-17">
							Or Sign Up Using
						</span>

						<a href="#" data-toggle="modal" data-target="#modalRegister" class="txt2">
							Sign Up
						</a>
					</div>
				</form>
			</div>
			<div class="modal fade" id="modalRegister" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Sign Up</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form id="registerForm" method="POST" action="registerUser">
								<div class="row">
									<div class="col-md-2">
										<span>User Name</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="User Name" value="" name="userName">
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<span>First Name</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="First Name" value="" name="firstName">
									</div>
									<div class="col-md-2">
										<span>Last Name</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="Last Name" value="" name="lastName">
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<span>Password</span>
									</div>
									<div class="col-md-4">
										<input type="password" class="form-control" placeholder="Password" value="" name="password">
									</div>
									<div class="col-md-2">
										<span>Confirm Password</span>
									</div>
									<div class="col-md-4">
										<input type="password" class="form-control" placeholder="Re-enter Password" value="">
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<span>E-Mail</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="E-mail" value="" name="email">
									</div>
									<div class="col-md-2">
										<span>College Name</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="College Name" value="" name="college">
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<span>Date-of-Birth</span>
									</div>
									<div class="col-md-4">
										<input class="form-control" class="date" id="dob" name="userDob" placeholder="MM/DD/YYY" type="text"/>
									</div>
									<div class="col-md-2">
										<span>Gender</span>
									</div>
									<div class="col-md-4">
										<select name="gender">
											<option value="">Select</option>
											<option value="male">Male</option>
											<option value="female">Female</option>
											<option value="others">Rather not to say</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<span>City</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="City" value="" name="city">
									</div>
									<div class="col-md-2">
										<span>State</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="State" value="" name="state">
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<span>Mobile Number</span>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="Mobile Number" value="" name="mobileNum">
									</div>
									<div class="col-md-3">
										<input type="radio" class="form-control" name="isPremium" value="premium" id="premium" checked/> Premium
									</div>
									<div class="col-md-3">
										<input type="radio" class="form-control" name="isPremium" value="guest" id="guest"/> Guest
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<div class="container-login100-form-btn">
								<div class="wrap-login100-form-btn">
									<div class="login100-form-bgbtn"></div>
										<button id="registerBtn" class="login100-form-btn">TagYourself</button>
								</div>
							</div>
							<div class="container-login100-form-btn">
								<div class="wrap-login100-form-btn">
									<div class="login100-form-bgbtn"></div>
										<button class="login100-form-btn">Clear</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
<footer class="page-footer font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    ProteanSoft
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->

	<div id="dropDownSelect1"></div>
	
	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap-datepicker.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	
</body>
</html>