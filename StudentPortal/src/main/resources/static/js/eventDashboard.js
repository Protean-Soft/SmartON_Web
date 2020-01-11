$(document).ready(function() {
		$.ajax({
	  		url: './getLogonUserDetails',
	  		type: 'GET',
	  		success: function(data){
	  			// console.log(JSON.stringify(data.userDetails));
	  			callEventsbyType(data.EventDetails[0],data.EventDetails[1]);
	  			// console.log("Event lst:::"+data.EventDetails[0]);
	  			// console.log("Evtlstregbyuser:::"+data.EventDetails[1]);
	  			$.each(data.userDetails, function(key, value) {
	  			  //  console.log(value.userId);
	  			 // console.log(value.firstName);
	  		//	console.log(value.email);
	  		//	console.log(value.rewpoints);
	  			  	$.session.set("userId",value.userId);
		  			$.session.set("fullName",value.firstName);	
		  			$.session.set("email",value.email);
		  			$("#rew_points").text("Tag Money: " +value.rewpoints);
	  		
	  			});
	  			 //console.log(data.EventDetails[0]);
	  			 //console.log(data.EventDetails[1]);
	  			var session_userid = $.session.get("userId");
	  			//console.log("session id " + session_userid);
	  			//console.log("session id " + $.session.get("fullName"));
	  			$("#userId").val(session_userid);
	  			$("#email").val($.session.get("email"));
	  			$("#fullname").text("Welcome " +$.session.get("fullName"));
	  			
	   		}
	  	});
		
		$("#navigateReward").on('click',function(){
			var rewardPoints = $("#mybutton").text();
			var rewardPointVal=rewardPoints.split(":")[1].trim();
			if (rewardPointVal != "" && rewardPointVal != null && rewardPointVal !="0" ) {
				console.log(rewardPointVal);
				$("#navigateReward").attr("href","../offers.jsp")
			} else {					
				alert("To enable this feature you need 10000 reward points!!!! ");	
			}
		});
	});

