package com.protean.student.StudentPortal.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.protean.student.StudentPortal.model.EventDetails;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.model.TransactionDetails;
import com.protean.student.StudentPortal.repository.PaymentDao;
import com.protean.student.StudentPortal.repository.RegistrationDao;
import com.protean.student.StudentPortal.service.EventDetailsServiceImpl;
import com.protean.student.StudentPortal.service.MailSenderService;
import com.protean.student.StudentPortal.service.PaymentService;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;
import com.protean.student.StudentPortal.util.commonUtils;

@Controller
public class StudentPortalController {
	

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
	commonUtils common;
	
	@RequestMapping(value="/",produces = MediaType.APPLICATION_JSON_VALUE)
	public String home(Authentication authentication,Model model) throws UnsupportedEncodingException{
		String userName = authentication.getName();
		RegisterUserDetails regDetails = studentService.getLogonDetails(userName);
		model.addAttribute("studentDetails", regDetails);
		model.addAttribute("userName", userName);
		model.addAttribute("fullName",regDetails.getFirstName() + " " + regDetails.getLastName());
		model.addAttribute("rewardPoints", regDetails.getRewpoints());
		String mailId = regDetails.getEmail();
		long userId = regDetails.getUserId();
		model.addAttribute("userId",userId);
		TransactionDetails transDetails = paymentService.getByMailId(mailId);
		if(transDetails != null) {
			if(!transDetails.getStatus().equals("success") && transDetails.getProductinfo().equals("PremiumUser") && regDetails.getIsPremium().equals("premium")) {
				regDetails.setIsPremium("guest");
				studentService.updateUserDetails(regDetails);
			}
		}else if(regDetails.getIsPremium().equals("premium")) {
			regDetails.setIsPremium("guest");
			studentService.updateUserDetails(regDetails);
		}
		
		List<EventDetails> evt=event.findAllByDeletedflag();
		List<EventDetails> evt1=new ArrayList<EventDetails>();
		Iterator ir=evt.listIterator();
		while(ir.hasNext()) {
			//System.out.println(evt.get(1));
			
			EventDetails evtdet=(EventDetails) ir.next();
			System.out.println(evtdet.getEventid()+"===="+evtdet.getEventName()+"======="+evtdet.getEventImage());
			if(evtdet.getEventImage()!=null) {
				String base64Image=common.Covertbase64(evtdet.getEventImage());
			evtdet.setBase64Image(base64Image);
			}
			evt1.add(evtdet);
			
			/*
			 * int bytesRead = -1;
			 * 
			 * while ((bytesRead = inputStream.read(bytesRead)) != -1) {
			 * outputStream.write(bytesRead, 0, bytesRead); }
			 */
		 
	/*		byte[] imageBytes = outputStream.toByteArray();
			 
			String base64Image = Base64.getEncoder().encodeToString(imageBytes);*/
			 
			/*
			 * String base64Encoded = new String(evtdet.getEventImage(), "UTF-8");
			 * System.out.println("After conversion............"+base64Encoded);
			 */
			
			
		}
		
		model.addAttribute("listOfEvt",evt1);
		return "index.jsp";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login.jsp";
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
	
	@RequestMapping("/registerUser")
	@ResponseBody
	public String registerUser(RegisterUserDetails registerDetails){
		String password = new BCryptPasswordEncoder().encode(registerDetails.getPassword());
		registerDetails.setPassword(password);
		studentService.registerUser( registerDetails);
		registerDetails = studentService.getUserDetailsByProfileId(registerDetails.getRefcode());
		if(registerDetails != null) {
			Long rewardPoints = registerDetails.getRewpoints();
			if(rewardPoints == null) {
				rewardPoints = 0l;
			}
			rewardPoints = rewardPoints + 1000;
			studentService.updateRewards(rewardPoints,registerDetails.getUserName());
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
	public String checkValidData(String userName,String email) {
		JSONObject jsObj = studentService.registerValidityChecker(userName, email);
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
