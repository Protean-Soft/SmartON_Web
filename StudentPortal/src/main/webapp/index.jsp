<%@page import="com.protean.student.StudentPortal.model.RegisterUserDetails"%>
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

#mybutton {
  position: fixed;
  bottom: -4px;
  right: 10px;
}
</style>
</head>

<body class="hidden-sn mdb-skin">
<div id='PopUp'></div>
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
            <li><a class="collapsible-header waves-effect arrow-r" data-toggle="modal" data-target="#modalLoginAvatar"><i class="fas fa-envelope"></i> Tag a Friend</a>
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
        <%
        	Object userId = request.getAttribute("userId");
        	Object fullName = request.getAttribute("fullName");
        	Object userName = request.getAttribute("userName");
        	session.setAttribute("userId", userId);
        	session.setAttribute("fullName", fullName);
        	session.setAttribute("userName", userName);
        	RegisterUserDetails accountInfo = (RegisterUserDetails)request.getAttribute("studentDetails");
        	session.setAttribute("userEmail", accountInfo.getEmail());
        %> 
        <input type="hidden" id="userId" value = <% out.println(session.getAttribute("userId")); %> />  
        <span class="nav-link clearfix d-none d-sm-inline-block">Welcome <% out.println(session.getAttribute("fullName")); %></span>
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
          <img src="img/cust/Photo/photo2.jpg"" class="rounded-circle z-depth-0"
            alt="avatar image">
        </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="../profile.jsp"><i class="far fa-user"></i> My Account</a>
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
  <div class="row" style="padding:1%;">
  
   <c:forEach var="listOfEvents" items="${listOfEvt}"  varStatus="loopCounter">
     <c:if test="${loopCounter.index % 3 == 0}"></div><div class="row" style="padding:1%;"></c:if>
    <div class="col-md">

	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img id="image-${loopCounter.index}" class="card-img-top" src="data:image/jpg;base64,${listOfEvents.base64Image}" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	   
   

	    <h4 class="card-title"><strong><c:out value="${listOfEvents.eventName}"/></strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong><c:out value="${listOfEvents.eventOrgName}"/></strong></h5>
	    <!-- Text -->
	    <p class="card-text"><c:out value="${listOfEvents.eventDescription}"/></p>
	  

<%-- <c:if test="${fn:contains(attenevts,listOfEvents.eventid)}"> --%>
    <c:choose>
    <c:when test="${fn:contains(attenevts,listOfEvents.eventid)==true}">
	    <button class="btn btn-unique" disabled onClick="registerEvent(${listOfEvents.eventid})">Book Now</button>
	    </c:when>    
    <c:otherwise>
     <a class="btn btn-unique" onClick="registerEvent(${listOfEvents.eventid})">Book Now</a>
 </c:otherwise>
 </c:choose>
	 <%--    </c:if> --%>
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
  
    </c:forEach>
    </div>

  <div class="row" style="padding:1%;">
    </div>
 </div>

<!--Panel 2-->

 <div class="tab-pane fade" id="panel12" role="tabpanel">
  <span id="products_table"></span>
  
 
    
    <div class="row" style="padding:1%;">
    
    <c:forEach var="listOfEvents1" items="${listOfEvt}"  varStatus="loopCounter">
    <c:if test="${listOfEvents1.eventCatogery=='Workshop'}">
   <c:if test="${loopCounter.index % 3 == 0}"></div><div class="row" style="padding:1%;"></c:if>
   <div class="col-md">

	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="data:image/png;base64,<c:out value='${listOfEvents1.base64Image}'/>" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	   
    

	    <h4 class="card-title"><strong><c:out value="${listOfEvents1.eventName}"/></strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong><c:out value="${listOfEvents1.eventType}"/></strong></h5>
	    <!-- Text -->
	    <p class="card-text"><c:out value="${listOfEvents1.eventCatogery}"/></p>

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
  </c:if>
 </c:forEach> 
      </div>

  <div class="row" style="padding:1%;">
    </div>

    
  
 </div>
 
	<!-- Card Narrower -->
  