function callEventsbyType(listevt,reglistevt){
	var samp='';
	var final='';

	var rowObj = listevt;
	var filename="image1.jpg";
	for(var i=0;i<rowObj.length && i<9;i++){
				
		samp='<div class="col-md-4"><div class="card card-cascade narrower" style="padding:1%;"> <div class="view view-cascade overlay">';
		samp+='<img  class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"><a><div class="mask rgba-white-slight"></div></a></div><div class="card-body card-body-cascade text-center">';
		samp+='<h4 class="card-title"><strong>'+rowObj[i].eventName+'</strong></h4>';
		samp+=   '<h5 class="blue-text pb-2"><strong>'+rowObj[i].eventOrgName+'</strong></h5>';
		samp+=  '<p class="card-text">'+rowObj[i].eventDescription+'</p>';
		samp+=  ' <p class="font-weight-normal"><i class="fas fa-certificate pr-2"></i><span>Category: '+rowObj[i].eventCatogery+'</span></p>';
		samp+=  '   <p class="font-weight-normal"><i class="fas fa-book-reader pr-2"></i><span>Type: '+rowObj[i].eventType+'</span></p>';
		samp+=  '   <p class="font-weight-normal"><i class="far fa-clock pr-2"></i><span>Date: '+rowObj[i].eventDate+'</span></p>';
			  

		if(reglistevt.includes(rowObj[i].eventid)){
			samp+='<button class="btn btn-unique"  disabled onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
		}else{
			samp+='<button class="btn btn-unique" onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
		}
	
		samp+='<a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a><a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a><a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a></div></div></div>';
		
		if(i==0 ){
			//console.log("Temp::::::::::::::"+i);
			samp='<div class="row" style="padding:1%;">'+samp;
		}else if(i%3==0){
			samp='</div><div class="row" style="padding:1%;">'+samp;
		}
		final+=samp;
		}
		final=final+'</div>';
		$('#panel1').html(final);
		
		/*Technology*/
		var pan2=0;
		samp='',final='';
		for(var i=0;i<rowObj.length && pan2<9;i++){
			if( rowObj[i].eventCatogery=='TECHNICALS'){
				
			samp='<div class="col-md-4"><div class="card card-cascade narrower" style="padding:1%;"> <div class="view view-cascade overlay">';
			samp+='<img  class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"><a><div class="mask rgba-white-slight"></div></a></div><div class="card-body card-body-cascade text-center">';
			samp+='<h4 class="card-title"><strong>'+rowObj[i].eventName+'</strong></h4>';
			samp+=   '<h5 class="blue-text pb-2"><strong>'+rowObj[i].eventOrgName+'</strong></h5>';
			samp+=  '<p class="card-text">'+rowObj[i].eventDescription+'</p>';
			samp+=  ' <p class="font-weight-normal"><i class="fas fa-certificate pr-2"></i><span>Category: '+rowObj[i].eventCatogery+'</span></p>';
			samp+=  '   <p class="font-weight-normal"><i class="fas fa-book-reader pr-2"></i><span>Type: '+rowObj[i].eventType+'</span></p>';
			samp+=  '   <p class="font-weight-normal"><i class="far fa-clock pr-2"></i><span>Date: '+rowObj[i].eventDate+'</span></p>';
				  

			if(reglistevt.includes(rowObj[i].eventid)){
				samp+='<button class="btn btn-unique"  disabled onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
			}else{
				samp+='<button class="btn btn-unique" onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
			}
		
			samp+='<a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a><a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a><a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a></div></div></div>';
			
			if(pan2==0 ){
				//console.log("Temp::::::::::::::"+i);
				samp='<div class="row" style="padding:1%;">'+samp;
			}else if(pan2%3==0){
				samp='</div><div class="row" style="padding:1%;">'+samp;
			}
			final+=samp;
			pan2++;
			//console.log("rowcount==="+pan2)
		}
			}
			final=final+'</div>';
			$('#panel2').html(final);
		
			
			/*LIFE STYLE CHOICES*/
			var pan2=0;
			samp='',final='';
			for(var i=0;i<rowObj.length && pan2<9;i++){
				if( rowObj[i].eventCatogery=='LIFE STYLE CHOICES'){
					
				samp='<div class="col-md-4"><div class="card card-cascade narrower" style="padding:1%;"> <div class="view view-cascade overlay">';
				samp+='<img  class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"><a><div class="mask rgba-white-slight"></div></a></div><div class="card-body card-body-cascade text-center">';
				samp+='<h4 class="card-title"><strong>'+rowObj[i].eventName+'</strong></h4>';
				samp+=   '<h5 class="blue-text pb-2"><strong>'+rowObj[i].eventOrgName+'</strong></h5>';
				samp+=  '<p class="card-text">'+rowObj[i].eventDescription+'</p>';
				samp+=  ' <p class="font-weight-normal"><i class="fas fa-certificate pr-2"></i><span>Category: '+rowObj[i].eventCatogery+'</span></p>';
				samp+=  '   <p class="font-weight-normal"><i class="fas fa-book-reader pr-2"></i><span>Type: '+rowObj[i].eventType+'</span></p>';
				samp+=  '   <p class="font-weight-normal"><i class="far fa-clock pr-2"></i><span>Date: '+rowObj[i].eventDate+'</span></p>';
					  

				if(reglistevt.includes(rowObj[i].eventid)){
					samp+='<button class="btn btn-unique"  disabled onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
				}else{
					samp+='<button class="btn btn-unique" onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
				}
			
				samp+='<a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a><a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a><a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a></div></div></div>';
				
				if(pan2==0 ){
					//console.log("Temp::::::::::::::"+i);
					samp='<div class="row" style="padding:1%;">'+samp;
				}else if(pan2%3==0){
					samp='</div><div class="row" style="padding:1%;">'+samp;
				}
				final+=samp;
				pan2++;
			}
				}
				final=final+'</div>';
				$('#panel3').html(final);
				
				
				
				
				
				/*LIFE STYLE CHOICES*/
				var pan2=0;
				samp='',final='';
				for(var i=0;i<rowObj.length && pan2<9;i++){
					if( rowObj[i].eventCatogery=='PERSONALITY DEVELOPMENTS'){
						
					samp='<div class="col-md-4"><div class="card card-cascade narrower" style="padding:1%;"> <div class="view view-cascade overlay">';
					samp+='<img  class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"><a><div class="mask rgba-white-slight"></div></a></div><div class="card-body card-body-cascade text-center">';
					samp+='<h4 class="card-title"><strong>'+rowObj[i].eventName+'</strong></h4>';
					samp+=   '<h5 class="blue-text pb-2"><strong>'+rowObj[i].eventOrgName+'</strong></h5>';
					samp+=  '<p class="card-text">'+rowObj[i].eventDescription+'</p>';
					samp+=  ' <p class="font-weight-normal"><i class="fas fa-certificate pr-2"></i><span>Category: '+rowObj[i].eventCatogery+'</span></p>';
					samp+=  '   <p class="font-weight-normal"><i class="fas fa-book-reader pr-2"></i><span>Type: '+rowObj[i].eventType+'</span></p>';
					samp+=  '   <p class="font-weight-normal"><i class="far fa-clock pr-2"></i><span>Date: '+rowObj[i].eventDate+'</span></p>';
						  

					if(reglistevt.includes(rowObj[i].eventid)){
						samp+='<button class="btn btn-unique"  disabled onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
					}else{
						samp+='<button class="btn btn-unique" onClick="registerEvent('+rowObj[i].eventid+')">Book Now</button> ';
					}
				
					samp+='<a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a><a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a><a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a></div></div></div>';
					
					if(pan2==0 ){
						//console.log("Temp::::::::::::::"+i);
						samp='<div class="row" style="padding:1%;">'+samp;
					}else if(pan2%3==0){
						samp='</div><div class="row" style="padding:1%;">'+samp;
					}
					final+=samp;
					pan2++;
				}
					}
					final=final+'</div>';
					$('#panel4').html(final);
				
				
			/*Slide bar*/
					
				var slidemain='',slidevar='',slidefinal='';	
					
					
				slidemain+='<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">';

				slidemain+='<!--Controls--><div class="controls-top"><a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a><a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fas fa-chevron-right"></i></a></div><!--/.Controls-->';

				slidemain+='<!--Indicators--><ol class="carousel-indicators"><li data-target="#multi-item-example" data-slide-to="0" class="active"></li><li data-target="#multi-item-example" data-slide-to="1"></li><li data-target="#multi-item-example" data-slide-to="2"></li></ol><!--/.Indicators-->';

				slidemain+='<!--Slides--><div class="carousel-inner" role="listbox"><!--First slide-->';
				var pan2="";
				for(var i=0;i<rowObj.length && i<9;i++){
				//slidevar+='<div class="carousel-item active">';

				slidevar='<div class="col-md-4"><div class="card mb-2"> <img class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"><div class="card-body">';
				slidevar+='<h4 class="card-title">'+rowObj[i].eventName+'</h4><p class="card-text">'+rowObj[i].eventDescription+'</p>';
				if(reglistevt.includes(rowObj[i].eventid)){
					slidevar+=' <button class="btn btn-primary" disabled onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}else{
					slidevar+='<button class="btn btn-primary" onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}
			
				slidevar+= '</div></div>   </div><!--/.First slide--> '
					
					
					if(i==0 ){
						//console.log("Temp::::::::::::::"+i);
						slidevar='<div class="carousel-item active">'+slidevar;
						
					}else if(i%3==0){
						//console.log("elseTemp::::::::::::::"+i);
						slidevar='</div><div class="carousel-item">'+slidevar;
					}
				
				//console.log(i+"=="+slidevar);
				pan2+=slidevar;
				}		  
			    slidefinal+=' </div></div> <!--/.Slides--></div>';
			   
			    final=slidemain+pan2+slidefinal;
			   // console.log("=="+final)
					//alert("content "+slidemain+slidevar+slidefinal);
			    $('#panel311').html(final);
			    
			    
			    
			    
			    /*Workshop*/
			    
			    
				
				var slidemain='',slidevar='',slidefinal='';	
					
					
				slidemain+='<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">';

				slidemain+='<!--Controls--><div class="controls-top"><a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a><a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fas fa-chevron-right"></i></a></div><!--/.Controls-->';

				slidemain+='<!--Indicators--><ol class="carousel-indicators"><li data-target="#multi-item-example" data-slide-to="0" class="active"></li><li data-target="#multi-item-example" data-slide-to="1"></li><li data-target="#multi-item-example" data-slide-to="2"></li></ol><!--/.Indicators-->';

				slidemain+='<!--Slides--><div class="carousel-inner" role="listbox"><!--First slide-->';
				var pan=0;
				var pan2="";
				for(var i=0;i<rowObj.length && pan<9;i++){
					
					if(rowObj[i].eventType=='WORKSHOPS'){
						
				
				slidevar='<div class="col-md-4"><div class="card mb-2"><img class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"> <div class="card-body">';
				slidevar+='<h4 class="card-title">'+rowObj[i].eventName+'</h4><p class="card-text">'+rowObj[i].eventDescription+'</p>';
				if(reglistevt.includes(rowObj[i].eventid)){
					slidevar+=' <button class="btn btn-primary" disabled onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}else{
					slidevar+='<button class="btn btn-primary" onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}
			
				slidevar+= '</div></div>   </div><!--/.First slide--> '
					
					
					if(pan==0 ){
						//console.log("Temp::::::::::::::"+i);
						slidevar='<div class="carousel-item active">'+slidevar;
						
					}else if(pan%3==0){
						//console.log("elseTemp::::::::::::::"+i);
						slidevar='</div><div class="carousel-item">'+slidevar;
					}
				
				//console.log(i+"=="+slidevar);
				pan2+=slidevar;
				pan++;
					}
				}		  
			    slidefinal+=' </div></div> <!--/.Slides--></div>';
			   
			    final=slidemain+pan2+slidefinal;
			 // console.log("WORKSHOPS=="+final)
					//alert("content "+slidemain+slidevar+slidefinal);
			    $('#panel312').html(final);
			    
			    
			    
			    
			    /*TECHMEETS*/
			    
				
				var slidemain='',slidevar='',slidefinal='';	
					
					
				slidemain+='<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">';

				slidemain+='<!--Controls--><div class="controls-top"><a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a><a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fas fa-chevron-right"></i></a></div><!--/.Controls-->';

				slidemain+='<!--Indicators--><ol class="carousel-indicators"><li data-target="#multi-item-example" data-slide-to="0" class="active"></li><li data-target="#multi-item-example" data-slide-to="1"></li><li data-target="#multi-item-example" data-slide-to="2"></li></ol><!--/.Indicators-->';

				slidemain+='<!--Slides--><div class="carousel-inner" role="listbox"><!--First slide-->';
				var pan2="";
				var pan=0;
				for(var i=0;i<rowObj.length && pan<9;i++){
					if(rowObj[i].eventType=='TECH MEETS'){
				//slidevar+='<div class="carousel-item active">';

				slidevar='<div class="col-md-4"><div class="card mb-2"> <img class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"><div class="card-body">';
				slidevar+='<h4 class="card-title">'+rowObj[i].eventName+'</h4><p class="card-text">'+rowObj[i].eventDescription+'</p>';
				if(reglistevt.includes(rowObj[i].eventid)){
					slidevar+=' <button class="btn btn-primary" disabled onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}else{
					slidevar+='<button class="btn btn-primary" onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}
			
				slidevar+= '</div></div>   </div><!--/.First slide--> '
					
					
					if(pan==0 ){
						//console.log("Temp::::::::::::::"+i);
						slidevar='<div class="carousel-item active">'+slidevar;
						
					}else if(pan%3==0){
						//console.log("elseTemp::::::::::::::"+i);
						slidevar='</div><div class="carousel-item">'+slidevar;
					}
				
				//console.log(i+"=="+slidevar);
				pan2+=slidevar;
				pan++;
					}
				}		  
			    slidefinal+=' </div></div> <!--/.Slides--></div>';
			   
			    final=slidemain+pan2+slidefinal;
			    //console.log("Techmetes=="+final)
					//alert("content "+slidemain+slidevar+slidefinal);
			    $('#panel313').html(final);
			    
			    
			    /*COURSES*/
			    
				
				var slidemain='',slidevar='',slidefinal='';	
					
					
				slidemain+='<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">';

				slidemain+='<!--Controls--><div class="controls-top"><a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a><a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fas fa-chevron-right"></i></a></div><!--/.Controls-->';

				slidemain+='<!--Indicators--><ol class="carousel-indicators"><li data-target="#multi-item-example" data-slide-to="0" class="active"></li><li data-target="#multi-item-example" data-slide-to="1"></li><li data-target="#multi-item-example" data-slide-to="2"></li></ol><!--/.Indicators-->';

				slidemain+='<!--Slides--><div class="carousel-inner" role="listbox"><!--First slide-->';
				var pan2="";
				var pan=0
				for(var i=0;i<rowObj.length && pan<9;i++){
				//slidevar+='<div class="carousel-item active">';
					if(rowObj[i].eventType=='COURSES'){

				slidevar='<div class="col-md-4"><div class="card mb-2"> <img class="card-img-top" src="./EventImages/'+rowObj[i].base64Image+'" alt="Card image cap"><div class="card-body">';
				slidevar+='<h4 class="card-title">'+rowObj[i].eventName+'</h4><p class="card-text">'+rowObj[i].eventDescription+'</p>';
				if(reglistevt.includes(rowObj[i].eventid)){
					slidevar+=' <button class="btn btn-primary" disabled onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}else{
					slidevar+='<button class="btn btn-primary" onClick="registerEvent('+rowObj[i].eventid+')">Button</button>';
					//slidevar+='<a class="btn btn-primary">Button</a>';
				}
			
				slidevar+= '</div></div>   </div><!--/.First slide--> '
					
					
					if(pan==0 ){
						//console.log("Temp::::::::::::::"+i);
						slidevar='<div class="carousel-item active">'+slidevar;
						
					}else if(pan%3==0){
						//console.log("elseTemp::::::::::::::"+i);
						slidevar='</div><div class="carousel-item">'+slidevar;
					}
				
				//console.log(i+"=="+slidevar);
				pan2+=slidevar;
				pan++;
					}
				}		  
			    slidefinal+=' </div></div> <!--/.Slides--></div>';
			   
			    final=slidemain+pan2+slidefinal;
			  // console.log("Cources=="+final)
					//alert("content "+slidemain+slidevar+slidefinal);
			    $('#panel314').html(final);
			    
			    
					
			
			
		
	}


function registerEvent(eventId){
	var useridtemp=$.session.get("userId");
	console.log("Enterd registerEvent.............."+useridtemp);
	
	
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
	window.location.href="./confirmation.jsp?eventid="+eventId+"&userid="+useridtemp;

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


function getAllProducts(){
	console.log("Success......");
	//var formData =  $('#registerForm1').serialize();  
	
	var userId=1;
	$.ajax({
		url : './StudentPortal/Event/viewallproducts',
		type: 'GET',
		/*dataType: 'TEXT',
		processData: false,
		contentType: false,	*/ 	
		async: false,
		dataType: 'TEXT',
		success: function(page){
			//alert(page);
			var test='<div class="row" style="padding:1%;">'+
		    '<div class="col-md"><div class="card card-cascade narrower" style="padding:1%;"><div class="view view-cascade overlay">'+
			    '<img id="image-${loopCounter.index}" class="card-img-top" src="data:image/jpg;base64,${listOfEvents.base64Image}" alt="Card image cap">'+
			    '<a><div class="mask rgba-white-slight"></div></a></div><div class="card-body card-body-cascade text-center">'+
			    '<h4 class="card-title"><strong><c:out value="${listOfEvents.eventName}"/></strong></h4>'+
			    '<h5 class="blue-text pb-2"><strong><c:out value="${listOfEvents.eventOrgName}"/></strong></h5>'+
			    '<p class="card-text"><c:out value="${listOfEvents.eventDescription}"/></p>'+
		 	    '<p class="font-weight-normal"><i class="fas fa-certificate pr-2"></i><span>Category: <c:out value="${listOfEvents.eventCatogery}"/></span></p>'+
			    '<p class="font-weight-normal"><i class="fas fa-book-reader pr-2"></i><span>Type: <c:out value="${listOfEvents.eventType}"/></span></p>'+
			     '<p class="font-weight-normal"><i class="far fa-clock pr-2"></i><span>Date: <fmt:formatDate pattern="dd MMMM yyyy" value="${listOfEvents.eventDate}" /></span></p>'+
			    '<a class="px-2 fa-lg li-ic"><i class="fab fa-linkedin-in"></i></a><a class="px-2 fa-lg tw-ic"><i class="fab fa-twitter"></i></a><a class="px-2 fa-lg fb-ic"><i class="fab fa-facebook-f"></i></a></div>'+
			'</div></div>'+
		  '<div class="row" style="padding:1%;">'+
		   ' </div>';
			//alert(page);
			setTimeout(function(){ 
				$("#allProd").html(test);
			
			}, 3000);
			
		  
		},
		error : function() {
			alert("Limit exceed*******************");
		}
		});
	
}


function sendfeedback(){

	console.log("sendfeedback*****************************");
	$('#preloader').show();
	var formData =  $('#feedBackForm').serialize();  
	//$("#conformationbtn").attr("disabled", true)
	$.ajax({
		url : './StudentPortal/Event/sendfeedback',
		type: 'POST',
		data: formData,
		dataType: 'TEXT',
		/*processData: false,
		contentType: false,	*/ 	
		async: false,
		success : function(reponse) {
			
			alert("Success");
		},
		error : function() {
			alert("Error*******************");
		}
	});
	$('#preloader').show();
	

}







