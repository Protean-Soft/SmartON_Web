package com.protean.student.StudentPortal.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.protean.student.StudentPortal.model.ImageModel;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.repository.ImageRepository;
import com.protean.student.StudentPortal.service.StudentUserDetailsService;

@RestController
@RequestMapping("tag/userProfile")
public class UserProfileController {

	private final static long OFFER_POINTS = 10000L;
	
	@Autowired
	StudentUserDetailsService studentService;
	
	@Autowired
	ImageRepository imageRepository;
	
	@Value("${file.upload-dir}")
	   private String uploadDirectory;
	

	@GetMapping(value="/userDetails",produces = MediaType.APPLICATION_JSON_VALUE)
	public RegisterUserDetails retrieveUserDetailsByName(@RequestAttribute("userName") String userName,Model model) {
		RegisterUserDetails userDetails = null;
		System.out.println("username " + userName);
		if (userName != null) {
			userDetails = (RegisterUserDetails) studentService.loadUserByUsername(userName);
		} else {
			System.out.println(" UserName mismatch ..... ");
		}
		model.addAttribute("userdetails",userDetails);
		System.out.println("retrieve user details :::: " + userDetails.getMobileNum());
		return userDetails;
	}

	@GetMapping("/retrieveUserRewards")
	public boolean retrieveRewards(@RequestAttribute("userName") String userName, Model rewardEnable) {
		boolean reedemRewards = false;
		RegisterUserDetails rewardPoints = (RegisterUserDetails) studentService.loadUserByUsername(userName);
		if (rewardPoints.getRewpoints() == OFFER_POINTS) {
			reedemRewards = true;
		}
		rewardEnable.addAttribute("loadRewardPage", reedemRewards);
		return reedemRewards;

	}

	/**@PostMapping("/uploadProfilePic")
	public String uploadProfilePic(@RequestAttribute("profileId") MultipartFile profileId,Long studentId,ImageModel imageModel) throws IOException {
		if (!profileId.isEmpty()) {
			try {
		    	imageModel = new ImageModel(studentId,profileId.getOriginalFilename(), profileId.getContentType(), profileId.getBytes());
		    	fileStorageServiceImpl.storeFile(imageModel);
		    	return "File uploaded successfully! -> filename = " + profileId.getOriginalFilename();
			} catch (	Exception e) {
				return "FAIL! Maybe You had uploaded the file before or the file's size > 500KB";
			}    
		} else {
			return "You failed to upload  because the file was empty.";
		}
	}*/
	
	/*
	 * @GetMapping("/profile/{id}") public ResponseEntity<byte[]>
	 * getFile(@PathVariable Long id) { Optional<ImageModel> fileOptional =
	 * imageRepository.findById(id);
	 * 
	 * if(fileOptional.isPresent()) { ImageModel file = fileOptional.get(); return
	 * ResponseEntity.ok() .header(HttpHeaders.CONTENT_DISPOSITION,
	 * "attachment; filename=\"" + file.getName() + "\"") .body(file.getPic()); }
	 * 
	 * return ResponseEntity.status(404).body(null); }
	 */
	
	
	@PostMapping("/uploadImage")
	public String uploadMultiPartUpload(@RequestParam("pic") MultipartFile pic,@RequestParam("id") Long studentId,
			 @Valid ImageModel imageModel) {
		
		System.out.println("pic " + pic);
		
		try {
			if (pic != null) {
				byte[] data = pic.getBytes();
				imageModel = new ImageModel(studentId,data);
				//imageModel.setPic(data);
				//imageModel.setStudentId(studentId);
				studentService.saveImage(imageModel);
				// imageRepository.save(imageModel);
				return "File uploaded successfully! -> filename = " + pic.getOriginalFilename();
			} else {
				return "Invalid image id!!!!";
			}
		} catch (Exception e) {
			return "FAIL! Maybe You had uploaded the file before or the file's size > 500KB";
		}
	}

}
