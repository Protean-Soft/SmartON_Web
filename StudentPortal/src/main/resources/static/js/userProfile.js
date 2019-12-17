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
				
						$("#userName").val(data.userName);
						$("#firstName").val(data.firstName);
						$("#lastName").val(data.lastName);
						$("#collegeName").val(data.college);
						$("#mailID").val(data.email);
						$("#phoneNo").val(data.mobileNum);
						$("#city").val(data.city);
						$("#state").val(data.state);
						// $("#pinCode").val(data.mobileNum);
					}
				});
			} else {
				alert('Invalid userName!');
			}
		
	
	  /**
	   * ========== UPDATE USER DETAILS ==========
	   */

		/*$("#updatProfile").on("click",function(){
			var userDetailsForm = new FormData("#userDetailsForm")[0];
			alert(userDetailsForm);
			$.ajax({
				url : 'tag/userProfile/updateUserDetails,
				type : 'POST',
				data : userDetailsForm,
				success : function(data) {
					console.log("user details " + data);

				}
			});
		});*/
		
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
				$("#show_profilePic").attr("src", "data:image/png;base64," + response.pic);
			},
			error : function() {
			}
		});
	});
		
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
				$("#show_profilePic").attr("src", "data:image/png;base64," + response.pic);
			},
			error : function() {
			}
		});		

});