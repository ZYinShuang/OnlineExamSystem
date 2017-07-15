package com.jereh.dao;

import java.util.List;

import com.jereh.entity.Answer;
import com.jereh.entity.Option;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.Selection;
import com.jereh.entity.User;

public interface SelectionDao {

	List<Selection> serchSelection(Search search);
	int searchCount(Search search);
	
	List<Option> serchOption(int pid);
	
	int insertProblem(Problem problem);
	
	int insertAnswer(Answer answer);
	
	int insertOption(Option option);
	
	int updateProblem(Problem problem);
	
	int updateAnswer(Answer answer);
	
	int updateOption(Option option);
	
	int delProblem(String[] str);
	
	int delAnswer(String[] str);
	
	int delOption(String[] str);
	
	int insertClass(User user);
	
}
