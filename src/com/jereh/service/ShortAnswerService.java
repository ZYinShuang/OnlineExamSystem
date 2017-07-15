package com.jereh.service;

import java.util.List;

import com.jereh.entity.Answer;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.ShortAnswer;
import com.jereh.entity.User;


public interface ShortAnswerService {
 
	int updateProblem(Problem problem);
	
	int updateAnswer(Answer answer);
	
	int insertProblem(Problem problem);
	
	int insertAnswer(Answer answer);
	
	int delProblem(String[] arr);
	
	int delAnswer(String[] arr);	
	
	List<ShortAnswer> serchShortAnswer(Search search);
	int searchCount(Search search);
	

	int insertClass(User user);
	
}
