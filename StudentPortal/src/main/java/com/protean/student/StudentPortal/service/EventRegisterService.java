package com.protean.student.StudentPortal.service;

import java.util.List;

import org.springframework.stereotype.Component;


import com.protean.student.StudentPortal.model.EventRegister;

@Component
public interface EventRegisterService {
	public List<EventRegister> getEventRegisterDetailsByEventId(Long id);

	public List<EventRegister> UpdateEventRegisterAttendence(List<EventRegister> evtregDetails);

	public String addEventRegistrationDetail(EventRegister eventregister);

	Long getnoofregistrationstudent(Long id);

	Long getnoofregistrationevent(Long id);

	List<Long> getEventRegisterEventByuserId(Long id); 

}