<!--Panel 3-->
<div class="tab-pane fade" id="panel13" role="tabpanel">
  <span id="products_table"></span>
  
 
    
    <div class="row" style="padding:1%;">
    
    <c:forEach var="listOfEvents1" items="${listOfEvt}"  varStatus="loopCounter">
    <c:if test="${listOfEvents1.eventCatogery=='LIFE STYLE CHOICES'}">
   <c:if test="${loopCounter.index % 3 == 0}"></div><div class="row" style="padding:1%;"></c:if>
   <div class="col-md">

	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="data:image/png;base64,<c:out value='${listOfEvents1.base64Image}'/>" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	   
    

	    <h4 class="card-title"><strong><c:out value="${listOfEvents1.eventName}"/></strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong><c:out value="${listOfEvents1.eventType}"/></strong></h5>
	    <!-- Text -->
	    <p class="card-text"><c:out value="${listOfEvents1.eventCatogery}"/></p>

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
  </c:if>
 </c:forEach> </div>
    
<div class="row" style="padding:1%;">
    </div>
    
  
 </div>
 <!--Panel 4-->
 <div class="tab-pane fade" id="panel14" role="tabpanel">
  <span id="products_table"></span>
  
 
    
    <div class="row" style="padding:1%;">
    
    <c:forEach var="listOfEvents1" items="${listOfEvt}"  varStatus="loopCounter">
    <c:if test="${listOfEvents1.eventCatogery=='PERSONALITY DEVELOPMENTS'}">
   <c:if test="${loopCounter.index % 3 == 0}"></div><div class="row" style="padding:1%;"></c:if>
   <div class="col-md">

	<!-- Card Narrower -->
	<div class="card card-cascade narrower" style="padding:1%;">

	  <!-- Card image -->
	  <div class="view view-cascade overlay">
	    <img  class="card-img-top" src="data:image/png;base64,<c:out value='${listOfEvents1.base64Image}'/>" alt="Card image cap">
	    <a>
	      <div class="mask rgba-white-slight"></div>
	    </a>
	  </div>

	  <!-- Card content -->
	  <div class="card-body card-body-cascade text-center">

	    <!-- Title -->
	   
    

	    <h4 class="card-title"><strong><c:out value="${listOfEvents1.eventName}"/></strong></h4>
	    <!-- Subtitle -->
	    <h5 class="blue-text pb-2"><strong><c:out value="${listOfEvents1.eventType}"/></strong></h5>
	    <!-- Text -->
	    <p class="card-text"><c:out value="${listOfEvents1.eventCatogery}"/></p>

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
  </c:if>
 </c:forEach>  </div>

  <div class="row" style="padding:1%;">
    </div>

    
  
 </div>
 </div>


    <div class="text-center mt-4 mb-5">
      <a class="black-text font-weight-bold" href="#!">View all product <i class="fa fa-angle-right"></i></a>
    </div>
</div>


<!-- Card -->
<div class="card card-image" style="background-image: url(img/cust/Card/card2.jpg);">

    <!-- Content -->
    <div class="text-white text-center d-flex align-items-center rgba-black-strong py-5 px-4">
        <div>
            <p class="lead text-center white-text pt-2 mb-5">There is an amazing power getting to know your inner self and learning how to use it and not fight with the world. If you know what makes you happy, your personality, interests and capabilities, just use them, and everything else flows beautifully.</p>
            <a class="btn btn-pink"><i class="far fa-clone left"></i> Suggest Here</a>
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
    <h3 class="font-weight-bold mb-4 pb-2">Our Best Events</h3>
    <!-- Section description -->
    <p class="text-muted w-responsive mx-auto mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum quas, eos officia maiores ipsam ipsum dolores reiciendis ad voluptas, animi obcaecati adipisci sapiente mollitia. </p>
    
      <!--First row-->
      <div class="row">
        
        <!--First column-->
        <div class="col-12">
          
          <!-- Nav tabs -->
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
        <!--First column-->

    </div>
    <!--First row-->
    
    <!--Tab panels-->
    <div class="tab-content">

      <!--Panel 1-->
      <div class="tab-pane fade show in active" id="panel31" role="tabpanel">
		<!--Carousel Wrapper-->
		<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">

		  <!--Controls-->
		  <div class="controls-top">
		    <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a>
		    <a class="btn-floating" href="#multi-item-example" data-slide="next"><i
			class="fas fa-chevron-right"></i></a>
		  </div>
		  <!--/.Controls-->

		  <!--Indicators-->
		  <ol class="carousel-indicators">
		    <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
		    <li data-target="#multi-item-example" data-slide-to="1"></li>
		    <li data-target="#multi-item-example" data-slide-to="2"></li>
		  </ol>
		  <!--/.Indicators-->

		  <!--Slides-->
		  <div class="carousel-inner" role="listbox">

		    <!--First slide-->
		    <div class="carousel-item active">
