package com.jereh.service;

import java.util.List;
import java.util.Map;

import com.jereh.entity.AllScore;
import com.jereh.entity.PaperTest;
import com.jereh.entity.SearchPaper;
import com.jereh.entity.StudentScore;
import com.jereh.entity.TJscore;

public interface ScoreService {
	List<StudentScore> selectList(SearchPaper searchPaper);
	List<PaperTest> selectPagerJFA(Map<String,String> map);
	int searchCount();
	int insertCourse(StudentScore studentScore);
	int updateCourse(StudentScore studentScore);
	
	//添加填空简答分数
	int updateTJ(TJscore tJscore);
	int updateTJ2(TJscore tJscore);
	//查询填空简答
		String selectTJ(TJscore tJscore);
		//添加填空加拿大
		int insertTJ(TJscore tJscore);
		int insertTJ2(TJscore tJscore);
	//计算总分数
	int calAllScore(AllScore aScore);
	//查询是否存在总分项
	Integer selectAllScore(AllScore aScore);
	//更新存在的总分项
	int updateAllScore(AllScore aScore);
	
	
		
}
