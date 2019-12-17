<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Tag #</title>
  <!-- MDB icon -->
  <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="css/mdb.min.css">
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="css/style.css">

</head>

<body class="hidden-sn mdb-skin">

  <!--Double navigation-->
  <header>
  		<input type="hidden" id="userId" value = <% out.println(session.getAttribute("userId")); %> />  
    <!-- Sidebar navigation -->
    <div id="slide-out" class="side-nav sn-bg-4">
      <ul class="custom-scrollbar">
        <!-- Logo -->
        <li>
          <div class="logo-wrapper waves-light">
            <a href="#"><img src="img/cust/logoTrans.png" class="img-fluid flex-center" height="150" width="150" style="margin-left: 15%;"></a>
          </div>
        </li>
        <!--/. Logo -->
        <!--Social-->
        <li>
          <ul class="social">
            <li><a href="#" class="icons-sm fb-ic"><i class="fab fa-facebook-f"> </i></a></li>
            <li><a href="#" class="icons-sm pin-ic"><i class="fab fa-pinterest"> </i></a></li>
            <li><a href="#" class="icons-sm gplus-ic"><i class="fab fa-google-plus-g"> </i></a></li>
            <li><a href="#" class="icons-sm tw-ic"><i class="fab fa-twitter"> </i></a></li>
          </ul>
        </li>
        <!--/Social-->
        <!--Search Form-->
        <li>
          <form class="search-form" role="search">
            <div class="form-group md-form mt-0 pt-1 waves-light">
              <input type="text" class="form-control" placeholder="Search">
            </div>
          </form>
        </li>
        <!--/.Search Form-->
        <!-- Side navigation links -->
        <li>
          <ul class="collapsible collapsible-accordion">
            <li><a class="collapsible-header waves-effect arrow-r"><i class="fas fa-chevron-right"></i> About Us
		</a>
              <!--<div class="collapsible-body">
                <ul>
                  <li><a href="#" class="waves-effect">About Us - Submenu1</a>
                  </li>
                  <li><a href="#" class="waves-effect">About Us - Submenu2</a>
                  </li>
                </ul>
              </div>-->
            </li>
            <!--<li><a class="collapsible-header waves-effect arrow-r"><i class="fas fa-hand-point-up"></i>
                Product<i class="fas fa-angle-down rotate-icon"></i></a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="#" class="waves-effect">Product - Submenu1</a>
                  </li>
                  <li><a href="#" class="waves-effect">Product - Submenu2</a>
                  </li>
                </ul>
              </div>
            </li>
            <li><a class="collapsible-header waves-effect arrow-r"><i class="fas fa-eye"></i> Workshop<i class="fas fa-angle-down rotate-icon"></i></a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="#" class="waves-effect">Workshop - Submenu1</a>
                  </li>
                  <li><a href="#" class="waves-effect">Workshop - Submenu1</a>
                  </li>
                </ul>
              </div>
            </li>-->
            <li><a class="collapsible-header waves-effect arrow-r" data-toggle="modal" data-target="#modalLoginAvatar"><i class="fas fa-envelope"></i> Contact me</a>
            </li>
          </ul>
        </li>
        <!--/. Side navigation links -->
      </ul>
      <div class="sidenav-bg mask-strong"></div>
    </div>
    <!--/. Sidebar navigation -->
    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg scrolling-navbar double-nav">
      <!-- SideNav slide-out button -->
      <div class="float-left">
        <a href="#" data-activates="slide-out" class="button-collapse"><i class="fas fa-bars"></i></a>
      </div>
      <!-- Breadcrumb-->
      <div class="breadcrumb-dn mr-auto" style="margin-left: 1%;">
        <a href="#"><img src="img/cust/logoTrans.png" class="img-fluid flex-center" height="50" width="50"></a>
      </div>
      <ul class="nav navbar-nav nav-flex-icons ml-auto">
        <li class="nav-item">
          <a class="nav-link"><i class="far fa-comments"></i> <span class="clearfix d-none d-sm-inline-block">Support</span></a>
        </li>
        <li class="nav-item">
         <span class="nav-link clearfix d-none d-sm-inline-block">Welcome Mr <% out.println(session.getAttribute("fullName")); %> </span>
        </li>
        <!--<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            Dropdown
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>-->
      <li class="nav-item avatar dropdown">      	
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <img src="img/cust/Photo/photo2.jpg" class="rounded-circle z-depth-0"
            alt="avatar image" id="navbar_profile">
        </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="#"><i class="far fa-user"></i> My Account</a>
            <a class="dropdown-item" href="#"><i class="fas fa-key"></i> Change Password</a>
            <a class="dropdown-item" href="#"><i class="fas fa-fingerprint"></i> Log Off</a>
          </div>
      </li>
      </ul>
    </nav>
    <!-- /.Navbar -->
  </header>
  <!--/.Double navigation-->



