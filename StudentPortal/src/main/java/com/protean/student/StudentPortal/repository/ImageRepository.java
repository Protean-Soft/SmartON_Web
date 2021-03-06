package com.protean.student.StudentPortal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.protean.student.StudentPortal.model.ImageModel;

@Repository
public interface ImageRepository extends JpaRepository<ImageModel, Long>{

	//public ImageModel findByName(String name);

	public ImageModel findByStudentId(Long id);
}
