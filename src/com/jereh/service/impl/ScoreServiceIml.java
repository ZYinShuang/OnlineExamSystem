package com.jereh.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jereh.dao.StudentScoreDao;
import com.jereh.entity.AllScore;
import com.jereh.entity.PaperTest;
import com.jereh.entity.SearchPaper;
import com.jereh.entity.StudentScore;
import com.jereh.entity.TJscore;
import com.jereh.service.ScoreService;
@Service
public class ScoreServiceIml implements ScoreService {
    @Resource
    private StudentScoreDao scoreDao;
	@Override
	public List<StudentScore> selectList(SearchPaper searchPaper) {
		// TODO Auto-generated method stub
		return scoreDao.selectList(searchPaper);
	}

	@Override
	public int searchCount() {
		// TODO Auto-generated method stub
		return scoreDao.searchCount();
	}

	@Override
	public int insertCourse(StudentScore studentScore) {
		// TODO Auto-generated method stub
		return scoreDao.insertCourse(studentScore);
	}

	@Override
	public int updateCourse(StudentScore studentScore) {
		// TODO Auto-generated method stub
		return scoreDao.updateCourse(studentScore);
	}

	@Override
	public List<PaperTest> selectPagerJFA(Map<String, String> map) {
		// TODO Auto-generated method stub
		return scoreDao.selectPagerJFA(map);
	}

	@Override
	public int updateTJ(TJscore tJscore) {
		// TODO Auto-generated method stub
		return scoreDao.updateTJ(tJscore);
	}

	@Override
	public int updateTJ2(TJscore tJscore) {
		// TODO Auto-generated method stub
		return scoreDao.updateTJ2(tJscore);
	}

	@Override
	public int calAllScore(AllScore aScore) {
		// TODO Auto-generated method stub
		return scoreDao.calAllScore(aScore);
	}

	@Override
	public Integer selectAllScore(AllScore aScore) {
		// TODO Auto-generated method stub
		return scoreDao.selectAllScore(aScore);
	}

	@Override
	public int updateAllScore(AllScore aScore) {
		// TODO Auto-generated method stub
		return scoreDao.updateAllScore(aScore);
	}

	@Override
	public String selectTJ(TJscore tJscore) {
		// TODO Auto-generated method stub
		return scoreDao.selectTJ(tJscore);
	}

	@Override
	public int insertTJ(TJscore tJscore) {
		// TODO Auto-generated method stub
		return scoreDao.insertTJ(tJscore);
	}

	@Override
	public int insertTJ2(TJscore tJscore) {
		// TODO Auto-generated method stub
		return scoreDao.insertTJ2(tJscore);
	}

}
