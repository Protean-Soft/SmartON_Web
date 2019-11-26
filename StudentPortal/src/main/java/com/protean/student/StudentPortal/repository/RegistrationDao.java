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
	@Query(value = "UPDATE user_details SET rewpoints = ( "
			+ "SELECT count(*) FROM user_details WHERE refcode=:profileID) WHERE ProfileID = :profileID", nativeQuery = true)

	void updateRewards(@Param("profileID") String profileID);

	public RegisterUserDetails findByUserName(String userName);

	public RegisterUserDetails findByEmail(String email);

	/**@Transactional
	@Modifying
	@Query(value = "SELECT userId FROM user_details WHERE email =:email", nativeQuery = true)
	public int getPersonByEmail(@Param("email") String email);*/

	@Transactional
	@Modifying
	@Query(value = "UPDATE user_details SET password =:password WHERE userId =:id", nativeQuery = true)
	void updatePassword(@Param("id") long userId, @Param("password") String password);

}
