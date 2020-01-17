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
	z-index: 9999
}

.modal-body .form-horizontal .col-sm-2, .modal-body .form-horizontal .col-sm-10
	{
	width: 100%
}

.modal-body .form-horizontal .control-label {
	text-align: left;
}

.modal-body .form-horizontal .col-sm-offset-2 {
	margin-left: 15px;
}

#chnangePwd{
	font-family: Poppins-Medium;
    font-size: 16px;
    color: #fff;
    line-height: 1.2;
    text-transform: uppercase;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 20px;
    width: 100%;
    height: 50px;
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
    
    
    <!--  Change password -->
    
    <!-- <div class="modal fade" id="changepassword" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Change Password</h4>
							<button type="button" class="close clearForm" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="validate-form" id="changepasswordCheck" method="POST" action="registerUser">
								<div class="row">
									<div class="col-md-4">
										<span>Old Password</span>
									</div>
									
									<div class="col-md-4">
									<div class="rel-input" data-validate = "Old Password is required">
										<input type="text" class="form-control validate-input1" placeholder="Old Password" value="" id="oldpassword" name="oldpassword">
									</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-2">
										<span>Password</span>
									</div>
									<div class="col-md-4">
									<div class="rel-input" data-validate = "Password is required">
										<input type="password" class="form-control validate-input1" placeholder="Password" value="" id="password1" name="password">
										</div>
									</div>
									<div class="col-md-2">
										<span>Confirm Password</span>
									</div>
									<div class="col-md-4">
									<div class="rel-input" data-validate = "Re-enter Password">
										<input type="password" class="form-control validate-input1" placeholder="Re-enter Password" id="password2" value="">
										</div>
									</div>
								</div>								
							</form>
						</div>
						<div class="modal-footer">
							<div class="container-login100-form-btn">
								<div class="wrap-login100-form-btn">
									<div class="login100-form-bgbtn"></div>
										<button id="chnangePwd" class="login100-form-btn">Change Password</button>
								</div>
							</div>
							<div class="container-login100-form-btn">
								<div class="wrap-login100-form-btn">
									<div class="login100-form-bgbtn"></div>
										<button onclick="clearFormData('changepasswordCheck');" class="login100-form-btn">Clear</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
 -->			
			<!--  Chnage of password End -->
    
    
   <div class="modal" tabindex="-1" role="dialog" id="changepassword">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form" id="changepasswordCheck" method="POST" action="registerUser">
                  <div class="form-group">
                    <label  class="col-md-6 control-label" for="inputPassword3">Old Password</label>
                    <div class="col-md-8">
                    	<div class="rel-input" data-validate = "Old Password is required">
                        	<input type="password" class="form-control validate-input1" id="oldpassword" 
                        	   name="oldpassword" placeholder="Old Password"/>
                    	</div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-6 control-label" for="inputPassword3" >New Password</label>
                    <div class="col-md-8">
                    	<div class="rel-input" data-validate = "Password is required">
                        	<input type="password" class="form-control validate-input1" 
                        	       id="password1" placeholder="Password"/>
                        </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-6 control-label" for="inputPassword3" >Re-enter Password</label>
                    <div class="col-md-8">
                        <input type="password" class="form-control validate-input1"
                            id="password2" placeholder="Password"/>
                    </div>
                  </div>
                  <!-- <div class="form-group">	
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-default">Sign in</button>
                    </div>
                  </div> -->
                </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="chnangePwd" class="btn btn-primary">Change Password</button>
      </div>
    </div>
  </div>
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
        <a href="./index.jsp"><img src="img/cust/logo.jpg" class="img-fluid flex-center" height="50" width="50"></a>
      </div>
      <ul class="nav navbar-nav nav-flex-icons ml-auto">
        <li class="nav-item">
          <a class="nav-link"><i class="far fa-comments"></i> <span class="clearfix d-none d-sm-inline-block">Support</span></a>
        </li>
        <li class="nav-item">
        
        <input type="hidden" id="navigation_userid" />
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
            <a class="dropdown-item" href="#"    data-toggle="modal" data-target="#changepassword" class="txt2"><i class="fas fa-key"></i> Change Password</a>
            <a class="dropdown-item" href="./login.jsp" onclick="logoff()" id="logoffbutton"><i class="fas fa-fingerprint"></i> Log Off</a>
          </div>
      </li>
      </ul>
    </nav>
    <!-- /.Navbar -->
  </header>
  <!--/.Double navigation-->
	
	<!-- TAG MONEY FLOAT ICON -->
	<div id="mybutton">
		<a class="btn-floating btn-lg btn-default peach-gradient"
			id="navigateReward"><i class="fas fa-bolt"></i></a> <span
			class="counter" id="rew_points">Tag Money :</span>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/session.js"></script>
	<script src="vendor/jquery/jquery-confirm.js"></script>
	
