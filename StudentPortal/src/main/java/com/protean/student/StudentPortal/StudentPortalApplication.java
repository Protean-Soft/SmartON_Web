package com.protean.student.StudentPortal;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication      
//@ComponentScan({"com.protean.student.StudentPortal.controller","controller"})
public class StudentPortalApplication extends SpringBootServletInitializer {
	private static final Logger logger = LogManager.getLogger(StudentPortalApplication.class);
	
	 @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	        return application.sources(StudentPortalApplication.class);
	    }
	public static void main(String[] args) {
		//new File(EventDetailsController.uploadDirectory).mkdir);
		logger.info(" Student portal application started !!! ");
		SpringApplication.run(StudentPortalApplication.class, args);
	}

}
