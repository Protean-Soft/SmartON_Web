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
    		url: './resetsubmit?password='+newPassword+'&token='+resetToken,
    		type: 'POST',
    		//data:'newpassword='+newPassword+'&token='+resetToken,
    		dataType: 'JSON',
    		success: function(data){    
    			alert("SUCCESS");
    			swal({
					title : "Success",
					text : "Password changed successfully",
					type : "success"
				}).then(function() {
					location.href = "login.jsp";
				});
    			return fasle;
    		},error:function(data){
    			alert("ERROR");
    			swal({
					title : "Error",
					text : data,
					type : "error"
				}).then(function() {
					location.href = "login.jsp";
				});
    			return false;
    		}
    	});
	} else{
				swal({
					title : "Mismatch",
					text : "Password mismatch..",
					type : "failed"
				}).then(function() {
					location.href = "login.jsp";
				});
		// swal("Failed","Password mismatch...","failed")
		// window.location="login.jsp";
		return false;
	}
});