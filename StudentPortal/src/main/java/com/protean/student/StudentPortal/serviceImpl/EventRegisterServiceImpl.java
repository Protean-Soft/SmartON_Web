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
import com.protean.student.StudentPortal.service.EventRegisterService;

@Service
public class EventRegisterServiceImpl implements EventRegisterService{
	
	@Autowired
	private EventRegisterRepo eventRegister;
	
	@Autowired
	private RegistrationDao userdetails;
	
	public String addEventRegistrationDetail(EventRegister eventregister) {
		String responseMsg="";
		try {
		Long userId=eventregister.getUserid();
		
		  RegisterUserDetails userdetail=userdetails.findByUserId(userId);
		  System.out.println("local................."+userdetail.getNoofevtallowed());
		  
		 if(userdetail!=null &&userdetail.getNoofevtallowed()>0 ) {
			 Long noofevnts=userdetail.getNoofevtallowed()-1;
		 userdetails.updateNoofevent(noofevnts,userId);
		 eventRegister.save(eventregister);
		 responseMsg= "Registration success";
		 }else if(userdetail.getNoofevtallowed()==0) {
			 responseMsg="User Exceed the Limit";
		 }
		}catch (Exception e) {
			System.out.println("Exception in addEventRegistrationDetail::"+e);
			responseMsg="Error";
			e.printStackTrace();
		}
		return responseMsg;
		 
		 
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
