package com.protean.student.StudentPortal.util;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class commonUtils {
	
	public static String INVALID_USER_NAME = "Invalid username";
	public static String USER_DETAILS_NOT_FOUND = "User details not available";
	public static String UPLOAD_FAILED = "User profile upload failed";

	
	public byte[] ConvertImagetoByte(MultipartFile image) {
		byte[] data=null;
		try {
			data = image.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
		
	}
	
	public Date ConvertStringtoByte(String date) {
		Date Changeddate=null;
		try {
			Changeddate=(Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return Changeddate;
		
	}
	
	public String Covertbase64(byte[] byteval) {
		
		String base64Image = Base64.getEncoder().encodeToString(byteval);
		//System.out.println("base64Image============"+base64Image);
		return base64Image;
		
	}


}
