package com.jereh.service;

import java.util.List;

import com.jereh.entity.Course;
import com.jereh.entity.CourseStage;
import com.jereh.entity.Search;

public interface CourseService {
	
	List<Course> courseList();
	
	List<CourseStage> courseStageList(int cid);
	
	List<Course> showCourseList(Search search);
	
	int searchCount(Search search);
	
	List<CourseStage> showCourseStageList(int cid);
	
	int insertCourse(Course course);
	
	int insertCourseStage(CourseStage cStage);
	
	int updateCourse(Course course);
	
	int updateCourseStage(CourseStage cStage);
	
	int delCourse(String[] id);
	
	int delCourseStage(String[] id);
	
}