<c:forEach var="listOfEvents1" items="${listOfEvt}"  varStatus="loopCounter">
<c:if test="${(loopCounter.index % 3 == 0) && (loopCounter.index !=0)}"></div> <div class="carousel-item"></c:if>
 <div class="col-md-4">
			<div class="card mb-2">
			  <img class="card-img-top"
			    src="data:image/png;base64,<c:out value='${listOfEvents1.base64Image}'/>"
			    alt="Card image cap">
			  <div class="card-body">
			    <h4 class="card-title"><c:out value="${listOfEvents1.eventName}"/></h4>
			    <p class="card-text"><c:out value="${listOfEvents1.eventDescription}"/></p>
			    <a class="btn btn-primary">Button</a>
			  </div>
			</div>
		      </div>
</c:forEach>
 </div>
		  
		    <!--/.Third slide-->

		  </div>
		  <!--/.Slides-->

		</div>
		<!--/.Carousel Wrapper-->
      </div>
      <!--Panel 1-->

      <!--Panel 2-->
      <div class="tab-pane fade" id="panel32" role="tabpanel">
<!--Carousel Wrapper-->
		<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">

		  <!--Controls-->
		  <div class="controls-top">
		    <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a>
		    <a class="btn-floating" href="#multi-item-example" data-slide="next"><i
			class="fas fa-chevron-right"></i></a>
		  </div>
		  <!--/.Controls-->

		  <!--Indicators-->
		  <ol class="carousel-indicators">
		    <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
		    <li data-target="#multi-item-example" data-slide-to="1"></li>
		    <li data-target="#multi-item-example" data-slide-to="2"></li>
		  </ol>
		  <!--/.Indicators-->

		  <!--Slides-->
		  <div class="carousel-inner" role="listbox">

		    <!--First slide-->
		    <div class="carousel-item active">
<c:forEach var="listOfEvents1" items="${listOfEvt}"  varStatus="loopCounter">
<c:if test="${listOfEvents1.eventType=='WORKSHOPS'}">
<c:if test="${(loopCounter.index % 3 == 0) && (loopCounter.index !=0)}"></div> <div class="carousel-item"></c:if>
 <div class="col-md-4">
			<div class="card mb-2">
			  <img class="card-img-top"
			    src="data:image/png;base64,<c:out value='${listOfEvents1.base64Image}'/>"
			    alt="Card image cap">
			  <div class="card-body">
			    <h4 class="card-title"><c:out value="${listOfEvents1.eventName}"/></h4>
			    <p class="card-text"><c:out value="${listOfEvents1.eventDescription}"/></p>
			    <a class="btn btn-primary">Button</a>
			  </div>
			</div>
		      </div>
		      </c:if>
</c:forEach>
 </div>
		  
		    <!--/.Third slide-->

		  </div>
		  <!--/.Slides-->

		</div>
		<!--/.Carousel Wrapper-->
      </div>
      </div>
      <!--Panel 2-->

      <!--Panel 3-->
      <div class="tab-pane fade" id="panel33" role="tabpanel">
<!--Carousel Wrapper-->
		<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">

		  <!--Controls-->
		  <div class="controls-top">
		    <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a>
		    <a class="btn-floating" href="#multi-item-example" data-slide="next"><i
			class="fas fa-chevron-right"></i></a>
		  </div>
		  <!--/.Controls-->

		  <!--Indicators-->
		  <ol class="carousel-indicators">
		    <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
		    <li data-target="#multi-item-example" data-slide-to="1"></li>
		    <li data-target="#multi-item-example" data-slide-to="2"></li>
		  </ol>
		  <!--/.Indicators-->

		  <!--Slides-->
		  <div class="carousel-inner" role="listbox">

		    <!--First slide-->
		    <div class="carousel-item active">
