$(document).ready(function() {
	$(".button-collapse").sideNav();
	
	var userId =  $.session.get("userId");
	$('#userid1').val(userId);
	
	/**
	 * =========== LOAD USER DETAILS =============
	 */
	
	var userName = $.session.get("userName");
	$("#card_profile_name").text($.session.get("fullName"));
	
	if (userName != null) {
		$.ajax({
			url : "tag/userProfile/userDetails?userId=" + userId,
			type : 'GET',
			contentType : "application/json",
			dataType: 'json',
			success : function(data) { 
				
						$("#profile_user_name").val(data.userName).trigger("change");
						$("#firstName").val(data.firstName).trigger("change");
						$("#lastName").val(data.lastName).trigger("change");
						$("#collegeName").val(data.college).trigger("change");
						$("#mailID").val(data.email).trigger("change");
						$("#phoneNo").val(data.mobileNum).trigger("change");
						$("#city").val(data.city).trigger("change");
						$("#state").val(data.state).trigger("change");
					}
				});
			} else {
				swal('UserName invalid','Warning');
			}
		
	
	
		/** 
		 * ========== PROFILE PICTURE CHANGE ===========
		 * 
		 * */

	$('#profile_pic').on('change', function() {		
		var fd = new FormData();
        var files = $('#profile_pic')[0].files[0];
        fd.append('pic',files);
        fd.append('userId',$.session.get("userId"));
        //alert(JSON.stringify(form_data));
		$.ajax({
			url : 'tag/userProfile/uploadImage',
			type : 'POST',
			data : fd,
			enctype : 'multipart/form-data',
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
});




/**
 * ========== UPDATE USER DETAILS ==========
 */

$("#updateProfile").click(function(e) {
		var userDetailsForm = $('#userDetailsForm').serialize(); 
		$.ajax({
			url : 'tag/userProfile/updateUserDetails',
			type : 'POST',	
			data : userDetailsForm,
			dataType: 'TEXT',
			async:false,
			success : function(data) {
				if(data === 'INVALIDUSERNAME'){
					swal("Warning", "UserName Already Taken", "warning");					
				}else if(data==='INVALIDEMAIL'){
					swal("","Email ID Already Taken","warning");
				}else if(data==='INVALIDMOBNUM'){
					swal("Mobile Number Already Taken");
				}else if(data==='SUCCESS'){
					swal("","Details Updated successfully","success");
				}  
			},
			error : function(data) {
				swal(JSON.stringify(data),"");
			}
			
		});
		  e.preventDefault();
});
	

