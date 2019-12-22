package com.protean.student.StudentPortal.serviceImpl;

import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.protean.student.StudentPortal.model.EventDetails;
import com.protean.student.StudentPortal.model.EventRegister;
import com.protean.student.StudentPortal.model.RegisterUserDetails;
import com.protean.student.StudentPortal.repository.EventRegisterRepo;
import com.protean.student.StudentPortal.repository.RegistrationDao;
import com.protean.student.StudentPortal.service.EventDetailsService;
import com.protean.student.StudentPortal.service.EventRegisterService;
import com.protean.student.StudentPortal.service.MailSenderService;

@Service
public class EventRegisterServiceImpl implements EventRegisterService{
	
	@Autowired
	private EventRegisterRepo eventRegister;
	
	@Autowired
	private RegistrationDao userdetails;
	
	@Autowired
	private EventDetailsService eventdetail;
	
	@Autowired
	MailSenderService mailSender;
	
	
	
	public String addEventRegistrationDetail(EventRegister eventregister) {
		String responseMsg="";
		Long deletedflag=(long) 0;
		try {
			
		Long userId=eventregister.getUserid();
		EventRegister evtreg=eventRegister.findByEventidAndUserid(eventregister.getEventid(),eventregister.getUserid());
		System.out.println(evtreg);
		if(evtreg==null) {
		  RegisterUserDetails userdetail=userdetails.findByUserId(userId);
		  System.out.println(userdetail);
		  System.out.println("local................."+userdetail.getNoofevtallowed());
		  
		 if(userdetail!=null &&userdetail.getNoofevtallowed()>0 &&userdetail.getNoofevtallowed()!=null  ) {
			 Long noofevnts=userdetail.getNoofevtallowed()-1;
		 userdetails.updateNoofevent(noofevnts,userId);
		 eventregister.setIscancelled(false);
		 eventregister.setDeletedflag(deletedflag);
		 
		 eventRegister.save(eventregister);
		EventDetails evtdet= eventdetail.getEventById(eventregister.getEventid());
		mailSender.sendEmailRegisterevent(userdetail,evtdet);
		 responseMsg= "Registration success";
		 }else if(userdetail.getNoofevtallowed()==0) {
			 responseMsg="UserExceedtheLimit";
		 }
		 }else {
			 responseMsg="Already Registed";
		 }
		}catch (Exception e) {
			System.out.println("Exception in addEventRegistrationDetail::"+e);
			responseMsg="Error";
			e.printStackTrace();
		}
		System.out.println("responseMsg............"+responseMsg);
		return responseMsg;
		 
		 
	}
	
	
	@Override
	public Long getnoofregistrationstudent(Long id) {
		System.out.println("========="+id);
		 
		return eventRegister.countByuserid(id);
		
	}
	
	@Override
	public Long getnoofregistrationevent(Long id) {
		System.out.println("========="+id);
		 
		return eventRegister.countByeventid(id);
		
	}

	@Override
	public List<EventRegister> getEventRegisterDetailsByEventId(Long id) {
		System.out.println("========="+id);
		return eventRegister.getEventRegisterDetailsByEventId(id);
		
	}
	@Override
	public List<EventRegister> UpdateEventRegisterAttendence(List<EventRegister> evtregDetail) {
		return eventRegister.saveAll(evtregDetail);
		// return "Saved successfully";
		
	}

	
	
	
	
}
