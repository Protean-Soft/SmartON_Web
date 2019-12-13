package com.protean.student.StudentPortal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="user_profile")
public class ImageModel {

	@Id
	private Long studentId;
	/*@Column(name="name")
	private String name;*/
	/*@Column(name="type")
	private String type;*/
	
	@Lob
	private byte[] pic;
	
	public ImageModel() {
		// TODO Auto-generated constructor stub
	}

	public ImageModel(Long studentId, byte[] pic) {
		super();
		this.studentId = studentId;
		this.pic = pic;
	}

	/*
	 * public ImageModel(Long studentId, String name, String type, byte[] pic) {
	 * super(); this.studentId = studentId; this.name = name; this.type = type;
	 * this.pic = pic; }
	 */

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}



	public void setPic(byte[] pic) {
		this.pic = pic;
	}
	
	

	
}
