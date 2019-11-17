package com.protean.student.StudentPortal.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.repository.RegistrationDao;
import com.protean.student.StudentPortal.service.MailSenderService;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;

@Controller
public class StudentPortalController {

	@Autowired
	StudentUserDetailsService studentService;

	@Autowired
	MailSenderService mailSender;

	@Autowired
	RegistrationDao registrationDao;

	@Autowired
	private JavaMailSender jms;

	@RequestMapping("/")
	public String home(Authentication authentication, Model model) {
		String userName = authentication.getName();
		RegisterUserDetails regDetails = studentService.getLogonDetails(userName);
		model.addAttribute("studentDetails", regDetails);
		model.addAttribute("userName", userName);
		return "dashboard.jsp";
	}

	@RequestMapping("/login")
	public String login() {
		return "login.jsp";
	}

	@RequestMapping("/logout")
	public String logout() {
		return "login.jsp";
	}

	/*
	 * @RequestMapping("/register") public String register(){
	 * System.out.println("register"); return "register.html"; }
	 */

	@RequestMapping("/registerUser")
	@ResponseBody
	public String registerUser(RegisterUserDetails registerDetails) {
		String password = new BCryptPasswordEncoder().encode(registerDetails.getPassword());
		registerDetails.setPassword(password);
		studentService.registerUser(registerDetails);
		registerDetails = registrationDao.findByEmail(registerDetails.getEmail());
		registrationDao.updateRewards(registerDetails.getProfileID());

		try {
			mailSender.sendEmail(registerDetails);
		} catch (MessagingException e) {
			System.out.println("sending mail to user is failed " + e.getMessage());

		}
		return "success";
	}

	/**
	 * check userName and email in DB
	 * @param userName
	 * @param email
	 * @return
	 */
	@RequestMapping("/checkValidData")
	@ResponseBody
	public String checkValidData(String userName, String email) {
		JSONObject jsObj = studentService.registerValidityChecker(userName, email);
		return jsObj.toString();
	}

	/**
	 * send reset url to email
	 * @param email
	 * @param request
	 * @return
	 */
	@RequestMapping("/forgotPassword")
	@ResponseBody
	public String forgotPassword(@RequestParam(name = "forgotEmail") String email, HttpServletRequest request) {
		System.out.println(email + " request " + request.getScheme() + request.getServerName() + request.getServerPort()
				+ request.getServletPath());
		RegisterUserDetails regObj = studentService.forgotPassword(email);
		String isValid = "valid";
		if (regObj != null) {

			String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();

			// send mail
			// mailSender.sendEmail(email);

			SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
			passwordResetEmail.setFrom("regthetagacademy@gmail.com");
			passwordResetEmail.setTo(email);
			passwordResetEmail.setSubject("Password Reset Request");
			passwordResetEmail
					.setText("To reset your password, click the link below:\n" + appUrl + "/reset?email=" + email);

			jms.send(passwordResetEmail);

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
	@RequestMapping(value = "/reset")
	public ModelAndView displayPasswordPage(ModelAndView resetPage, @PathVariable("email") String userEmail) {
		if (userEmail != null) {
			resetPage.addObject("email", userEmail);
			resetPage.setViewName("resetPassword");
		}
		return resetPage;
	}

	// Process reset password form
	@RequestMapping(value = "/resetsubmit", method = RequestMethod.POST)
	public ModelAndView setNewPassword(ModelAndView modelAndView, @PathVariable("email") String userEmail,
			@PathVariable("newPassword") String password, RegisterUserDetails userDetails) {
		if (userEmail != null) {
			String newPassword = new BCryptPasswordEncoder().encode(password);
			userDetails.setEmail(userEmail);
			userDetails.setPassword(newPassword);
			studentService.updateUserDetails(userDetails);
			modelAndView.addObject("message", "Password successfully reset...");
			modelAndView.setViewName("login");
		} else {
			modelAndView.addObject("message", "Password reset failed.");
			modelAndView.setViewName("login");
		}
		return modelAndView;
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
