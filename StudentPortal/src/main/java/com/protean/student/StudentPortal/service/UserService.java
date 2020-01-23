package com.protean.student.StudentPortal.service;

import java.util.Optional;

import com.protean.student.StudentPortal.model.RegisterUserDetails;

public interface UserService {

	public Optional<RegisterUserDetails> findUserByResetToken(String resetToken);

	public void saveUser(RegisterUserDetails user);
}
