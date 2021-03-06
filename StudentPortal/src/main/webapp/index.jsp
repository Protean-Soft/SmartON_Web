<%@page import="com.protean.student.StudentPortal.model.RegisterUserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="css/mdb.min.css">
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="css/style.css">
 
<style>
.feedback {
  background-color : #31B0D5;
  color: white;
  padding: 10px 20px;
  border-radius: 4px;
  border-color: #46b8da;
}
</style>
</head>

<body class="hidden-sn mdb-skin"> 
 
	<%-- 	<%
        	Long userId = (Long)request.getAttribute("userId");
        	String fullName = (String)request.getAttribute("fullName");
        	String userName = (String)request.getAttribute("userName");
        	String email = (String)request.getAttribute("email");
        	
        	System.out.println("JSP full name " + fullName);
        	session.setAttribute("userId", userId);
        	session.setAttribute("fullName", fullName);
        	session.setAttribute("userName", userName);
        	session.setAttribute("userEmail", email);
        %>  --%>
<%-- <%@ include file="navigationbar.jsp" %> --%>

<div id="nav-placeholder"></div>
<div style="width:100%;display:none;" class="alertDiv"></div>
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
          <input type="text" type="text" id="mail" class="form-control form-control-sm validate ml-0">
          <label data-error="wrong" data-success="right" for="mail" class="ml-0">Your Email</label>
        </div>

        <div class="md-form ml-0 mr-0">
          <input type="text" type="text" id="subject" class="form-control form-control-sm validate ml-0">
          <label data-error="wrong" data-success="right" for="subject" class="ml-0">Your subject</label>
        </div>

        <div class="md-form ml-0 mr-0">
          <input type="text" type="text" id="message" class="md-textarea form-control" rows="4">
          <label data-error="wrong" data-success="right" for="message" class="ml-0">Your Message</label>
        </div>

        <div class="text-center mt-4">
          <button class="btn btn-unique">Send Message <i class="fas fa-sign-in ml-1"></i></button>
        </div>
      </div>

    </div>
    <!--/.Content-->
  </div>
</div>

<div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <form id="feedBackForm">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Write to us</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="name" name="name" class="form-control validate">
          <label data-error="wrong" data-success="right" for="name">Your name</label>
        </div>

        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="email" id="email"  name="email" class="form-control validate">
          <label data-error="wrong" data-success="right" for="email">Your email</label>
        </div>

        <div class="md-form mb-5">
          <i class="fas fa-tag prefix grey-text"></i>
          <input type="text" id="sugges" name="sugges" class="form-control validate">
          <label data-error="wrong" data-success="right" for="sugges">Your suggestion to us</label>
        </div>

        <div class="md-form mb-5">
          <i class="fas fa-tag prefix grey-text"></i>
          <input type="text" id="feedback" name="feedback" class="form-control validate">
          <label data-error="wrong" data-success="right" for="feedback">Academic Feedback</label>
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-unique" onclick="sendfeedback()">Send <i class="fas fa-paper-plane-o ml-1"></i></button>
      </div>
    </div>
  </div>
  </form>
</div>


<!--Carousel Wrapper-->
<div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel" style="height:50%;">
  <!--Indicators-->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
  </ol>
  <!--/.Indicators-->
  <!--Slides-->
  <div class="carousel-inner" role="listbox">
    <!--First slide-->
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/cust/Banner/Banner4.jpg"
        alt="First slide">
    </div>
    <!--/First slide-->
    <!--Second slide-->
    <div class="carousel-item">
      <img class="d-block w-100" src="img/cust/Banner/Banner5.jpg"
        alt="Second slide">
    </div>
    <!--/Second slide-->
    <!--Third slide-->
    <div class="carousel-item">
      <img class="d-block w-100" src="img/cust/Banner/Banner6.jpg"
        alt="Third slide">
    </div>
    <!--/Third slide-->
  </div>
  <!--/.Slides-->
  <!--Controls-->
  <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  <!--/.Controls-->
</div>
<!--/.Carousel Wrapper-->



<main style="padding-top: 3% !important;">
<div class="container">
  <h3 class="text-center font-weight-bold mb-4 pb-2">Our Feature Products</h3>	


      <!--First row-->
      <div class="row">
        
        <!--First column-->
        <div class="col-12">
          
          <!-- Nav tabs -->
          <ul class="nav md-pills flex-center flex-wrap mx-0" role="tablist">
            <li class="nav-item">
              <a class="nav-link active font-weight-bold" data-toggle="tab" href="#panel11" role="tab">ALL</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold" data-toggle="tab" href="#panel12" role="tab" >TECHNICALS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold" data-toggle="tab" href="#panel13" role="tab">LIFE STYLE CHOICES</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold" data-toggle="tab" href="#panel14" role="tab">PERSONALITY DEVELOPMENTS</a>
            </li>
          </ul>
          
        </div>
        <!--First column-->

    </div>
    <!--First row-->

