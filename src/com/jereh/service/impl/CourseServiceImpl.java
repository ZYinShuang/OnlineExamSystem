package com.jereh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jereh.dao.CourseDao;
import com.jereh.entity.Course;
import com.jereh.entity.CourseStage;
import com.jereh.entity.Search;
import com.jereh.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Resource
	private CourseDao courseDao;

	@Override
	public List<Course> courseList() {
		// TODO Auto-generated method stub
		return courseDao.courseList();
	}

	@Override
	public List<CourseStage> courseStageList(int cid) {
		// TODO Auto-generated method stub
		return courseDao.courseStageList(cid);
	}

	@Override
	public List<Course> showCourseList(Search search) {
		// TODO Auto-generated method stub
		return courseDao.showCourseList(search);
	}

	@Override
	public List<CourseStage> showCourseStageList(int cid) {
		// TODO Auto-generated method stub
		return courseDao.showCourseStageList(cid);
	}
	
	@Override
	public int searchCount(Search search) {
		// TODO Auto-generated method stub
		return courseDao.searchCount(search);
	}

	@Override
	public int insertCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.insertCourse(course);
		return course.getId();
	}

	@Override
	public int insertCourseStage(CourseStage cStage) {
		// TODO Auto-generated method stub
		return courseDao.insertCourseStage(cStage);
	}

	@Override
	public int updateCourse(Course course) {
		// TODO Auto-generated method stub
		return courseDao.updateCourse(course);
	}

	@Override
	public int updateCourseStage(CourseStage cStage) {
		// TODO Auto-generated method stub
		return courseDao.updateCourseStage(cStage);
	}

	@Override
	public int delCourse(String[] id) {
		// TODO Auto-generated method stub
		return courseDao.delCourse(id);
	}

	@Override
	public int delCourseStage(String[] id) {
		// TODO Auto-generated method stub
		return courseDao.delCourseStage(id);
	}


}
