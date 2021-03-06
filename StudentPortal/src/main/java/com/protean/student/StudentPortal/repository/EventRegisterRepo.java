package com.protean.student.StudentPortal.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.protean.student.StudentPortal.model.EventRegister;

@Repository
public interface EventRegisterRepo extends JpaRepository<EventRegister, Long> {
	
	List<EventRegister> findAllByEventid(Long id);

	
	
	   @Transactional
	   @Modifying
	   @Query(value = "select * from event_register where fk_eventid=:eventid and deletedflag <>1 and iscancelled<>1",nativeQuery  = true)
	 List<EventRegister> getEventRegisterDetailsByEventId(@Param("eventid") Long id);


	   @Transactional
	   @Modifying
	   @Query(value = "select count(fk_eventid) from event_register where fk_eventid=:eventid and deletedflag <>1 and iscancelled<>1",nativeQuery  = true)
		int getnoofregistration(@Param("eventid") Long id);

	   long countByuserid(@Param("userid") Long id);


	   EventRegister findByEventidAndUserid(@Param("eventid") Long eventid,@Param("userid")Long userid);

	Long countByeventid(Long id);


	 @Transactional
	   @Modifying
	   @Query(value = "select fk_eventid from event_register where fk_userid=:userid and deletedflag <>1 and iscancelled<>1",nativeQuery  = true)
		List<Long> getEventRegisterEventByuserId(@Param("userid") Long userid);
	
	
	/*
	 * @Transactional
	 * 
	 * @Modifying
	 * 
	 * @Query(value =
	 * "update event_Details set deletedflag=1 where eventid = :eventid",nativeQuery
	 * = true) List<EventRegister> getEventRegisterDetailsByEventType(Long id);
	 */



}
