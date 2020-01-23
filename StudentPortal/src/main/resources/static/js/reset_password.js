$(document).ready(function(){
  
	
});

/**
 * Forgot password 
 */
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
    			alert(JSON.stringify(data));//testing purpose
    		}
    	});
    }
	
});

function showValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).addClass('alert-validate');
}

$('#reset').on("click", function(e) {
	var newPassword = $('#newPassword').val();
	var confirmPassword = $('#confirmPassword').val();
	var resetToken = $("#resetToken").val();
	if(newPassword == confirmPassword){		
		$.ajax({
    		url: './resetsubmit?newPassword='+newPassword+'&token='+resetToken,
    		type: 'POST',
    		dataType: 'TEXT',
    		processData: false,
    		contentType: false,
    		success: function(data){    			
    			if(data.success == "Password successfully updated"){
	    	    	swal("Success","Password changed successfully","success");
	    	    	e.preventDefault();    	    	
	    	    	window.location="login.jsp";
	    	    	return false;
    			} else {
    				 swal({ 
       				  title: "Error",
       				   text: data.errorMessage,
       				    type: "error" 
       				  },
       				  function(){
       				      window.location.href = 'login.jsp';
       				});
    			}
    		},error : function(data){
    			
    			
    			swal("Failed",data.errorMessage,"failed");
    			//e.preventDefault();  
    			//window.location="login.jsp";
    			//return false;
    		}
    	});
	} else{
		return false;
		swal("Failed","Password mismatch...","failed")
		window.location="login.jsp";
		
	}
});