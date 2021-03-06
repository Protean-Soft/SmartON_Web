package com.protean.student.StudentPortal.service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.protean.student.StudentPortal.model.EventDetails;
import com.protean.student.StudentPortal.model.MailRequest;
import com.protean.student.StudentPortal.model.RegisterUserDetails;

@Service
public class MailSenderService {

	@Autowired
	private JavaMailSender jms;

	@Autowired
	public MailSenderService(JavaMailSender javaMailSender) {
		this.jms = javaMailSender;
	}
	@Autowired
	private EmailService service;
	
	@Value("${spring.mail.username}")
	private String frommailid;

	public void sendEmail(RegisterUserDetails registerUserDetails) throws MessagingException {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(registerUserDetails.getEmail());

		msg.setSubject("Thank You for Register in Tag #");

		String body = "Welcome to” Tag “The Professional Academy \r\n"
				+ "TAG a unique concept in bridging your career in line to current corporate requirement.\r\n"
				+ "Freedom to design our own life is the greatest gift we can ever get and TAG academy is the right platform to help you get closer to it.\r\n"
				+ "We are glad you choose TAG !!\r\n" + "Welcome to the Academy !!";
		body += "\n \n Use this Referal code " + registerUserDetails.getProfileID() + " and You have Earn Rewards!  '1000' " + " Happy Learning!";

		msg.setText(body);
		jms.send(msg);

	}
	
	
	
	
	public void sendFeedbackEmail(HashMap<String, String> map) throws MessagingException {
		SimpleMailMessage feedback = new SimpleMailMessage();
		feedback.setTo(map.get("adminEmail"));
		feedback.setCc(map.get("mailID"));
	
		feedback.setSubject("Feedback...");

		String body = "Suggessions : "+map.get("sugges")+"\r\r\n"
		+"Academic Feedback :" +map.get("sugges")
		+"\r\n\r\n \n\r\n"

		+"Thanks & Regards\r\n"

		+"Team TagAcademy\r\n"	;
		feedback.setText(body);
		jms.send(feedback);

	}
	
	
	
	/**
	 * Send reset password url to student email
	 * @param email
	 * @param appUrl
	 */

	public void sendEmail(String email, String appUrl) {
		SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
		passwordResetEmail.setTo(email);
		passwordResetEmail.setSubject("Password Reset Request");
		passwordResetEmail.setText(
				"To reset your password, click the link below:\n" + appUrl + "/reset?email='" + email + "'");

		jms.send(passwordResetEmail);

	}
	
	
	public void sendEmailRegisterevent(RegisterUserDetails userinfo,EventDetails evtdet) throws MessagingException {
		if(userinfo.getFirstName()!="" && userinfo.getEmail()!="" && userinfo.getNoofevtallowed()!=null &&  evtdet.getEventName()!="" && evtdet.getEventVenue()!="" && evtdet.getEventDate()!=null) {
			
			Map<String, Object> model = new HashMap<>();
			
			model.put("eventName", evtdet.getEventName());
			model.put("eventDescription", evtdet.getEvent_description());
			model.put("eventVenue", evtdet.getEventVenue());
			model.put("eventDate", evtdet.getEventDate());
			model.put("name", userinfo.getFirstName());
			model.put("orgName", evtdet.getEventOrgName());
			
			MailRequest request= new MailRequest();
			request.setName(userinfo.getFirstName());
			request.setFrom(frommailid);
			request.setSubject("Thank you for registering this Event #");
			request.setTo(userinfo.getEmail());
			System.out.println(service.sendEmail(request, model));
			
			
		
			/*
			 * SimpleMailMessage msg = new SimpleMailMessage();
			 * msg.setTo(userinfo.getEmail());
			 * 
			 * msg.setSubject("Thank You for Register in Event #");
			 * 
			 * String body = "Hi "+userinfo.getFirstName()+" \r\n"
			 * +"You have successfully registered for "+evtdet.getEventName()
			 * +" with was venued at "+evtdet.getEventVenue()+" on "+evtdet.getEventDate()+
			 * "\r\n"
			 * 
			 * +"Please be on time for your event. \r\n\r\n\r\n"
			 * 
			 * +"Thanks & Regards\r\n"
			 * 
			 * +"Team TagAcademy\r\n";
			 * 
			 * 
			 * msg.setText(body); jms.send(msg);
			 */
	}

	}

	public void sendEmailToReddemOffer(String mailID, String adminEmail, String name,String offerTitle) {
		SimpleMailMessage reedemMail = new SimpleMailMessage();
		reedemMail.setTo(adminEmail);
		reedemMail.setCc(mailID);
		reedemMail.setSubject("User wants to use the offer");
		
		String body = "Hey Admin\r\n " + name + " reached 10000 reward points now he wants to use " + offerTitle + "\r\n"

		+"\r\n\r\n"

		+"Thanks & Regards\r\n"

		+"Team TagAcademy\r\n";

		
		reedemMail.setText(body);
		jms.send(reedemMail);
	}
}
