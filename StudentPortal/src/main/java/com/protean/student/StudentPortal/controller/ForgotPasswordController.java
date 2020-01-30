package com.protean.student.StudentPortal.controller;

import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.service.MailSenderService;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;
import com.protean.student.StudentPortal.service.UserService;

@RestController
public class ForgotPasswordController {

	@Autowired
	StudentUserDetailsService studentService;

	@Autowired
	MailSenderService mailSender;
	
	@Autowired
	UserService userService;

	@Value("${prod.url}")
	private String PROURL;
	
	/**
	 * send reset url to email
	 * 
	 * @param email
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/forgotPassword",method=RequestMethod.POST)
	@ResponseBody
	public String forgotPassword(@RequestParam(name = "forgotEmail") String email, HttpServletRequest request) {
		System.out.println(email + " request " + request.getScheme() + request.getServerName() + request.getServerPort()
				+ request.getServletPath());
				
		RegisterUserDetails userDetails = studentService.forgotPassword(email);
		String isValid = "valid";
		if (userDetails != null) {
			userDetails.setResetToken(UUID.randomUUID().toString());
			userService.saveUser(userDetails);
			String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
			// send mail
			mailSender.sendEmail(email, PROURL,userDetails.getResetToken());
		} else {
			isValid = "invalid";
		}
		return isValid;
	}

	/**
	 * Display reset password ui page
	 * 
	 * @param userEmail
	 * @param resetPage
	 * @return
	 */
	@GetMapping("/reset")
	public ModelAndView displayPasswordPage(ModelAndView resetPage, @RequestParam("token") String token) {
		
		Optional<RegisterUserDetails> user = userService.findUserByResetToken(token);
		if(user.isPresent()) {
			resetPage.addObject("resetToken", token);
		} else {
			resetPage.addObject("errorMessage", "Oops!  This is an invalid password reset link.");
		}
		resetPage.setViewName("resetPassword.jsp");
		return resetPage;
	}

	// Process reset password form
	@RequestMapping(value = "/resetsubmit", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public ModelAndView setNewPassword(ModelAndView model,@RequestParam("password") String password,
			@RequestParam("token") String token) {
		
		System.out.println("TOKEN : : " + token + "new password "+ password);
		
		// Find the user associated with the reset token
		Optional<RegisterUserDetails> user = userService.findUserByResetToken(token);
				
		if(user.isPresent()) {
			System.out.println(" ========= Token avalailable in DB ========== ");
			RegisterUserDetails resetUser = user.get();
			String newPassword = new BCryptPasswordEncoder().encode(password); 
			resetUser.setPassword(newPassword);
			resetUser.setResetToken(null);
			userService.saveUser(resetUser);
			System.out.println("Redirect ..........................");
			
			model.addObject("positive","Password successfully updated");
			return model;
		} else {
			System.out.println(" ======= Invalid rest link ====== ");
			model.addObject("errorMessage", "Oops!  This is an invalid password reset link.");
			model.setViewName("login.jsp");
		}
		System.out.println("MODEL  : " + model.toString());
		return model;
	}
}
