
(function ($) {
    "use strict";
	
	$(document).ready(function(){
	  var cur_loc = $(location).attr('href');
	  if(cur_loc.indexOf('paymentSuccess') != -1){
		  customAlert('success','Payment completed! You have registered successfully.');
		  cur_loc.replace('paymentSuccess','login');
		  //window.location = cur_loc;
	  }
	  if($('#login_error').val() != ""){
		  $.alert({
			    title: 'Login Error!',
			    content: 'UserName / Password is invalid',
			    type: 'red'
			});
	  }
	  $("#loginButton").click(function(event){
		    event.preventDefault();
		    verifyUserPayment();
		});
      var date_input=$('.date'); 
      var options={
        format: 'mm/dd/yyyy',
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
	  $("#refcode").focusout(function(){
			var refcode = $("#refcode").val();
			if( refcode != null && refcode != "" ){
				var referalFlag = true;
				var cityCode = refcode.substring(0,3).match(/^[a-zA-Z]*$/)[0];
				var initial = refcode.substring(9,11).match(/^[a-zA-Z]*$/)[0];
				var dob =  refcode.substring(3,9).match(/^[0-9]*$/)[0];
				if( cityCode == null || cityCode.length != 3 ){
					referalFlag = false;
				}
				if( initial == null || initial.length != 2 ){
					referalFlag = false;
				}
				if( dob == null || dob.length != 6 ){
					referalFlag = false;
				}
				if( !referalFlag ){
					alert("Please enter a valid referal code");
				}
			}
		});
    })
	
	function showAlert(type){
		if(type == 'success'){
			$('.alertDiv').html('<div class="alert alert-success" style="text-align:center;"><strong>Success</strong> Data Saved Successfully.</div>');
		}
		if(type == 'paymentSuccess'){
			$('.alertDiv').html('<div class="alert alert-success" style="text-align:center;"><strong>Success</strong> Payment Succesful. </div>');
		}
		$('.alertDiv').slideDown();
		$('.alertDiv').delay(2000).slideUp( "slow", function() {
		});
	}
	
	function customAlert(type,text){
		if(type == 'success'){
			$.alert({
			    title: 'Success!',
			    content: text,
			    type: 'green'
			});
		}else if(type == 'fail'){
			$.alert({
			    title: 'Fail!',
			    content: text,
			    type: 'red'
			});
		}
	}

     /*==================================================================
    [ Focus input ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })
  
  
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
    	var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });
    
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


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

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

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    function validateRegForm(tagme){
    	$('#preloader').show();
    	var userName = $('#userName').val();
    	var email = $('#email').val();
    	$.ajax({
    		url: './checkValidData',
    		type: 'POST',
    		data: 'userName='+userName+'&email='+email,
    		dataType: 'JSON',
    		success: function(data){
    			if(data.userName == 'valid' && data.email == 'valid'){
    				var formData = new FormData($('#registerForm')[0]);
    				if($('input[name=isPremium]:checked').val() == 'premium'){
	    				$.confirm({
	    				    title: 'Payment Confirmation!',
	    				    content: 'You are about to register as a Premium User, Press confirm to proceed to the payment of Rs.10000',
	    				    type: 'orange',
	    				    buttons: {
	    				        confirm: {
	    				        	btnClass: 'btn-green',
	    				        	action: function () {
		    				        	registerUserData(formData,'premium');
		    				        }
	    				        },
	    				        cancel: {
	    				        	btnClass: 'btn-red',
	    				        	action: function () {
		    				        	$('#preloader').hide();
		    				        	$('#guest').prop('checked',true);
		    				        }
	    				        }
	    				    }
	    				});
    				}else{
    					registerUserData(formData,'guest');
    				}
    				
    			}else{
    				$('#preloader').hide();
    				if(data.userName == 'invalid'){
    					$('#userName').parent().attr('data-validate','Username is already taken');
    					showValidate($('#userName'));
    				}
    				if(data.email == 'invalid'){
    					$('#email').parent().attr('data-validate','E-mail is already taken');
    					showValidate($('#email'));
    				}
    			}
    		}
    	});
    	
    	
    }
    
    function registerUserData(formData,role){
    	$.ajax({
    		url: './registerUser',
    		type: 'POST',
    		data: formData,
    		dataType: 'TEXT',
    		processData: false,
    		contentType: false,
    		success: function(data){
    			$('#preloader').hide();
    			if(role == 'premium'){
    				paymentIntegration();
    			}else{
    				$('.clearForm').click();
    				customAlert('success','You have tagged yourself successfully.');
    			}
    		}
    	});
    }
    
    function sendmail(){
    	$.ajax({
    		url: './sendMail',
    		type: 'POST',
    		data: email,
    		dataType: 'TEXT',
    		processData: false,
    		contentType: false,
    		success: function(data){
    			$('#preloader').hide();
    			$('.close').click();
    	    	showAlert('success');
    		}
    	});
    }
    
    $('#registerBtn').click(function(){
    	$('#registerForm').find('input[type=text],input[type=password],select').each(function(){
    		hideValidate($(this));
    	});
    	$('#userName').parent().attr('data-validate','Username is required');
    	$('#email').parent().attr('data-validate','Valid E-mail is required');
    	if(checkValidation()){
    		validateRegForm("registerBtn");
    	}
    	//$('#preloader').hide();
    });
    
    $('.clearForm').click(function(){
    	clearFormData('registerForm');
    	$('#registerForm').find('input[type=text],input[type=password],select').each(function(){
    		hideValidate($(this));
    	});
    });
    
    $('#recover-submit').click(function(){
    	if(validate($('#forgotEmail')) == false){
            showValidate(input[i]);
            return false;
        }else{
        	var email = $('#forgotEmail').val();
        	$.ajax({
        		url: './forgotPassword',
	    		type: 'POST',
	    		data: 'forgotEmail='+email,
	    		dataType: 'JSON',
	    		success: function(data){
	    		}
        	});
        }
    	
    });
    
    /**
     * Send reset link to student email
     * 
     */
    $('#reset').on("submit", function() {
    	var newPassword = $('#newPassword').val();
    	var confirmPassword = $('#confirmPassword').val();
    	var userEmail = $("#user_email").val();
    	if(newPassword == confirmPassword){
    		console.log("New password : " + newPassword);
    		$.ajax({
        		url: './resetsubmit?newPassword='+newPassword+'&email='+userEmail,
        		type: 'POST',
        		dataType: 'TEXT',
        		processData: false,
        		contentType: false,
        		success: function(data){
        	    	showAlert('success');
        		}
        	});
    	}
});
    
})(jQuery);

function clearFormData(selector){
	$('#'+selector).find('input[type=text],input[type=password],select').each(function(){
	    $(this).val('');
	});
}

function paymentIntegration(){
	var data = 'key=rMKXzU&hash_string=&hash=&txnid=&amount=10000&firstname='+$('#firstName').val()+'&email='+$('#email').val()+'&phone='+$('#mobileNum').val()+'&productinfo=PremiumUser'+'&surl=http://localhost:8080/paymentSuccess&furl=http://localhost:8080/login&service_provider=payu_paisa';
	$.ajax({
		url: './securePay',
		type: 'POST',
		data: data,
		dataType: 'TEXT',
		success: function(data){
			$('#payFormDiv').html(data);
		}
	});
}

function verifyUserPayment(){
	var userName = $('#loginUserName').val();
	var password = $('#loginPassword').val();
	$.ajax({
		url: './verifyUserPayment',
		type: 'POST',
		data: 'userName='+userName+'&passWord='+password,
		dataType: 'JSON',
		success: function(data){
			if(data.validation == 'login-error'){
				$.alert({
				    title: 'Login Error!',
				    content: 'UserName / Password is invalid',
				    type: 'red'
				});
			}else if(data.acknwlge == 'acknowledged'){
				$("#logonForm").submit();
			}else{
				$.confirm({
					columnClass: 'col-md-6 col-md-offset-3',
				    title: 'Membership Confirmation!',
				    content: 'You have regstered yourself as Premium User, but the premium amount Rs.10000 has not been paid yet',
				    type: 'orange',
				    buttons: {
				        confirm: {
				        	text: 'Proceed to pay',
				        	btnClass: 'btn-green',
				        	action: function () {
    				        	var formdata = 'key=rMKXzU&hash_string=&hash=&txnid=&amount=10000&firstname='+data.firstName+'&email='+data.email+'&phone='+data.mobile+'&productinfo=PremiumUser'+'&surl=http://localhost:8080/paymentSuccess&furl=http://localhost:8080/login&service_provider=payu_paisa';
    				        	$.ajax({
    				        		url: './securePay',
    				        		type: 'POST',
    				        		data: formdata,
    				        		dataType: 'TEXT',
    				        		success: function(page){
    				        			$('#payFormDiv').html(page);
    				        		}
    				        	});
    				        }
				        },
				        cancel: {
				        	text: 'Continue as guest',
				        	btnClass: 'btn-orange',
				        	action: function () {
				        		$("#logonForm").submit();
    				        }
				        }
				    }
				});
			}
		}
	});
}