<div class="modal fade" id="modalLoginAvatar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
    <!--Content-->
    <div class="modal-content">

      <!--Header-->
      <div class="modal-header">
        <img src="img/cust/Photo/photo2.jpg" alt="avatar" class="rounded-circle img-responsive">
      </div>
      <!--Body-->
      <div class="modal-body text-center mb-1">

        <h5 class="mt-1 mb-2"><span><% out.println(session.getAttribute("fullName")); %></span></h5>

        <div class="md-form ml-0 mr-0">
          <input type="text" type="text" id="form29" class="form-control form-control-sm validate ml-0">
          <label data-error="wrong" data-success="right" for="form29" class="ml-0">Your Email</label>
        </div>

        <div class="md-form ml-0 mr-0">
          <input type="text" type="text" id="form29" class="form-control form-control-sm validate ml-0">
          <label data-error="wrong" data-success="right" for="form29" class="ml-0">Your subject</label>
        </div>

        <div class="md-form ml-0 mr-0">
          <input type="text" type="text" id="form29" class="md-textarea form-control" rows="4">
          <label data-error="wrong" data-success="right" for="form29" class="ml-0">Your Message</label>
        </div>

        <div class="text-center mt-4">
          <button class="btn btn-unique">Send Message <i class="fas fa-sign-in ml-1"></i></button>
        </div>
      </div>

    </div>
    <!--/.Content-->
  </div>
</div>






<main style="padding-top: 5%; background-image: url(img/cust/Banner/bg7.jpg); background-attachment: fixed;">

<!--<div class="container-fluid">
  <div class="row">
	<div class="card card-image" style="background-image: url(img/cust/Banner/sb10.jpg);">

	    <div class="text-white text-center d-flex align-items-center rgba-black-strong py-5 px-4">
		<div>
		    <h2 class="card-title pt-2"><i class="far fa-user"></i> <strong> User Profile</strong></h2>
		</div>
	    </div>
	</div>
  </div>
</div>--></br></br>



<div class="container">
<div class="row">
    <div class="col-md-7">
