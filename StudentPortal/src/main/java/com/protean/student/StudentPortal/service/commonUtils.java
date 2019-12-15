package com.protean.student.StudentPortal.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class commonUtils {

	
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


}
