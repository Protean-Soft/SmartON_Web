package com.protean.student.StudentPortal.controller;

import java.io.IOException;
import java.util.Optional;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.mail.MailException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.protean.student.StudentPortal.model.EmailNotFound;
import com.protean.student.StudentPortal.model.ImageModel;
import com.protean.student.StudentPortal.model.InvalidUserDetailsException;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.model.ResourceNotFoundException;
import com.protean.student.StudentPortal.repository.ImageRepository;
import com.protean.student.StudentPortal.repository.RegistrationDao;
import com.protean.student.StudentPortal.service.MailSenderService;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;
import com.protean.student.StudentPortal.util.commonUtils;

@RestController
@RequestMapping("tag/userProfile")
public class UserProfileController {

	private final static long OFFER_POINTS = 10000L;
	
	@Autowired
	StudentUserDetailsService studentService;
	
	@Autowired
	ImageRepository imageRepository;
	
	@Autowired
	RegistrationDao registrationDao;
	
	@Autowired
	MailSenderService mailSenderService;
	
	@Value("${admin.email}")
	private String adminEmail;
	


	/**
	 * Fetch user details
	 * @param userName
	 * @param model
	 * @param userDetails
	 * @return
	 * @throws InvalidUserDetailsException 
	 */
	
	@GetMapping(value="/userDetails",produces = MediaType.APPLICATION_JSON_VALUE,consumes = MediaType.APPLICATION_JSON_VALUE)
	public RegisterUserDetails retrieveUserDetailsByName(@RequestParam("userName") String userName,
			Model model) throws InvalidUserDetailsException {
		
		RegisterUserDetails userDetails = studentService.getLogonDetails(userName);	
		if(userDetails != null) {
			model.addAttribute("userdetails",  userDetails);
			return userDetails;
		}  else {
			System.out.println(" User details not found .... ");
			throw new InvalidUserDetailsException(commonUtils.INVALID_USER_NAME);
		}		
	}
	
	/**
	 * update user details 
	 * @param userName
	 * @return
	 * @throws JsonProcessingException 
	 */
	
	@PostMapping(value="/updateUserDetails",produces = MediaType.APPLICATION_JSON_VALUE)
	public Integer updateDetails (@RequestParam("userId") Long userId,@RequestParam("collegeName") String collegeName,
			@RequestParam("userName") String userName,@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,@RequestParam("email") String email,
			@RequestParam("phoneNo") String mobileNum,@RequestParam("city") String city,@RequestParam("state") String state
			,ModelAndView view) {
		System.out.println(userId + userName + email);
		RegisterUserDetails userDetails = new RegisterUserDetails(userId,firstName,lastName,userName,mobileNum,city,state);
		int response = studentService.updateUserDetailsData(userDetails);	
		if(response == 1) {
			return response;
		} else {
			return 0;
		}
	}
	
	
	/**
	 * Get reward points for user
	 * @param userName
	 * @param rewardEnable
	 * @return
	 * @throws ResourceNotFoundException 
	 */
	
	@GetMapping("/retrieveUserRewards")
	public boolean retrieveRewards(@RequestParam("userName") String userName, Model rewardEnable) throws ResourceNotFoundException {
		boolean reedemRewards = false;
		RegisterUserDetails rewardPoints = (RegisterUserDetails) studentService.loadUserByUsername(userName);
		if(rewardPoints != null) {
			throw new ResourceNotFoundException(userName);
		}
		if (rewardPoints.getRewpoints() == OFFER_POINTS) {
			reedemRewards = true;
		}
		rewardEnable.addAttribute("loadRewardPage", reedemRewards);
		return reedemRewards;

	}
	 
	/**
	 * Upload profile pic
	 * @param pic
	 * @param studentId
	 * @param model
	 * @return
	 * @throws JsonProcessingException
	 */
	
	@PostMapping(value = "/uploadImage",consumes = {"multipart/form-data"},
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ImageModel uploadMultiPartUpload(@RequestParam("pic") MultipartFile pic,
			@RequestParam("userId") Long studentId,Model model ) throws JsonProcessingException {
			System.out.println("upload user profile " + studentId );
			 if (pic != null && studentId != null) {
				ImageModel imageModel = new ImageModel();
				byte[] bytePic = null;
				try {
					bytePic = pic.getBytes();
				} catch (IOException e) {
					System.out.println(" Upload image Exception " + e.getMessage());
					e.printStackTrace();
				}			
	           
				imageModel.setPic(bytePic);
				imageModel.setStudentId(studentId);
				System.out.println( " multipart pic " + imageModel.getPic());
				return studentService.saveImage(imageModel);				
			} else {
				System.out.println( "Not able to find the user.... contact admin !!");
				return null;
			}
			
		
	}
	
	/**
	 * Fetch profile pic for user
	 * @param response
	 * @param id
	 * @return
	 * @throws Exception
	 */
	
	@GetMapping(value = "/getProfilePic")
	public ImageModel getStudentPhoto(@RequestParam("userId") long id) {
		Optional<ImageModel> studentId = imageRepository.findById(id);
		if(studentId.isPresent()) {
			return studentService.loadProfilePic(id);
		} else {
			return new ImageModel();
		}		
	}
	
	@PostMapping(value = "/redeemOffers")
	public String send(@RequestParam("emailId") String mailID,@RequestParam(value="offerTitle") String title) throws MessagingException {
		try {
			RegisterUserDetails registerUserDetails = registrationDao.findByEmail(mailID);
			String name = registerUserDetails.getFirstName().substring(0, 1).toUpperCase() + registerUserDetails.getFirstName().substring(1);
			mailSenderService.sendEmailToReddemOffer(mailID,adminEmail,name,title);
			return "Congratulations! Admin will reach you.";
		} catch (MailException mailException) {
			System.out.println(mailException);
			return mailException.getLocalizedMessage();
		}
		
	}
}
