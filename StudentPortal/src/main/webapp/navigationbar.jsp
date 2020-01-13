<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		#mybutton {
			position: fixed;
			bottom: -4px;
			right: 10px;
			z-index:9999
		}
</style>
</head>
<body>
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
        <a href="./index.jsp"><img src="img/cust/logoTrans.png" class="img-fluid flex-center" height="50" width="50"></a>
      </div>
      <ul class="nav navbar-nav nav-flex-icons ml-auto">
        <li class="nav-item">
          <a class="nav-link"><i class="far fa-comments"></i> <span class="clearfix d-none d-sm-inline-block">Support</span></a>
        </li>
        <li class="nav-item">
        
        <input type="hidden" id="userId" />
        <input type="hidden" id="email" />  
        <span class="nav-link clearfix d-none d-sm-inline-block" id="fullname">Welcome </span>
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
          <img src="img/cust/Photo/photo2.jpg" id = "navbar_profile" class="rounded-circle z-depth-0"
            alt="avatar image">
        </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="./profile.jsp"><i class="far fa-user"></i> My Account</a>
            <a class="dropdown-item" href="#"><i class="fas fa-key"></i> Change Password</a>
            <a class="dropdown-item" href="./login.jsp" onclick="logoff()" id="logoffbutton"><i class="fas fa-fingerprint"></i> Log Off</a>
          </div>
      </li>
      </ul>
    </nav>
    <!-- /.Navbar -->
  </header>
  <!--/.Double navigation-->
  
  <div id="mybutton">
	<a class="btn-floating btn-lg btn-default peach-gradient" id="navigateReward"><i class="fas fa-bolt"></i></a>
		<span class="counter"  id="rew_points">Tag Money :</span>
</div>

<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="vendor/bootstrap/js/session.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	  
	 /**
	  * display user name in navigation bar
	  */
	    var session_userid = $.session.get("userId");
		$("#userId").val(session_userid);
		$("#email").val($.session.get("email"));
		$("#fullname").text("Welcome " +$.session.get("fullName"));
		$("#userName").val($.session.get("userName"));
		
		/**
		 * ========= FETCH PROFILE PICS ========== 
		 */
		var userID = $("#userId").val();
		//alert(userID);
		$.ajax({
			url : 'tag/userProfile/getProfilePic?userId=' + userID ,
			type : 'GET',
			contentType : false,
			cache : false,
			processData : false,	 	
			success : function(response) {
				if(response.pic != null){
					$("#show_profilePic").attr("src", "data:image/png;base64," + response.pic);
					$("#navbar_profile").attr("src", "data:image/png;base64," + response.pic);
				}
			},
			error : function(response) {
				if(response == 'undefined' || response.pic == null || response.pic == ''){
					$("#show_profilePic").attr("src", "img/cust/Photo/photo2.jpg");
					$("#navbar_profile").attr("src", "img/cust/Photo/photo2.jpg");
				}
			}
		});	

	 });
 
 function logoff(){
	 
	 $.ajax({
			url : '/logout',
			type : 'POST',
			contentType : false,
			cache : false,
			processData : false,	 	
			success : function(response) {
				//alert("Success..."+response);
				$.session.clear();
				//alert("Success...");
				//$("#logoffbutton").attr("href","./login.jsp")
			/* 	$.session.set("userId",value.userId);
	  			$.session.set("fullName",value.firstName);	
	  			$.session.set("email",value.email);
	  			$.session.set("userName",value.userName); */
			},
			error : function(response) {
				alert("Error in logout");
			}
		});	
	 
 }
 
</script>

</body>
</html>