<c:forEach var="listOfEvents1" items="${listOfEvt}"  varStatus="loopCounter">
<c:if test="${listOfEvents1.eventType=='TECH MEETS'}">
<c:if test="${(loopCounter.index % 3 == 0) && (loopCounter.index !=0)}"></div> <div class="carousel-item"></c:if>
 <div class="col-md-4">
			<div class="card mb-2">
			  <img class="card-img-top"
			    src="data:image/png;base64,<c:out value='${listOfEvents1.base64Image}'/>"
			    alt="Card image cap">
			  <div class="card-body">
			    <h4 class="card-title"><c:out value="${listOfEvents1.eventName}"/></h4>
			    <p class="card-text"><c:out value="${listOfEvents1.eventDescription}"/></p>
			    <a class="btn btn-primary">Button</a>
			  </div>
			</div>
		      </div>
		      </c:if>
</c:forEach>
 </div>
		  
		    <!--/.Third slide-->

		  </div>
		  <!--/.Slides-->

		</div>
		<!--/.Carousel Wrapper-->
      </div>
      </div>
      <!--Panel 3-->

      <!--Panel 4-->
      <div class="tab-pane fade" id="panel34" role="tabpanel">
<!--Carousel Wrapper-->
		<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">

		  <!--Controls-->
		  <div class="controls-top">
		    <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a>
		    <a class="btn-floating" href="#multi-item-example" data-slide="next"><i
			class="fas fa-chevron-right"></i></a>
		  </div>
		  <!--/.Controls-->

		  <!--Indicators-->
		  <ol class="carousel-indicators">
		    <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
		    <li data-target="#multi-item-example" data-slide-to="1"></li>
		    <li data-target="#multi-item-example" data-slide-to="2"></li>
		  </ol>
		  <!--/.Indicators-->

		  <!--Slides-->
		  <div class="carousel-inner" role="listbox">

		    <!--First slide-->
		    <div class="carousel-item active">
<c:forEach var="listOfEvents1" items="${listOfEvt}"  varStatus="loopCounter">
<c:if test="${listOfEvents1.eventType=='COURSES'}">
<c:if test="${(loopCounter.index % 3 == 0) && (loopCounter.index !=0)}"></div> <div class="carousel-item"></c:if>
 <div class="col-md-4">
			<div class="card mb-2">
			  <img class="card-img-top"
			    src="data:image/png;base64,<c:out value='${listOfEvents1.base64Image}'/>"
			    alt="Card image cap">
			  <div class="card-body">
			    <h4 class="card-title"><c:out value="${listOfEvents1.eventName}"/></h4>
			    <p class="card-text"><c:out value="${listOfEvents1.eventDescription}"/></p>
			    <a class="btn btn-primary">Button</a>
			  </div>
			</div>
		      </div>
		      </c:if>
</c:forEach>
 </div>
		  
		    <!--/.Third slide-->

		  </div>
		  <!--/.Slides-->

		</div>
		<!--/.Carousel Wrapper-->
      </div>
      </div>
      <!--Panel 4-->

    </div>
    <!--Tab panels-->

	</section>
  
<div id="mybutton">
<a class="btn-floating btn-lg btn-default peach-gradient"><i class="fas fa-bolt"></i></a><span class="counter">${rewardPoints}</span>
</div>



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
   <script type="text/javascript" src="js/eventDashboard.js"></script>
   
   
   
   <!-- jQuery -->
  <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script src="vendor/bootstrap/js/popper.js"></script>	
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="vendor/bootstrap/js/mdb.min.js"></script>

  
<script type="text/javascript">
 
			$(document).ready(function() {
				$(".button-collapse").sideNav();

				/**
				 * ========= FETCH PROFILE PICS ========== 
				 */
				var userId = $("#userId").val();
				$.ajax({
					url : 'tag/userProfile/getProfilePic?userId=' + userId ,
					type : 'GET',
					contentType : false,
					cache : false,
					processData : false,	 	
					success : function(response) {
						$("#navbar_profile").attr("src", "data:image/png;base64," + response.pic);
					},
					error : function() {
					}
				});	
			});
  </script>
  <script type="text/javascript">
  
$(".button-collapse").sideNav();
	
  </script>

</body>
</html>