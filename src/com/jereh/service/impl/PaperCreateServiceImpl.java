package com.jereh.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jereh.dao.PaperCreateDao;
import com.jereh.entity.IsClass;
import com.jereh.entity.PaperCallOption;
import com.jereh.entity.PaperHead;
import com.jereh.entity.PaperTest;
import com.jereh.entity.StudentAnswer;
import com.jereh.entity.TJscore;
import com.jereh.service.PaperCreateService;

@Service
public class PaperCreateServiceImpl implements PaperCreateService {
	@Resource
	private PaperCreateDao paperCreateDao;
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return paperCreateDao.selectCount();
	}
	/*@Override
	public List<PaperHead> selectPage(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectPage(map);
	}*/
	
	@Override
	public List<PaperHead> selectPage(IsClass isClass) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectPage(isClass);
	}
	@Override
	public int insert(PaperHead paperHead) {
		// TODO Auto-generated method stub
		return paperCreateDao.insert(paperHead);
	}
	@Override
	public String selectProblem(PaperCallOption paperCallOption) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectProblem(paperCallOption);
	}
	@Override
	public PaperHead selectPaper(String paperId) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectPaper(paperId);
	}
	@Override
	public List<PaperTest> selectSingleAndMuti(String paperId) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectSingleAndMuti(paperId);
	}
	@Override
	public List<PaperTest> selectJFA(String paperId) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectJFA(paperId);
	}
	@Override
	public List<PaperTest> selectTypeCt(String paperId) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectTypeCt(paperId);
	}
	@Override
	public int insertAnswer(StudentAnswer studentAnswer) {
		// TODO Auto-generated method stub
		return paperCreateDao.insertAnswer(studentAnswer);
	}
	@Override
	public String calcPaper(String paperId) {
		// TODO Auto-generated method stub
		return paperCreateDao.calcPaper(paperId);
	}

	@Override
	public List<PaperHead> selectPageT(IsClass isClass) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectPageT(isClass);
	}

	@Override
	public int delScore(StudentAnswer studentAnswer) {
		// TODO Auto-generated method stub
		return paperCreateDao.delAnswer(studentAnswer);
	}

	@Override
	public int delAnswer(StudentAnswer studentAnswer) {
		// TODO Auto-generated method stub
		return paperCreateDao.delScore(studentAnswer);
	}

	@Override
	public int closePaper(String paperId) {
		// TODO Auto-generated method stub
		return paperCreateDao.closePaper(paperId);
	}

	@Override
	public int openPaper(String paperId) {
		// TODO Auto-generated method stub
		return paperCreateDao.openPaper(paperId);
	}

	@Override
	public List<PaperHead> selectList(IsClass isClass) {
		// TODO Auto-generated method stub
		return paperCreateDao.selectList(isClass);
	}

	@Override
	public int rePaper(String paperId, int studentId) {
		// TODO Auto-generated method stub
		return paperCreateDao.rePaper(paperId, studentId);
	}

	
	
	
}