<!-- Material form register -->
<div class="card">

    <h5 class="card-header info-color white-text text-center py-4 peach-gradient">
        <strong>User Profile Details</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center" style="color: #757575;" action="/userDetails" id="userDetailsForm">
			<input type="hidden" id="userid" value = <% out.println(session.getAttribute("userId")); %>>
			<input type="hidden" id="userName" value = <%out.println(session.getAttribute("userName")); %> />
			
            <div class="form-row">
                <div class="col">
                    <!-- First name -->
                    <div class="md-form">                        
                        <label for="collegeName">College Name</label>
                        <input type="text" id="collegeName" name="colleageName" class="form-control">
                    </div>
                </div>
                <div class="col">
                    <!-- Last name -->
                    <div class="md-form">
                     	<label for="userName">User Name</label>
                        <input type="text" id="userName" name="userName" class="form-control" value = <% out.println(session.getAttribute("userName")); %>>                       
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col">
                    <!-- First name -->
                    <div class="md-form">
                    	<label for="firstName">First Name</label>
                        <input type="text" id="firstName" name="firstName" class="form-control">                        
                    </div>
                </div>
                <div class="col">
                    <!-- Last name -->
                    <div class="md-form">
                    	<label for="lastName">Last Name</label>
                        <input type="text" id="lastName" name="lastName" class="form-control">                        
                    </div>
                </div>
            </div>

            <!-- E-mail -->
            <div class="md-form mt-0">
            	<label for="mailID">E-mail</label>
                <input type="email" id="mailID" class="form-control">                
            </div>

            <!-- Phone number -->
            <div class="md-form">
            	<label for="phoneNo">Phone Number</label>
                <input type="text" id="phoneNo" name="phoneNo" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock">                
                <!--<small id="materialRegisterFormPhoneHelpBlock" class="form-text text-muted mb-4">
                    Optional - for two step authentication
                </small>-->
            </div>

            <div class="form-row">
                <div class="col">
                    <!-- First name -->
                    <div class="md-form">
                    	<label for="city">City</label>
                        <input type="text" id="city" name="city" class="form-control">                        
                    </div>
                </div>
                <div class="col">
                    <!-- Last name -->
                    <div class="md-form">
                    	<label for="state">State</label>
                        <input type="text" id="state" name="state" class="form-control">                        
                    </div>
                </div>
                <div class="col">
                    <!-- Last name -->
                    <div class="md-form">
                    	 <label for="country">Country</label>
                        <input type="text" id="counrty" name= "country" class="form-control">                       
                    </div>
                </div>
            </div>

            <!-- Newsletter -->
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="materialRegisterFormNewsletter">
                <label class="form-check-label" for="materialRegisterFormNewsletter">Subscribe to our newsletter <em>or</em> updates</label>
            </div>

            <!-- Sign up button -->
            <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit" id="updatProfile">Update Profile</button>

             <hr>

            <!-- Terms of service -->
            <p>I agree to our
		        <a href="" target="_blank">terms of service</a>

		</form>
		<!-- Form -->

	    </div>

	</div>
	<!-- Material form register -->
    </div>


    <div class="col-md-5">
	<!-- Card -->
	<div class="card testimonial-card">

	  <!-- Background color -->
	  <div class="card-up indigo peach-gradient"></div>

	  <!-- Avatar -->
	  <div class="avatar mx-auto white">
	    <img src="img/cust/Photo/photo2.jpg" class="rounded-circle" alt="woman avatar" id="show_profilePic">
	  </div>

	  <!-- Content -->
	  <div class="card-body">
	    <!-- Name -->
	    <h4 class="card-title"> <% out.println(session.getAttribute("fullName")); %></h4>
		<form class="md-form" action="tag/userProfile/uploadImage" method="post"  enctype="multipart/form-data" id="profile_form">
		  <input type="hidden" name = "id" value="${userId }">	
		  <div class="file-field">
		    <a class="btn-floating purple-gradient mt-0 float-left">
		      <i class="fas fa-cloud-upload-alt" aria-hidden="true"></i>
		      <input type="file" name = "pic" id="profile_pic">
		    </a>
		    <div class="file-path-wrapper">
		      <input class="file-path validate" type="text" placeholder="Upload your photo">
		    </div>
		  </div>
		</form>
	    <!-- Quotation -->
	    <p><i class="fas fa-quote-left"></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisci <i class="fas fa-quote-right"></i></p>

	    <hr> 	
            <!--<a type="button" class="btn-floating btn-fb btn-sm">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a type="button" class="btn-floating btn-tw btn-sm">
                <i class="fab fa-twitter"></i>
            </a>
            <a type="button" class="btn-floating btn-li btn-sm">
                <i class="fab fa-linkedin-in"></i>
            </a>
            <a type="button" class="btn-floating btn-git btn-sm">
                <i class="fab fa-github"></i>
            </a>-->


	<div style="padding-top: 3%;">
	<p style="float:left;">Profile Completion:</p>
		<div class="progress md-progress">
		    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisciLorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisciLorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisci"></div>
		</div>
		<div class="progress md-progress">
		    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisciLorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisciLorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisci"></div>
		</div>
		<div class="progress md-progress">
		    <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisciLorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisciLorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisci"></div>
		</div>

	</div>
		<div class="card">
		  <div class="card-header">
		    Hey, Complete your profile to get extra Tag Money
		  </div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item" style="font-size: 15px; font-family: sans-serif;"><i class="far fa-hand-point-right"></i> Atten 3 Events and Get # Money 150</li>
		    <li class="list-group-item" style="font-size: 15px; font-family: sans-serif;"><i class="far fa-hand-point-right"></i> Atten 6 Events and Get # Money 250</li>
		    <li class="list-group-item" style="font-size: 15px; font-family: sans-serif;"><i class="far fa-hand-point-right"></i> Refer 3 Friends and Get # Money 250</li>
		    <li class="list-group-item" style="font-size: 15px; font-family: sans-serif;"><i class="far fa-hand-point-right"></i> Refer 6 Friends and Get # Money 350</li>
		  </ul>
		</div>
	  </div>
	</div>
	<!-- Card -->
    </div>
  </div>
