package com.jereh.service;

import java.util.List;

import com.jereh.entity.Course;
import com.jereh.entity.CourseStage;
import com.jereh.entity.Search;
import com.jereh.entity.Student;

public interface StudentService {
	
	List<Student> showStudentList();
	
	int insertStudent(Student student);
	
	int delStudent(String[] str);
	
	int searchStudent(Search search);
	
	
	
	
	
	int insertCourseStage(CourseStage cStage);
	int updateStudent(Student student);
	int updateCourseStage(CourseStage cStage);

	List<CourseStage> showCourseStageList(int cid);
}
