package com.protean.student.StudentPortal.model;

public class InvalidUserDetailsException extends Exception{
	private static final long serialVersionUID = 1L;

	public InvalidUserDetailsException(String message) {
		super(message);
	}
}
