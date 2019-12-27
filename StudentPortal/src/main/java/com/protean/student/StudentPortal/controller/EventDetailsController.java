package com.protean.student.StudentPortal.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.mail.MailException;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.protean.student.StudentPortal.model.EventDetails;
import com.protean.student.StudentPortal.model.EventRegister;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.repository.RegistrationDao;
import com.protean.student.StudentPortal.service.EventDetailsService;
import com.protean.student.StudentPortal.service.EventRegisterService;
import com.protean.student.StudentPortal.service.MailSenderService;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;
import com.protean.student.StudentPortal.serviceImpl.EventRegisterServiceImpl;
import com.protean.student.StudentPortal.util.commonUtils;

@RestController
@RequestMapping("StudentPortal/Event")
public class EventDetailsController {

	 /*@Value("${spring.application.uploadDirectory}")
	   private String uploadDirectory;*/

	@Autowired(required = true)
	EventDetailsService eventDetailsService;

	@Autowired(required = true)
	EventRegisterService eventRegisterDetailsService;

	@Autowired
	RegistrationDao registrationDao;

	@Autowired
	MailSenderService mailSenderService;
	
	@Autowired
	commonUtils commonutil;
	
	@Autowired
	EventRegisterServiceImpl eventreg;
	
	@Autowired
	StudentUserDetailsService studentService;
	

	/* Add multiple events */
	@PostMapping(value = "/addEvent") /* Insert and update list of records */
	public String addEvent(@RequestBody List<EventDetails> eventdetails) {

		return eventDetailsService.addEvent(eventdetails);
	}

	/* Add single event at a time */
	@PostMapping(value = "/addEventDetail")
	public EventDetails addEventDetail(@RequestParam("date") String date,@RequestParam("image") MultipartFile image,@Valid EventDetails eventdetails) throws ParseException, IOException {
		byte[] data=commonutil.ConvertImagetoByte(image);
		eventdetails.setEvenyImage(data);
		Date date1=commonutil.ConvertStringtoByte(date);  
		eventdetails.setEventDate(date1);
		return eventDetailsService.addEventDetail(eventdetails);
	}

	@PostMapping(value = "/updateEventDetailImage")
	public String addEventDetailImage(@RequestParam("date") String date,@RequestParam("image") MultipartFile image, @Valid EventDetails eventdetails) throws ParseException, IOException {
			
		byte[] data=commonutil.ConvertImagetoByte(image);
		eventdetails.setEvenyImage(data);
		Date date1=commonutil.ConvertStringtoByte(date);  
		eventdetails.setEventDate(date1);
		return eventDetailsService.addEventDetailUpdate(eventdetails);
		//return evt;
		

		 
	}

	/* List event details based on event id */
	//@RequestMapping(value="/getEventDetail/{id}",produces = MediaType.APPLICATION_JSON_VALUE)
	@GetMapping(value = "/getEventDetail/{id}")
	public EventDetails getEventById(@PathVariable Long id,Model model) {
		
		EventDetails evt=eventDetailsService.getEventById(id);
		
		System.out.println("eventdetailbyid..."+evt);
		model.addAttribute(evt);
		return evt;
				
	}
	
	
	@GetMapping(value = "/getEventDetail/{eventid}/{userid}")
	public List getEventByevtIduserID(@PathVariable Long eventid,@PathVariable Long userid) {
		List<Object> ls=new ArrayList();
		EventDetails evt=eventDetailsService.getEventById(eventid);
		/*System.out.println("No of events attennnnn...."+eventreg.getnoofregistration(id));
		System.out.println("eventdetailbyid..."+evt);*/
		Long noofeventatt=eventreg.getnoofregistrationstudent(userid);
		Long noofeventattendence=eventreg.getnoofregistrationevent(eventid);
System.out.println("noofeventatt=========="+noofeventatt);
		ls.add(evt);
		ls.add(noofeventatt);
		ls.add(noofeventattendence);
		//model.addAttribute(evt);
		return ls;
				
	}

