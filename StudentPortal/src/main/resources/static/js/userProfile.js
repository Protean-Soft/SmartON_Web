$(document).ready(function() {
	$(".button-collapse").sideNav();
	
	var userId =  $.session.get("userId");
	$('#userid1').val(userId);
	
	/**
	 * =========== LOAD USER DETAILS =============
	 */
	
	var userName = $.session.get("userName");
	$("#card_profile_name").text($.session.get("fullName"));
	//$("#card_profile_id").val($.session.get("userId"));
	
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
	   * ========== UPDATE USER DETAILS ==========
	   */
	
		$("form#userDetailsForm").on("submit",function(){
			//alert("Sucesss....");
			//$("#userId").val()
			//alert("Sucesss...."+userId);
			//alert(userId);
			var userDetailsForm = $('#userDetailsForm').serialize(); 
			//alert(JSON.stringify(userDetailsForm));
		
			//userDetailsForm +"&userId=" + userId;		
			//alert(JSON.stringify(userDetailsForm));
			$.ajax({
				url : 'tag/userProfile/updateUserDetails',
				type : 'POST',	
				data : userDetailsForm,
				success : function(data) {					
					//alert("user details " + JSON.stringify(data));
					location.reload();
				},
				error : function(data) {
					swal(JSON.stringify(data),"");
				}

			});
		});
		
		/** 
		 * ========== PROFILE PICTURE CHANGE ===========
		 * 
		 * */

		$('#profile_pic').on('change', function() {
		/*var formData = new FormData($("#profile_form")[0]);
		var form = new FormData(this.files[0]);
		alert(JSON.stringify(this.files[0]));*/
			//alert(JSON.stringify($('input[name="pic"]')));
		var form_data = $('input[name="pic"]');
		/*	var form_data = new FormData(document.getElementById("profile_pic"));
			form_data.append('file', $('#profile_pic')[0].files[0]);
		profile_pic*/
		var fd = new FormData();
        var files = $('#profile_pic')[0].files[0];
        fd.append('pic',files);
        fd.append('userId',$.session.get("userId"));
        //alert(JSON.stringify(form_data));
		$.ajax({
			url : 'tag/userProfile/uploadImage', /*'?pic='+form+'&userId='+$.session.get('userId'),*/
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
				//alert("Profile pic upload failed !!");
				if(response == 'undefined' || response.pic == null || response.pic == ''){
					$("#show_profilePic").attr("src", "img/cust/Photo/photo2.jpg");
					$("#navbar_profile").attr("src", "img/cust/Photo/photo2.jpg");
				}
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