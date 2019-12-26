package com.protean.student.StudentPortal.exceptionhandler;

import static com.protean.student.StudentPortal.util.commonUtils.INVALID_USER_NAME;
import static com.protean.student.StudentPortal.util.commonUtils.INVALID_EMAIL_ID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.protean.student.StudentPortal.model.EmailNotFound;
import com.protean.student.StudentPortal.model.ExceptionResponse;
import com.protean.student.StudentPortal.model.InvalidUserDetailsException;
import com.protean.student.StudentPortal.model.ResourceNotFoundException;


@ControllerAdvice
public class ExceptionHandlerControllerAdvice extends ResponseEntityExceptionHandler{

	/**
	 * 
	 * @param hospitalNameException
	 * @return ResponseEntity object
	 */
	public final ResponseEntity<ExceptionResponse> buildResponseEntityForInvaliduserNameException(
			InvalidUserDetailsException hospitalNameException) {

		ExceptionResponse exceptionResponse = new ExceptionResponse(hospitalNameException.getMessage(),
				INVALID_USER_NAME);
		return new ResponseEntity<ExceptionResponse>(exceptionResponse, new HttpHeaders(), HttpStatus.NOT_FOUND);

	}
	
	public final ResponseEntity<ExceptionResponse> buildResponseEntityUserDetailsNotFoundException(
			ResourceNotFoundException userDetailsNotFound) {

		ExceptionResponse exceptionResponse = new ExceptionResponse(userDetailsNotFound.getMessage(),
				INVALID_USER_NAME);
		return new ResponseEntity<ExceptionResponse>(exceptionResponse, new HttpHeaders(), HttpStatus.NOT_FOUND);

	}
	
	public final ResponseEntity<ExceptionResponse> buildResponseEntityEmailNotFoundException(
			EmailNotFound emailNotFound) {

		ExceptionResponse exceptionResponse = new ExceptionResponse(emailNotFound.getMessage(),
				INVALID_EMAIL_ID);
		return new ResponseEntity<ExceptionResponse>(exceptionResponse, new HttpHeaders(), HttpStatus.NOT_FOUND);

	}
	
	
	 @ExceptionHandler(Exception.class)
	    public ResponseEntity<Object> handle(Exception exception, 
	                HttpServletRequest request, HttpServletResponse response) {
	        if (exception instanceof NullPointerException) {
	            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	        }
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }

}
