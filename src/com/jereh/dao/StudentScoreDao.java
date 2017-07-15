package com.jereh.dao;

import java.util.List;
import java.util.Map;

import com.jereh.entity.AllScore;
import com.jereh.entity.PaperTest;
import com.jereh.entity.SearchPaper;
import com.jereh.entity.StudentScore;
import com.jereh.entity.TJscore;

public interface StudentScoreDao {
	List<StudentScore> selectList(SearchPaper searchPaper);
	List<PaperTest> selectPagerJFA(Map<String,String> map);
	int searchCount();
	int insertCourse(StudentScore studentScore);
	int updateCourse(StudentScore studentScore);
	
	
	//��xin��ռ�����
	int updateTJ(TJscore tJscore);
	int updateTJ2(TJscore tJscore);
	//��ѯ��ռ��
	String selectTJ(TJscore tJscore);
	//�����ռ��ô�
	int insertTJ(TJscore tJscore);
	int insertTJ2(TJscore tJscore);
	//�����ܷ���
	int calAllScore(AllScore aScore);
	//��ѯ�Ƿ�����ܷ���
	Integer selectAllScore(AllScore aScore);
	//���´��ڵ��ܷ���
	int updateAllScore(AllScore aScore);
	
	
}
