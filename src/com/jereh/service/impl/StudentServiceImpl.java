package com.jereh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jereh.dao.StudentDao;
import com.jereh.dao.StudentScoreDao;
import com.jereh.entity.Course;
import com.jereh.entity.CourseStage;
import com.jereh.entity.Search;
import com.jereh.entity.Student;
import com.jereh.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Resource
	private StudentDao studentDao;

	@Override
	public List<Student> showStudentList() {
		// TODO Auto-generated method stub
		return studentDao.showStudentList();
	}

	@Override
	public int insertStudent(Student student) {
		// TODO Auto-generated method stub
		studentDao.insertStudent(student);
		return student.getId();
	}

	@Override
	public int delStudent(String[] id) {
		// TODO Auto-generated method stub
		return studentDao.delStudent(id);
	}

	

	@Override
	public int searchStudent(Search search) {
		// TODO Auto-generated method stub
		return studentDao.searchStudent(search);
	}

	@Override
	public int insertCourseStage(CourseStage cStage) {
		// TODO Auto-generated method stub
		return studentDao.insertCourseStage(cStage);
	}

	@Override
	public int updateStudent(Student student) {
		// TODO Auto-generated method stub
		return studentDao.updateStudent(student);
	}

	@Override
	public int updateCourseStage(CourseStage cStage) {
		// TODO Auto-generated method stub
		return studentDao.updateCourseStage(cStage);
	}

	@Override
	public List<CourseStage> showCourseStageList(int cid) {
		// TODO Auto-generated method stub
		return studentDao.showCourseStageList(cid);
	}

	
	
	}

	

	

	


