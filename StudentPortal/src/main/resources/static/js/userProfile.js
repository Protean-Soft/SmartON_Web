$(document).ready(function() {
	
	
	/**
	 * =========== LOAD USER DETAILS =============
	 */
	
	var userName = $("#userName").val();
	
	if (userName != null) {
		$.ajax({
			url : "tag/userProfile/userDetails?userName=" + userName,
			type : 'GET',
			contentType : "application/json",
			dataType: 'json',
			success : function(data) { 
				
						$("#userName").val(data.userName).trigger("change");
						$("#firstName").val(data.firstName).trigger("change");
						$("#lastName").val(data.lastName).trigger("change");
						$("#collegeName").val(data.college).trigger("change");
						$("#mailID").val(data.email).trigger("change");
						$("#phoneNo").val(data.mobileNum).trigger("change");
						$("#city").val(data.city).trigger("change");
						$("#state").val(data.state).trigger("change");
						// $("#pinCode").val(data.mobileNum);
					}
				});
			} else {
				alert('Invalid userName!');
			}
		
	
	  /**
	   * ========== UPDATE USER DETAILS ==========
	   */

		$("#userDetailsForm").on("submit",function(){
			var userId =  $("#userId").val()
			var userDetailsForm = $('#userDetailsForm').serialize(); 
			userDetailsForm +"&userId=" + userId;		
			$.ajax({
				url : 'tag/userProfile/updateUserDetails',
				type : 'POST',	
				data : userDetailsForm,
				success : function(data) {					
					//alert("user details " + JSON.stringify(data));
					location.reload();
				}
			});
		});
		
		/** 
		 * ========== PROFILE PICTURE CHANGE ===========
		 * 
		 * */

		$('#profile_pic').on('change', function() {
		var formData = new FormData($("#profile_form")[0]);
		$.ajax({
			url : 'tag/userProfile/uploadImage',
			type : 'POST',
			data : formData,
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
			error : function() {
			}
		});
		});

		
		/**
		 * ========= FETCH PROFILE PICS ========== 
		 */
		/**var userId = $("#userId").val();
		$.ajax({
			url : 'tag/userProfile/getProfilePic?userId=' + userId ,
			type : 'GET',
			contentType : false,
			cache : false,
			processData : false,	 	
			success : function(response) {
				$("#navbar_profile").attr("src", "data:image/png;base64," + response.pic);
				$("#show_profilePic").attr("src", "data:image/png;base64," + response.pic);
			},
			error : function() {
			}
		});	*/	

});