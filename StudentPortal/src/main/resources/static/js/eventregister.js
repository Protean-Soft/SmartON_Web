

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
			$('#products_table').text(data);
		/*	for(var i=1;i<rowObj.length;i++){
			
			
			samp='<div class="col-md"><div class="card card-cascade narrower" style="padding:1%;"> <div class="view view-cascade overlay">';
			samp+='<img  class="card-img-top" src="data:image/png;base64,'+rowObj[i].eventImage+'" alt="Card image cap"><a><div class="mask rgba-white-slight"></div></a></div><div class="card-body card-body-cascade text-center">';
			samp+='<h4 class="card-title"><strong>'+rowObj[i].eventName+'</strong></h4>';
			samp+=   '<h5 class="blue-text pb-2"><strong>'+rowObj[i].eventOrgName+'</strong></h5>';
			samp+=  '<p class="card-text">'+rowObj[i].eventDescription+'</p>';
			samp+='<a class="btn btn-unique">Book Now</a> <a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a><a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a><a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a></div></div></div>';
			final+=samp;
			}
			$('#products_table').html(final);*/
		}
	
	});
}


function registerEvent(eventId){
	console.log("Enterd registerEvent..............");
	$.ajax({
		url: './StudentPortal/Event/getEventDetail/'+eventId,
		type: 'GET',
		success: function(data){
			var rowObj = data;
		window.location.href="/confirmation.jsp";
		}
	
	
	
	// jQuery("#PopUp").load("confirmation.jsp");
	});
}