	/* List out all ongoing events */
	@GetMapping(value = "getOngoingEvents",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ModelAndView getAllNonDeletedEvents(ModelMap model) {
		System.out.println("Successfully Registerd..............");
		List<EventDetails> evt=eventDetailsService.findAllByDeletedflag();
		List<EventDetails> evt1=new ArrayList<EventDetails>();
		Iterator ir=evt.listIterator();
		while(ir.hasNext()) {
			EventDetails evtdet=(EventDetails) ir.next();
			System.out.println(evtdet.getEventid()+"===="+evtdet.getEventName()+"======="+evtdet.getEventImage());
			if(evtdet.getEventImage()!=null) {
				String base64Image=commonutil.Covertbase64(evtdet.getEventImage());
			evtdet.setBase64Image(base64Image);
		}
			evt1.add(evtdet);
		}
		RegisterUserDetails regDetails = studentService.getLogonDetails("andrew");
		
		model.addAttribute("studentDetails", regDetails);
		model.addAttribute("userName", regDetails.getFirstName());
		model.addAttribute("fullName",regDetails.getFirstName() + " " + regDetails.getLastName());
		String mailId = regDetails.getEmail();
		long userId = regDetails.getUserId();
		model.addAttribute("userId",userId);
		model.addAttribute("listOfEvt",evt1);
		//model.setViewName("index.jsp");
		return new ModelAndView("redirect:/index.jsp", model);
		//return model;
	}

	@GetMapping(value = "viewAllProduct",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ModelAndView viewAllProduct(ModelMap model) {
		System.out.println("Successfully Registerd..............");
		List<EventDetails> evt=eventDetailsService.findAllByDeletedflag();
		List<EventDetails> evt1=new ArrayList<EventDetails>();
		Iterator ir=evt.listIterator();
		while(ir.hasNext()) {
			EventDetails evtdet=(EventDetails) ir.next();
			System.out.println(evtdet.getEventid()+"===="+evtdet.getEventName()+"======="+evtdet.getEventImage());
			if(evtdet.getEventImage()!=null) {
				String base64Image=commonutil.Covertbase64(evtdet.getEventImage());
			evtdet.setBase64Image(base64Image);
		}
			evt1.add(evtdet);
		}
		RegisterUserDetails regDetails = studentService.getLogonDetails("andrew");
		
		model.addAttribute("studentDetails", regDetails);
		model.addAttribute("userName", regDetails.getFirstName());
		model.addAttribute("fullName",regDetails.getFirstName() + " " + regDetails.getLastName());
		String mailId = regDetails.getEmail();
		long userId = regDetails.getUserId();
		model.addAttribute("userId",userId);
		model.addAttribute("listOfEvt",evt1);
		//model.setViewName("index.jsp");
		return new ModelAndView("redirect:/products.jsp", model);
		//return model;
	}

	
	
	/* Listout event based on catagory and type of events */
	@GetMapping(value = "/getOngoingEventsByCatogery/{catogery}/{type}")
	public List<EventDetails> getOngoingEventsByCatogery(@PathVariable String catogery, @PathVariable String type) {
		System.out.println("Succes..................");
		// long flag=0;
		return eventDetailsService.getOngoingEventsByCatogery(catogery, type);
	}

	/* List out all the events without condition */
	@GetMapping(value = "/getallEventDetails")
	public List<EventDetails> getAllStudents() {
		return eventDetailsService.getAllEvents();
	}

	/* Update event details based on event id */
	@PostMapping(value = "/updateEventDetail/{id}")
	public EventDetails updateStudent(@RequestParam("date") String date,@RequestParam("image") MultipartFile image, @Validated EventDetails eventDetails) throws IOException, ParseException {
		
		byte[] data=commonutil.ConvertImagetoByte(image);
		eventDetails.setEvenyImage(data);
		Date date1=commonutil.ConvertStringtoByte(date);  
		eventDetails.setEventDate(date1);
		return eventDetailsService.updateEventDetails(eventDetails);
	}

	/* Remove event or delete Event */
	@GetMapping(value = "/deleteEventDetail/{id}")
	public int deleteEventDetail(@PathVariable Long id) {
		int message = 0;
		return eventDetailsService.deleteEventDetail(id);
	}

	@GetMapping(value = "/getUser/{userName}")
	public RegisterUserDetails getStudentById(@PathVariable String userName) {
		return registrationDao.findByUserName(userName);
	}

	@GetMapping(value = "/sendMail/{mailID}")
	public String send(@PathVariable String mailID) throws MessagingException {
		try {
			RegisterUserDetails registerUserDetails = registrationDao.findByEmail(mailID);
			mailSenderService.sendEmail(registerUserDetails);
		} catch (MailException mailException) {
			System.out.println(mailException);
		}
		return "Congratulations! Your mail has been send to the user.";
	}

	/***************************** EVENT REGISTRATION AND ATTENDENCE */

	/* Event Registration Sevice */
	@PostMapping(value = "/addEventRegistrationDetail")
	@ResponseBody
	public String addEventRegistrationDetail(@RequestParam("eventId") Long eventId,@RequestParam("userId") Long userId) throws ParseException {

		EventRegister eventregister=new EventRegister();
		eventregister.setEventid(eventId);
		eventregister.setUserid(userId);
		System.out.println("Ebtereed addEventRegistrationDetail..."+eventregister.getEventid());
		String msg=eventRegisterDetailsService.addEventRegistrationDetail(eventregister);
		System.out.println("Message...."+msg);
		return msg;
	}

	/* Get Event Registration Details based on eventid */
	@GetMapping(value = "/getRegisteredEventDetailByEventid/{id}")
	public List<EventRegister> getEventRegisterDetailsByEventType(@PathVariable Long id) {
		System.out.println("***************" + id);
		return eventRegisterDetailsService.getEventRegisterDetailsByEventId(id);
	}
	
	/* Get Event Registration Details based on useid */
	
	  @GetMapping(value = "/getRegisteredEventDetailByUserid/{id}") public
	 List<Long> getEventRegisterEventByuserId(@PathVariable Long id) {
	  System.out.println("***************" + id); 
	List<Long> lstevtids= eventRegisterDetailsService.getEventRegisterEventByuserId(id); 
	return lstevtids;
	  }
	 
	/* Student Attendence sevice */
	@PostMapping(value = "/UpdateEventRegisterAttendence")
	public List<EventRegister> UpdateEventRegisterAttendence(@RequestBody List<EventRegister> evtregDetails) {

		System.out.println("Successfully Entered..............");
		return eventRegisterDetailsService.UpdateEventRegisterAttendence(evtregDetails);
	}

}

