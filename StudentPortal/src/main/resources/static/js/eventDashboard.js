

function callEventsbyType(){
	var samp='';
	var final='';
	console.log("Success..........");
	$.ajax({
		url: './StudentPortal/Event/getOngoingEventsByCatogery/Workshop/Training',
		type: 'GET',
		success: function(data){
			//alert(data);
			//$('#panel22 #listOfEvents1').items(data);
			console.log(data.length);
			var rowObj = data;
			var temp;
			//$('#products_table').text(data);
			for(var i=0;i<rowObj.length;i++){
			temp++;
			
			samp='<div class="col-md-4"><div class="card card-cascade narrower" style="padding:1%;"> <div class="view view-cascade overlay">';
			samp+='<img  class="card-img-top" src="data:image/png;base64,'+rowObj[i].eventImage+'" alt="Card image cap"><a><div class="mask rgba-white-slight"></div></a></div><div class="card-body card-body-cascade text-center">';
			samp+='<h4 class="card-title"><strong>'+rowObj[i].eventName+'</strong></h4>';
			samp+=   '<h5 class="blue-text pb-2"><strong>'+rowObj[i].eventOrgName+'</strong></h5>';
			samp+=  '<p class="card-text">'+rowObj[i].eventDescription+'</p>';
			samp+='<a class="btn btn-unique">Book Now</a> <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a><a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a><a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a></div></div></div></div>';
			
			/*if(temp%3==0 || i==0){
				samp='<div class="row" style="padding:1%;">'+samp+'</div>';
			}*/
			final+=samp;
			}
			//alert(final);
			$('#panel12').html(final);
		}
	
	});
}


function registerEvent(eventId){
	console.log("Enterd registerEvent..............");
	/*$.ajax({
		url: './StudentPortal/Event/getEventDetail/'+eventId,
		type: 'GET',
		success: function(data){
			var rowObj = data;
			console.log("rowObj====="+rowObj.eventid+"========="+$("#userId").val());
			//window.open("/confirmation.jsp");
	window.location.href="/confirmation.jsp?eventid="+eventId+"&userid="+$("#userId").val();
	
	$("#eventId").val(rowObj.eventid);
		}
	
	
	
	// jQuery("#PopUp").load("confirmation.jsp");
	});*/
	window.location.href="/confirmation.jsp?eventid="+eventId+"&userid="+$("#userId").val();

}


function registerEvent12(){
	console.log("Entered in registerevent.....");
	var formData =  $('#registerForm1').serialize();  
	
	console.log(formData);
	$.ajax({
		url : './StudentPortal/Event/addEventRegistrationDetail',
		type: 'POST',
		data: formData,
		/*dataType: 'TEXT',
		processData: false,
		contentType: false,	*/ 	
		success : function(response) {				
			//$("#show_profilePic").attr("src", "data:image/png;base64," + response.pic);
		},
		error : function() {
		}
	});
	
}


function viewAllProduct(){
	console.log("Success......");
	//var formData =  $('#registerForm1').serialize();  
	
	var userId=1;
	$.ajax({
		url : './StudentPortal/Event/viewAllProduct',
		type: 'GET',
		/*dataType: 'TEXT',
		processData: false,
		contentType: false,	*/ 	
		async: false,
		dataType: 'TEXT',
		success: function(page){
			$('#payFormDiv').html("");
			$('#payFormDiv').html(page);
		},
		error : function() {
			alert("Limit exceed*******************");
		}
		});
	
}






