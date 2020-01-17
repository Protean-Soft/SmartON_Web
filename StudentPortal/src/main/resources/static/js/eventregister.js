var confheading="success";
var confmsg="";
var noofeventattend="";
function getEventdetais(eventId,userId){
	var eventid = $("#eventid1").val();
	console.log("Enterd registerEvent.............."+JSON.stringify(eventId));
	$.ajax({
		url: './StudentPortal/Event/getEventDetail/'+eventId+"/"+userId,
		type: 'GET',
		success: function(data){
			var rowObj = data;
			console.log(rowObj);
			$("#eventtitle").text(rowObj[0].eventName);
			$("#venue").text("Venue: "+rowObj[0].eventVenue);
			$("#category").text("Category: "+rowObj[0].eventCatogery);
			$("#type").text("Type: "+rowObj[0].eventType);
			$("#duration").text("Duration: "+rowObj[0].eventDuration);
			$("#description").text(rowObj[0].event_description);
			$("#show_eventPic").attr("src", "./EventImages/"+rowObj[0].base64Image);
			$("#attendes").text(rowObj[2]);
			//$("#noofeventattend").text(rowObj[1]);
			noofeventattend=rowObj[1];
			
			
			 
			}
	
});
}
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





function registerEvent(){
	console.log("registerEventin registerevent*****************************");
	$('#preloader').show();
	var formData =  $('#registerForm1').serialize();  
	$("#conformationbtn").attr("disabled", true)
	console.log(formData);
	confmsg="Thank you for booking. Instructions to join next Event";
	
	var confmsg2="You have booked "+parseInt(noofeventattend+1)+"of Event(s), Still you can book "+parseInt(4-noofeventattend)+" of Event(s) for this renewal.";
	$.ajax({
		url : './StudentPortal/Event/addEventRegistrationDetail',
		type: 'POST',
		data: formData,
		/*dataType: 'TEXT',
		processData: false,
		contentType: false,	*/ 	
		async: false,
		success : function(reponse) {
		console.log(reponse);
			
		if(reponse=="UserExceedtheLimit"){
			confmsg2="You have exceed the Limit.Please renew your account for continue this service"
			$("#conformationheading").text(reponse);
			$("#conformationmsg").text(confmsg+confmsg2);
			console.log("UserExceedtheLimit");
		}else if(reponse=="Already Registed"){
			confmsg2="You have already registered for this event"
			$("#conformationheading").text(reponse);
			$("#conformationmsg").text(confmsg+confmsg2);
			// $("#modalPushSuccess").addClass('active');
		}
		else if(reponse=="Error"){
			$("#conformationheading").text("ERROR!!!");
			$("#conformationmsg").text("ERROR when register event please contact Adminstrator");
			console.log("modalPushFaliure");
		}else{
		$("#conformationheading").text(reponse);
		$("#conformationmsg").text(confmsg+confmsg2);
		}
		//window.location.href="/index.jsp";
		//Callmainpage();
			//$("#show_profilePic").attr("src", "data:image/png;base64," + response.pic);
		},
		error : function() {
			swal("Warning","Please Contact Adminstrator");
			//alert("Limit exceed*******************");
		}
	});
	$('#preloader').hide();
	
}
function regcomplete(){
	$("#modalPush").removeClass('show');
	$("#modalPushSuccess").removeClass('show');
	$('#mymodelconform').remove("modal-open"); 
}

function Callmainpage(){
	$.ajax({
		url : './StudentPortal/Event/getOngoingEvents',
		type: 'GET',
		/*dataType: 'TEXT',
		processData: false,
		contentType: false,	*/ 	
		async: false,
		success : function(reponse) {
		$('#payFormDiv').html(reponse);
			swal("Successs",reponse);
		},
		error : function() {
			swal("Limit exceed","");
		}
		});
}




