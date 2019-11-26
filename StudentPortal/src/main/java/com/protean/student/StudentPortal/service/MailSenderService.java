package com.protean.student.StudentPortal.service;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.protean.student.StudentPortal.model.RegisterUserDetails;

@Service
public class MailSenderService {

	@Autowired
	private JavaMailSender jms;

	@Autowired
	public MailSenderService(JavaMailSender javaMailSender) {
		this.jms = javaMailSender;
	}
	
	
	/**
	 * Send email after successful sign-in
	 * @param registerUserDetails
	 * @throws MessagingException
	 */

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
	
	
	public void sendEmail(String email) {
		
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
}