<!--Tab panels-->

<div class="tab-content">
 <!--Panel 1-->
 <div class="tab-pane fade show in active" id="panel11" role="tabpanel">
 <span id=panel1></span>
 

  <div class="row" style="padding:1%;">
    </div>
 </div>

<!--Panel 2-->

 <div class="tab-pane fade" id="panel12" role="tabpanel">
   <span id=panel2></span>
  
 </div>
 
	<!-- Card Narrower -->
  

<!--Panel 3-->
<div class="tab-pane fade" id="panel13" role="tabpanel">
   
<span id=panel3></span>
  <div class="row" style="padding:1%;">
    </div>
    
  
 </div>
 <!--Panel 4-->
 <div class="tab-pane fade" id="panel14" role="tabpanel">
   <span id=panel4></span>


  <div class="row" style="padding:1%;">
    </div>
    
    
  
 </div>
 </div>

    <div class="text-center mt-4 mb-5">
      <a class="black-text font-weight-bold" href="./products.jsp" >View all product <i class="fa fa-angle-right"></i></a>
    </div>
</div>


<!-- Card -->
<div class="card card-image" style="background-image: url(img/cust/Card/card2.jpg);">

    <!-- Content -->
    <div class="text-white text-center d-flex align-items-center rgba-black-strong py-5 px-4">
        <div>
            <p class="lead text-center white-text pt-2 mb-5">There is an amazing power getting to know your inner self and learning how to use it and not fight with the world. If you know what makes you happy, your personality, interests and capabilities, just use them, and everything else flows beautifully.</p>
            <a class="btn btn-pink btn-rounded mb-4" data-toggle="modal" data-target="#modalContactForm"><i class="far fa-clone left"></i> Suggest Here</a>
        </div>
    </div>
    <!-- Content -->
</div>
<!-- Card -->



<div class="container mt-5">


  <!--Section: Content-->
  <section class="dark-grey-text text-center">

    <style>
      .md-pills .nav-link.active {
        background-color: #3f51b5;
      }
    </style>
    
    <!-- Section heading -->
   <!--  <h3 class="font-weight-bold mb-4 pb-2">Our Best Events</h3>
    Section description
    <p class="text-muted w-responsive mx-auto mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum quas, eos officia maiores ipsam ipsum dolores reiciendis ad voluptas, animi obcaecati adipisci sapiente mollitia. </p>
    
      First row
      <div class="row">
        
        First column
        <div class="col-12">
          
          Nav tabs
          <ul class="nav md-pills flex-center flex-wrap mx-0" role="tablist">
            <li class="nav-item">
              <a class="nav-link active font-weight-bold" data-toggle="tab" href="#panel31" role="tab">ALL</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold" data-toggle="tab" href="#panel32" role="tab">WORKSHOPS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold" data-toggle="tab" href="#panel33" role="tab">TECH MEETS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold" data-toggle="tab" href="#panel34" role="tab">COURSES</a>
            </li>
          </ul>
          
        </div>
        First column

    </div> -->
    <!--First row-->
    
    <!--Tab panels-->
    <div class="tab-content">

      <!--Panel 1-->
      <div class="tab-pane fade" id="panel31" role="tabpanel">
		<span id=panel311></span>
      </div>
      <!--Panel 1-->

      <!--Panel 2-->
      <div class="tab-pane fade" id="panel32" role="tabpanel">
<!--Carousel Wrapper-->
		<span id=panel312></span>
      </div>
      <!--Panel 2-->

      <!--Panel 3-->
      <div class="tab-pane fade" id="panel33" role="tabpanel">
<!--Carousel Wrapper-->
	<span id=panel313></span>
		<!--/.Carousel Wrapper-->
     
      </div>
      <!--Panel 3-->

      <!--Panel 4-->
      <div class="tab-pane fade" id="panel34" role="tabpanel">
<!--Carousel Wrapper-->
<span id=panel314></span>
			<!--/.Carousel Wrapper-->
      
      </div>
      <!--Panel 4-->

    </div>
    <!--Tab panels-->

	</section>
</div>


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
        <p class="text-center text-md-left">� 2018 Copyright:
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
      
   
   <script type="text/javascript" src="js/eventDashboard.js"></script>
   <script type="text/javascript" src="js/sweetAlert.js"></script>
   <!-- jQuery -->
  <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script src="vendor/bootstrap/js/popper.js"></script>	
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="vendor/bootstrap/js/mdb.min.js"></script>
  <script type="text/javascript" src="vendor/bootstrap/js/session.js"></script>
</body>
</html>