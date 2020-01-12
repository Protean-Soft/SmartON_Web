package com.protean.student.StudentPortal.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.protean.student.StudentPortal.StudentPortalApplication;
import com.protean.student.StudentPortal.model.EventDetails;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.model.TransactionDetails;
import com.protean.student.StudentPortal.repository.EventsDetailsRepository;
import com.protean.student.StudentPortal.repository.RegistrationDao;
import com.protean.student.StudentPortal.service.EventDetailsServiceImpl;
import com.protean.student.StudentPortal.service.MailSenderService;
import com.protean.student.StudentPortal.service.PaymentService;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;
import com.protean.student.StudentPortal.serviceImpl.EventRegisterServiceImpl;
import com.protean.student.StudentPortal.util.commonUtils;

@Controller
public class StudentPortalController {
	private static final Logger logger = LogManager.getLogger(StudentPortalApplication.class);

	@Autowired
	StudentUserDetailsService studentService;
	
	@Autowired
	MailSenderService mailSender;
	
	@Autowired
	RegistrationDao registrationDao;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired 
	EventDetailsServiceImpl event;
	
	
	@Autowired 
	EventRegisterServiceImpl evtreg;
	 
	
	@Autowired
	commonUtils common;
	
	@Autowired
	EventsDetailsRepository   eventDetailsRepository;
	
	@Value("${prod.url}")
	private String PROURL;
	
	
	
	@RequestMapping("/login")
	public String login(){
		return "login.jsp";
	}
	
	@RequestMapping(value="/")
	public String home() {		
		return "index.jsp";
	}
	
