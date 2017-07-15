package com.jereh.dao;

import java.util.List;

import com.jereh.entity.Answer;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.ShortAnswer;
import com.jereh.entity.User;

public interface ShortAnswerDao {
	
	int updateProblem(Problem problem);
	
	int updateAnswer(Answer answer);
	
	int insertProblem(Problem problem);
	
	int insertAnswer(Answer answer);
	
	int delProblem(String[] str);
	
	int delAnswer(String[] str);
	
	List<ShortAnswer> serchShortAnswer(Search search);
	int searchCount(Search search);
	
	
	int insertClass(User user);
	
}
