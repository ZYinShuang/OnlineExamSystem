package com.jereh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jereh.dao.ShortAnswerDao;
import com.jereh.entity.Answer;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.ShortAnswer;
import com.jereh.entity.User;
import com.jereh.service.ShortAnswerService;

@Service
public class ShortAnswerServiceImpl implements ShortAnswerService {

	@Resource
	private ShortAnswerDao saDao;
	
	
	@Override
	public int updateProblem(Problem problem) {
		// TODO Auto-generated method stub
		return saDao.updateProblem(problem);
	}

	@Override
	public int updateAnswer(Answer answer) {
		// TODO Auto-generated method stub
		return saDao.updateAnswer(answer);
	}

	@Override
	public int insertProblem(Problem problem) {
		// TODO Auto-generated method stub
		saDao.insertProblem(problem);
		return problem.getId();
	}

	@Override
	public int insertAnswer(Answer answer) {
		// TODO Auto-generated method stub
		saDao.insertAnswer(answer);
		return answer.getId();
	}

	@Override
	public int delProblem(String[] arr) {
		// TODO Auto-generated method stub
		return saDao.delProblem(arr);
	}

	@Override
	public int delAnswer(String[] arr) {
		// TODO Auto-generated method stub
		return saDao.delAnswer(arr);
	}

	@Override
	public List<ShortAnswer> serchShortAnswer(Search search) {
		// TODO Auto-generated method stub
		return saDao.serchShortAnswer(search);
	}

	@Override
	public int searchCount(Search search) {
		// TODO Auto-generated method stub
		return saDao.searchCount(search);
	}

	@Override
	public int insertClass(User user) {
		// TODO Auto-generated method stub
		return saDao.insertClass(user);
	}

	

	
	
}
