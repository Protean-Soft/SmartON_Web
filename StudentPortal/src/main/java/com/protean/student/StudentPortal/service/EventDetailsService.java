package com.protean.student.StudentPortal.service;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import com.protean.student.StudentPortal.model.EventDetails;

@Component
public interface EventDetailsService {
	
	public String addEvent(List<EventDetails> student);

	public EventDetails getEventById(Long id);

	public List<EventDetails> getAllEvents();
	


	public EventDetails updateEventDetails(EventDetails eventDetails);

	public void delete(Long id);

	public EventDetails addEventDetail(EventDetails eventdetails);
	
	public int deleteEventDetail(Long eventid);

	
	

	
	  public List<EventDetails> getOngoingEventsByCatogery(String catogery, String
	  type);

	List<EventDetails> findAllByDeletedflag();

	public String addEventDetailUpdate(@Valid EventDetails eventdetails);

	
	 


}
