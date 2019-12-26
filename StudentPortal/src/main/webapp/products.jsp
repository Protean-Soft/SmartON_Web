<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="css/mdb.min.css">
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="css/style.css">

</head>

<body class="hidden-sn mdb-skin">

  <!--Double navigation-->
  <header>
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
         <span class="nav-link clearfix d-none d-sm-inline-block">Welcome Mr Putin </span>
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
            alt="avatar image">
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

        <h5 class="mt-1 mb-2">Vladimir Putin</h5>

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






<main style="padding-top: 5%;">



<!-- News jumbotron -->
<div class="jumbotron text-center hoverable p-4" style="margin: 2% !important;">

<h3 class="text-center font-weight-bold mb-4 pb-2">Our Products</h3>

  <div class="row" style="padding:1%;">
    <div class="col-md">

	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
    <div class="col-md">
	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
    <div class="col-md">
	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
  </div>



  <div class="row" style="padding:1%;">
    <div class="col-md">

	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
    <div class="col-md">
	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
    <div class="col-md">
	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
  </div>



  <div class="row" style="padding:1%;">
    <div class="col-md">

	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
    <div class="col-md">
	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
    <div class="col-md">
	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="img/cust/Card/card1.jpg" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	    <h4 class="card-title"><strong>Alison Belmont</strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong>Graffiti Artist</strong></h5>
	    <!-- Text -->
	    <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam. </p>

	    <a class="btn btn-unique">Book Now</a>
	    <!-- Linkedin -->
	    <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a>
	    <!-- Twitter -->
	    <a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a>
	    <!-- Dribbble -->
	    <a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a>

	  </div>
	</div>
	<!-- Card Narrower -->
    </div>
  </div>


</div>
<!-- News jumbotron -->





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
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <script src="js/addons/rating.min.js"></script>   
  <!-- Your custom scripts (optional) -->
  <script type="text/javascript">
	$(".button-collapse").sideNav();
        $(document).ready(function() {
  	   $('#rateMe1').mdbRate();
	});
  </script>

</body>
</html>