</div></br>



<!-- Footer -->
<footer class="page-footer font-small mdb-color pt-4">

  <!-- Footer Links -->
  <div class="container text-center text-md-left">

    <!-- Footer links -->
    <div class="row text-center text-md-left mt-3 pb-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Company name</h6>
        <p>Here you can use rows and columns to organize your footer content. Lorem ipsum dolor sit amet,
          consectetur
          adipisicing elit.</p>
      </div>
      <!-- Grid column -->

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
        <p>
          <a href="#">Java / .Net</a>
        </p>
        <p>
          <a href="#">Selinium</a>
        </p>
        <p>
          <a href="#">Digial Marketing</a>
        </p>
        <p>
          <a href="#">Bootstrap Angular</a>
        </p>
      </div>
      <!-- Grid column -->

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Useful links</h6>
        <p>
          <a href="#">Your Account</a>
        </p>
        <p>
          <a href="#">Create account</a>
        </p>
        <p>
          <a href="#">FAQ</a>
        </p>
        <p>
          <a href="#">Help</a>
        </p>
      </div>

      <!-- Grid column -->
      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
        <p>
          <i class="fas fa-home mr-3"></i> Chennai, CN 606202</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> info@gmail.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> + 91 9566596124/p>
        <p>
          <i class="fas fa-print mr-3"></i> + 91 9566596124</p>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Footer links -->

    <hr>

    <!-- Grid row -->
    <div class="row d-flex align-items-center">

      <!-- Grid column -->
      <div class="col-md-7 col-lg-8">

        <!--Copyright-->
        <p class="text-center text-md-left">© 2018 Copyright:
          <a href="#">
            <strong> SmartAnt Technologies Private Limited</strong>
          </a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-5 col-lg-4 ml-lg-0">

        <!-- Social buttons -->
        <div class="text-center text-md-right">
          <ul class="list-unstyled list-inline">
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-google-plus-g"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </li>
          </ul>
        </div>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

</footer>
<!-- Footer -->

</main>

  <!-- jQuery -->
  <script src="http://localhost:8080/vendor/jquery/jquery-3.2.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script src="vendor/bootstrap/js/popper.js"></script>	
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="vendor/bootstrap/js/mdb.min.js"></script>
  <!-- Your custom scripts (optional) -->
  <script type="text/javascript" src="js/userProfile.js"></script>
  <script type="text/javascript">
  
			$(document).ready(function() {
				$(".button-collapse").sideNav();
			});
		</script>

</body>
</html>
