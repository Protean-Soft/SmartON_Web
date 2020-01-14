package com.protean.student.StudentPortal.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.protean.student.StudentPortal.model.RegisterUserDetails;

@Repository
public interface RegistrationDao extends JpaRepository<RegisterUserDetails, Integer> {
	
	@Transactional
    @Modifying
    @Query(value = "UPDATE user_details SET rewpoints = :rewardPoints WHERE username = :userName",nativeQuery = true)
	void updateRewards(@Param("rewardPoints") Long rewardPoints, @Param("userName") String userName);

	
	public RegisterUserDetails findByUserName(String userName);
	
	public RegisterUserDetails findByEmail(String email);
	
	public RegisterUserDetails findByMobileNum(String mobilrnum);
	
	public RegisterUserDetails findByProfileID(String profileID);
	public RegisterUserDetails findByUserId(Long userId);

	@Transactional
    @Modifying
    @Query(value = "update user_details set noofevtallowed=:noofevnts where userid=:userId",nativeQuery = true)
	void updateNoofevent(@Param("noofevnts")Long noofevnts,@Param("userId") Long userId);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE user_details SET password =:password WHERE userId =:id", nativeQuery = true)
	void updatePassword(@Param("id") long userId, @Param("password") String password);
	
	
	@Transactional
	@Modifying
	@Query(value= "UPDATE user_details set firstname=:firstName,lastname=:lastName,username =:userName, mobile=:mobileNum,"
			+ "city =:city,state =:state where userId=:userId",nativeQuery=true)
	
	Integer updateUserDetails(@Param("userId") long userId,@Param("firstName") String firstName,@Param("lastName") String lastName,
			@Param("userName") String userName,@Param("mobileNum") String mobileNum,@Param("city") String city,@Param("state") 
	String state);

	@Transactional
    @Modifying
    @Query(value = "update user_details set password=:pwd where userid=:userid",nativeQuery = true)
	int UpdatePassword(Long userid, String pwd);

}
