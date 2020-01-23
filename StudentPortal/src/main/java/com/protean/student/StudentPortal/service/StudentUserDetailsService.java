package com.protean.student.StudentPortal.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.protean.student.StudentPortal.model.ImageModel;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.repository.ImageRepository;
import com.protean.student.StudentPortal.repository.RegistrationDao;
import com.protean.student.StudentPortal.repository.StudentDao;

@Service
public class StudentUserDetailsService implements UserDetailsService,UserService {
	
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private RegistrationDao registerDao;
	
	@Autowired
	private ImageRepository imageRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		RegisterUserDetails userDetails = studentDao.findByUserName(username);
		if(userDetails == null)
			throw new UsernameNotFoundException("User name invalid");
		return new UserDetailsImpl(userDetails);
	}
	
	public RegisterUserDetails registerUser(RegisterUserDetails registerDetails) {
		registerDetails.setProfileID(GenarateProfileID(registerDetails));
		RegisterUserDetails reg=  registerDao.save(registerDetails);
		return reg;
	}
	
	public void updateRewards(Long rewardPoints, String userName) {
		registerDao.updateRewards(rewardPoints,userName);
	}
	
	public JSONObject registerValidityChecker(String userName,String email, String mobnum) {
		RegisterUserDetails registerDetails = registerDao.findByUserName(userName);
		RegisterUserDetails registerDetails1 = registerDao.findByEmail(email);
		RegisterUserDetails registerDetails2 = registerDao.findByMobileNum(mobnum);
		JSONObject jsObj = new JSONObject();
		if(registerDetails != null) {
			jsObj.put("userName", "invalid");
		}else {
			jsObj.put("userName", "valid");
		}
		if(registerDetails1 != null) {
			jsObj.put("email", "invalid");
		}else {
			jsObj.put("email", "valid");
		}
		if(registerDetails2 != null) {
			jsObj.put("mobnum", "invalid");
		}else {
			jsObj.put("mobnum", "valid");
		}
		return jsObj;
	}
	
	public RegisterUserDetails getByUserid(Long Userid) {
		RegisterUserDetails registerDetails = registerDao.findByUserId(Userid);
		/*
		 * RegisterUserDetails registerDetails1 = registerDao.findByEmail(email);
		 * JSONObject jsObj = new JSONObject(); if(registerDetails != null) {
		 * jsObj.put("userName", "invalid"); }else { jsObj.put("userName", "valid"); }
		 * if(registerDetails1 != null) { jsObj.put("email", "invalid"); }else {
		 * jsObj.put("email", "valid"); }
		 */
		return registerDetails;
	}
	
	public int updatePwd(Long Userid,String pwd) {
		int registerDetails = registerDao.UpdatePassword(Userid,pwd);
		/*
		 * RegisterUserDetails registerDetails1 = registerDao.findByEmail(email);
		 * JSONObject jsObj = new JSONObject(); if(registerDetails != null) {
		 * jsObj.put("userName", "invalid"); }else { jsObj.put("userName", "valid"); }
		 * if(registerDetails1 != null) { jsObj.put("email", "invalid"); }else {
		 * jsObj.put("email", "valid"); }
		 */
		return registerDetails;
	}
	
	
	
	public RegisterUserDetails getLogonDetails(String userName) {
		RegisterUserDetails regDetails = registerDao.findByUserName(userName);
		return regDetails;
	}
	
	public RegisterUserDetails forgotPassword(String email) {
		RegisterUserDetails registerDetails = registerDao.findByEmail(email);
		return registerDetails;
	}

	public String GenarateProfileID(RegisterUserDetails registerDetails) {
		String profileID="";
		Date dob = registerDetails.getUserDob();
		String name = registerDetails.getFirstName().substring(0,1).toUpperCase()+registerDetails.getLastName().substring(0,1).toUpperCase();
	    System.out.println(dob);
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String dobdate = formatter.format(dob);
	    profileID= registerDetails.getCity().substring(0,3).toUpperCase()+dobdate.substring(8,10)+ dobdate.substring(5,7)+dobdate.substring(2,4)+ name;

		return profileID;
		
	}
	
	public void updateUserDetails(RegisterUserDetails registerDetails) {
		registerDao.save(registerDetails);
	}
	
	public RegisterUserDetails getUserDetailsByMail(String email) {
		RegisterUserDetails registerDetails = registerDao.findByEmail(email);
		return registerDetails;
	}
	
	public RegisterUserDetails getUserDetailsByProfileId(String profileId) {
		return registerDao.findByProfileID(profileId);
	}
	
	
	/**
	 * update password
	 * 
	 * @param userDetails
	 */
	public void updateUserCredentials(RegisterUserDetails userDetails) {
		RegisterUserDetails studentId = registerDao.findByEmail(userDetails.getEmail());
		registerDao.updatePassword(studentId.getUserId(), userDetails.getPassword());		
	}
	
	public ImageModel saveImage(ImageModel model) {
		return imageRepository.save(model);		
	}

	public ImageModel loadProfilePic(Long studentId) {
		ImageModel studentPic =  imageRepository.findByStudentId(studentId);
		System.out.println("student pic : " + studentPic.getPic());
		return studentPic;
  	}
	
	
	public String validateUserdetails(RegisterUserDetails userDetails) {
	
		String msg="VALIDDATA";
		if(userDetails.getUserId()!=null ) {
		RegisterUserDetails studetails= registerDao.findByUserId(userDetails.getUserId());
		if(!studetails.getUserName().equalsIgnoreCase(userDetails.getUserName())) {
			RegisterUserDetails registerDetails = registerDao.findByUserName(userDetails.getUserName());
			if(registerDetails!=null)
				msg="INVALIDUSERNAME";
		}
		if(!studetails.getEmail().equalsIgnoreCase(userDetails.getEmail())){
			RegisterUserDetails registerDetails = registerDao.findByEmail(userDetails.getEmail());
			if(registerDetails!=null)
				msg="INVALIDEMAIL";
		}
		if(!studetails.getMobileNum().equalsIgnoreCase(userDetails.getMobileNum())) {
			RegisterUserDetails registerDetails = registerDao.findByMobileNum(userDetails.getMobileNum());
			if(registerDetails!=null)
				msg="INVALIDMOBNUM";		
		}
		
		}
		return msg;
		
	}
  	public Integer updateUserDetailsData(RegisterUserDetails updateUserDetails) {

		return registerDao.updateUserDetails(updateUserDetails.getUserId(), updateUserDetails.getFirstName(),
				updateUserDetails.getLastName(), updateUserDetails.getUserName(), updateUserDetails.getMobileNum(),
				updateUserDetails.getCity(), updateUserDetails.getState(),updateUserDetails.getCollege());
	}

	
	@Override
	public Optional<RegisterUserDetails> findUserByResetToken(String resetToken) {
		return registerDao.findByResetToken(resetToken);
	}

	@Override
	public void saveUser(RegisterUserDetails user) {
		registerDao.save(user);		
	}
	
}
