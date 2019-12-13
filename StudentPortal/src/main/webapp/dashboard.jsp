<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function selectProfilePic(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#profile-img-tag').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#profile-img").change(function() {
		selectProfilePic(this);
	});

	$(document).ready(function(){
		$('form').on('click',function(){
			var formData = new FormData($('form')[0]);
			$.ajax({
		        url : 'tag/userProfile/uploadImage',
		        type : 'POST',
		        data : formData,
		        enctype : 'multipart/form-data',
		        contentType : false,
		        cache : false,
		        processData : false,
		        success : function(response) {},
		        error: function(){}    
		     )};
			});
	  });
	
</script>
</head>
<body>
	<h2>How to insert image in database using Spring MVC</h2>

	<p id=userId>user id : "${userId}"</p>

	<form action="tag/userProfile/uploadImage" method="post"  enctype="multipart/form-data">

<pre>
		
	<input type="hidden" name = "id" value="${userId }">		
	Photo: <input type="file" name="pic">
		
	<input type="submit" value="Submit">

</pre>

</form>

</body>
</html>