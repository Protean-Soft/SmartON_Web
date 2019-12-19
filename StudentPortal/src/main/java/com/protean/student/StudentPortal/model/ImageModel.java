package com.protean.student.StudentPortal.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_profile")
public class ImageModel {

	@Id
	private Long studentId;

	private byte[] pic;

	public Long getStudentId() {
		return studentId;
	}

	public byte[] getPic() {
		return pic;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public void setPic(byte[] pic) {
		this.pic = pic;
	}

}