<script type="text/javascript">
 $(document).ready(function(){
	 //alert("navigation");
	 /**
	  * display user name in navigation bar
	  */
	  console.log("Navigation "+ $.session.get("userId"));
	    var session_userid = $.session.get("userId");
		$("#navigation_userid").val(session_userid);
		$("#email").val($.session.get("email"));
		$("#fullname").text("Welcome " +$.session.get("fullName"));
		$("#userName").val($.session.get("userName"));
		$("#rew_points").text("Tag Money: " + $.session.get("rewardPoints"));
		
		/**
		 * ========= FETCH PROFILE PICS ========== 
		 */
		//var userID = $("#userId").val();
		
		$.ajax({
			url : 'tag/userProfile/getProfilePic?userId='+session_userid ,
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
				//alert(JSON.stringify(response));
				if(response == 'undefined' || response.pic == null || response.pic == ''){
					$("#show_profilePic").attr("src", "img/cust/Photo/photo2.jpg");
					$("#navbar_profile").attr("src", "img/cust/Photo/photo2.jpg");
				}
			}
		});

		$("#navigateReward").on('click',function(){
			var rewardPoints = $("#mybutton").text();
			var rewardPointVal=rewardPoints.split(":")[1].trim();
			if (rewardPointVal != "" && rewardPointVal != null && rewardPointVal !="0" ) {
				console.log(rewardPointVal);

				$("#navigateReward").attr("href","./offers.jsp")
			} else {					
				swal("warning","To enable this feature you need 10000 reward points!!!! ");	
			}
		});	

	 });
 

 function hideValidate(input) {
     var thisAlert = $(input).parent();

     $(thisAlert).removeClass('alert-validate');
 }
 function checkValidation(){
 	var check = true;
 	var input = $('.validate-input1');
     for(var i=0; i<input.length; i++) {
         if(validate(input[i]) == false){
             showValidate(input[i]);
             check=false;
         }
     }

     return check;
 }
 function validate (input) {
     if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
         if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
             return false;
         }
     }
     else {
         if($(input).val().trim() == ''){
             return false;
         }
     }
 }
 
 function showValidate(input) {
     var thisAlert = $(input).parent();

     $(thisAlert).addClass('alert-validate');
 }
 
 
 
 $('#chnangePwd').click(function(){
 	$('#changepasswordCheck').find('input[type=text],input[type=password],select').each(function(){
 		hideValidate($(this));
 	});
 	var pwd1=$("#changepasswordCheck #password1").val();
 	var pwd2=$("#changepasswordCheck #password2").val();
 	console.log(pwd1+"====="+pwd2);
 	if(pwd1!=pwd2 && pwd2!=""){
 		//$('#password2').parent().attr('data-validate','Username is required');
 		$('#password2').parent().attr('data-validate','Old password and new password did Not match!!!');
		showValidate($('#password2'));
 	}
 	/* $('#userName').parent().attr('data-validate','Username is required');
 	$('#email').parent().attr('data-validate','Valid E-mail is required'); */
 	if(checkValidation()){
 		validateChangePwd("chnangePwd");
 	}
 	//$('#preloader').hide();
 });
 
 
 function validateChangePwd(butt){
	swal( $.session.get("userId"));
 	$('#preloader').show();
 	var newPwd =$("#changepasswordCheck #password1").val();
 	var oldPwd = $("#changepasswordCheck #oldpassword").val();
 	var userID= $.session.get("userId");
 	$.ajax({
 		url: './checkPwdValidUpdate',
 		type: 'POST',
 		data: 'oldPwd='+oldPwd+'&newPwd='+newPwd+'&userID='+userID,
 		dataType: 'TEXT',
 		success: function(data){
 			if(data == 'valid' ){
 				swal("Warning","Your Password has been changed successfully!!!");
 				logoff();
 				    				
 			}else{
 				$('#preloader').hide();
 				$('#oldpassword').parent().attr('data-validate','Old Password did not Match');
					showValidate($('#oldpassword'));
 			}
 		}
 	}); 
 }
 
 
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
				swal("Warning","Error in logout");
			}
		});	
	 
 }
 
</script>

</body>
</html>