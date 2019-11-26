package com.protean.student.StudentPortal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.service.MailSenderService;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;

@Controller
public class ForgotPasswordController {

	@Autowired
	StudentUserDetailsService studentService;

	@Autowired
	MailSenderService mailSender;

	/**
	 * send reset url to email
	 * 
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
			mailSender.sendEmail(email, appUrl);
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
	public String displayPasswordPage(Model resetPage, @RequestParam("email") String userEmail) {
		if (userEmail != null) {
			System.out.println("Reset user email  " + userEmail.replaceAll("'", ""));
			resetPage.addAttribute("email", userEmail.replaceAll("'", ""));

		}
		return "resetPassword.jsp";
	}

	// Process reset password form
	@RequestMapping(value = "/resetsubmit", method = RequestMethod.POST)
	public String setNewPassword(Model model, @RequestParam("email") String userEmail,
			@RequestParam("newPassword") String password, RegisterUserDetails userDetails) {
		if (userEmail != null) {
			System.out.println(" ===== new password ==== " + password);
			String newPassword = new BCryptPasswordEncoder().encode(password);
			System.out.println("enc pad" + newPassword);
			System.out.println("mail" + userEmail);
			userDetails.setEmail(userEmail);
			userDetails.setPassword(newPassword);
			System.out.println("Obj mail" + userDetails.getEmail());
			studentService.updateUserDetails(userDetails);
			model.addAttribute("message", "Password successfully reset...");
		} else {
			model.addAttribute("message", "Password reset failed.");
		}
		return "login.jsp";
	}

}