	@GetMapping(value = "/getLogonUserDetails", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, List<Object>> getUserDetails(Authentication authentication) throws UnsupportedEncodingException {
		System.out.println("Authenticatio name " + authentication.getName());
		String userName = authentication.getName();
		List<Object> registerUserDetails = new ArrayList<>();
		RegisterUserDetails regDetails = studentService.getLogonDetails(userName);
		//model.addAttribute("studentDetails", regDetails);
		
		//model.addAttribute("userName", userName);
		/*model.addAttribute("fullName", regDetails.getFirstName().substring(0, 1).toUpperCase()
				+ regDetails.getFirstName().substring(1) + " " + regDetails.getLastName());*/
		
		if (regDetails.getRewpoints() == null) {
			regDetails.setRewpoints((long) 0);
		}

		//model.addAttribute("rewardPoints", regDetails.getRewpoints());
		String studentName = regDetails.getFirstName().substring(0, 1).toUpperCase()
				+ regDetails.getFirstName().substring(1) + " " + regDetails.getLastName();
		String mailId = regDetails.getEmail();
		long userId = regDetails.getUserId();
		System.out.println(" ==== Registered user id === " + userId);
		//model.addAttribute("userId", userId);
		//model.addAttribute("email", mailId);
		TransactionDetails transDetails = paymentService.getByMailId(mailId);
		if (transDetails != null) {
			if (!transDetails.getStatus().equals("success") && transDetails.getProductinfo().equals("PremiumUser")
					&& regDetails.getIsPremium().equals("premium")) {
				regDetails.setIsPremium("guest");
				studentService.updateUserDetails(regDetails);
			}
		} else if (regDetails.getIsPremium().equals("premium")) {
			regDetails.setIsPremium("guest");
			studentService.updateUserDetails(regDetails);
		}
		
		System.out.println("Entereddd....................");
		
		/*
		 * System.out.println("Error in lig.................."+eventDetailsRepository.
		 * findAllByDeletedflag(0));
		 */
		List<EventDetails> eventDetailsByFlag = eventDetailsRepository.findAllByDeletedflag(0);
System.out.println("Completedddd............");
		//List<EventDetails> evt = event.findAllByDeletedflag();
		List<Long> evtbyUser = evtreg.getEventRegisterEventByuserId(userId);
		System.out.println("evtbyUser........." + evtbyUser);
		List<Object> evt1 = new ArrayList<>();
	
		evt1.add(eventDetailsByFlag);
		evt1.add(evtbyUser);
		/*
		 * Iterator ir = evt.listIterator(); while (ir.hasNext()) { EventDetails evtdet
		 * = (EventDetails) ir.next(); System.out.println(evtdet.getEventid() + "====" +
		 * evtdet.getEventName() + "=======" + evtdet.getEventImage()); if
		 * (evtdet.getEventImage() != null) { String base64Image =
		 * common.Covertbase64(evtdet.getEventImage());
		 * evtdet.setBase64Image(base64Image); } evt1.add(evtdet);
		 * 
		 * }
		 */
		/*model.addAttribute("attenevts", evtbyUser);
		model.addAttribute("listOfEvt", evt1);*/
		
		/*
		 * JSONObject userWithEventDetails = new JSONObject();
		 * userWithEventDetails.put("userId", userId);
		 * userWithEventDetails.put("userName", userName);
		 * userWithEventDetails.put("email", mailId);
		 * userWithEventDetails.put("fullName", studentName);
		 * userWithEventDetails.put("rewardPoints", regDetails.getRewpoints());
		 * userWithEventDetails.put("event_list", evt1);
		 * System.out.println("userWithEventDetails" + userWithEventDetails.toString());
		 */
		
		registerUserDetails.add(regDetails);
		
		Map<String,List<Object>> map = new HashMap<>();
		map.put("userDetails", registerUserDetails);
		map.put("EventDetails", evt1);
		
		return map;
	}
	
	@RequestMapping("/logout")
	public String logout(){
		return "login.jsp";
	}
	
	/*
	 * @RequestMapping("/register") public String register(){
	 * System.out.println("register"); return "register.html"; }
	 */
	

	/* List event details based on event id */
	@RequestMapping(value="/getEventDetail/{id}",produces = MediaType.APPLICATION_JSON_VALUE)
	//@GetMapping(value = "/getEventDetail/{id}")
	public String getEventById(@PathVariable Long id,Model model) {
		System.out.println("Enterd into eventdetail");
		EventDetails evt=event.getEventById(id);
		model.addAttribute(evt);
		System.out.println("Response...."+evt);		
		return "confirmation.jsp";
				
	}
	
	@RequestMapping(value="/registerUser")
    @ResponseBody
	public String  registerUser(RegisterUserDetails registerDetails){
		System.out.println("ENtered into***********************" );
		String password = new BCryptPasswordEncoder().encode(registerDetails.getPassword());
		registerDetails.setPassword(password);
		System.out.println("Premium::::::::::::"+registerDetails.getIsPremium());
		if(registerDetails.getIsPremium()=="premium" ||registerDetails.getIsPremium().equalsIgnoreCase("premium") ) {
			System.out.println("IF PART");
			registerDetails.setNoofevtallowed((long) 5);
		}else {
			System.out.println("ELSE PART");
			registerDetails.setNoofevtallowed((long) 0);
		}
		System.out.println("No of event allowed....."+registerDetails.getNoofevtallowed());
		RegisterUserDetails reg=studentService.registerUser( registerDetails);
		System.out.println("Registration......"+reg);
		if(registerDetails.getRefcode()!="" && registerDetails.getRefcode()!=null && !registerDetails.getRefcode().equalsIgnoreCase("")) {
			
			System.out.println(":::::::::::::::"+registerDetails.getRefcode()+"===================");
			registerDetails = studentService.getUserDetailsByProfileId(registerDetails.getRefcode());
	
		
		if(registerDetails != null) {
			Long rewardPoints = registerDetails.getRewpoints();
			if(rewardPoints == null) {
				rewardPoints = 0l;
			}
			rewardPoints = rewardPoints + 1000;
			
			studentService.updateRewards(rewardPoints,registerDetails.getUserName());
		}
		}
		//studentService.updateRewards(registerDetails.getProfileID());
		
		try {
			mailSender.sendEmail(registerDetails);
		} catch (MessagingException e) {
			System.out.println("sending mail to user is failed " + e.getMessage());
			
		}
		return "success";
	}
	
	@RequestMapping("/checkValidData")
	@ResponseBody
	public String checkValidData(String userName, String email, HttpServletRequest request) {
		
		 System.out.println("URL..................."+PROURL);
		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		JSONObject jsObj = studentService.registerValidityChecker(userName, email);
		jsObj.append("url", PROURL);
		return jsObj.toString();
	}
	
	@RequestMapping("/login-error")
    public String login(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        String errorMessage = null;
        if (session != null) {
            AuthenticationException ex = (AuthenticationException) session
                    .getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
            if (ex != null) {
                errorMessage = ex.getMessage();
            }
        }
        model.addAttribute("errorMessage", errorMessage);
        return "login.jsp";
    }
	
}
