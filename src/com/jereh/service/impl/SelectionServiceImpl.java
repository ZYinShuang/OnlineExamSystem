package com.jereh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jereh.dao.SelectionDao;
import com.jereh.entity.Answer;
import com.jereh.entity.Option;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.Selection;
import com.jereh.entity.User;
import com.jereh.service.SelectionService;

@Service
public class SelectionServiceImpl implements SelectionService {

	@Resource
	private SelectionDao sDao;

	@Override
	public List<Selection> serchSelection(Search search) {
		// TODO Auto-generated method stub
		return sDao.serchSelection(search);
	}

	@Override
	public int searchCount(Search search) {
		// TODO Auto-generated method stub
		return sDao.searchCount(search);
	}

	@Override
	public List<Option> serchOption(int pid) {
		// TODO Auto-generated method stub
		return sDao.serchOption(pid);
	}

	@Override
	public int insertProblem(Problem problem) {
		// TODO Auto-generated method stub
		sDao.insertProblem(problem);
		return problem.getId();
	}

	@Override
	public int insertAnswer(Answer answer) {
		// TODO Auto-generated method stub
		return sDao.insertAnswer(answer);
	}

	@Override
	public int insertOption(Option option) {
		// TODO Auto-generated method stub
		return sDao.insertOption(option);
	}

	@Override
	public int updateProblem(Problem problem) {
		// TODO Auto-generated method stub
		return sDao.updateProblem(problem);
	}

	@Override
	public int updateAnswer(Answer answer) {
		// TODO Auto-generated method stub
		return sDao.updateAnswer(answer);
	}

	@Override
	public int updateOption(Option option) {
		// TODO Auto-generated method stub
		return sDao.updateOption(option);
	}

	@Override
	public int delProblem(String[] str) {
		// TODO Auto-generated method stub
		return sDao.delProblem(str);
	}

	@Override
	public int delAnswer(String[] str) {
		// TODO Auto-generated method stub
		return sDao.delAnswer(str);
	}

	@Override
	public int delOption(String[] str) {
		// TODO Auto-generated method stub
		return sDao.delOption(str);
	}

	@Override
	public int insertClass(User user) {
		// TODO Auto-generated method stub
		return sDao.insertClass(user);
	}

	
	
	
}
