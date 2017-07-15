package com.jereh.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jereh.dao.UserDao;
import com.jereh.entity.Score;
import com.jereh.entity.Search;
import com.jereh.entity.User;
import com.jereh.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao userDao;

	

	

	@Override
	public ArrayList<User> searchUsers() {
		// TODO Auto-generated method stub
		return userDao.searchUsers();
	}

	

	@Override
	public User getUSerByUSernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return userDao.getUSerByUSernameAndPassword(username,password);
	}

	

	@Override
	public List<User> showUserList(Search  search) {
		// TODO Auto-generated method stub
		return userDao.showUserList(search);
	}

	

	@Override
	public int insertUsers(User user) {
		// TODO Auto-generated method stub
		return userDao.insertUsers(user);
	}

	@Override
	public int updateUsers(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUsers(user);
	}

	@Override
	public int deletUsers(String[] arr) {
		// TODO Auto-generated method stub
		return userDao.deletUsers(arr);
	}



	



	@Override
	public int searchCount(Search search) {
		// TODO Auto-generated method stub
		return userDao.searchCount(search);
	}



	@Override
	public int changePWD(User user) {
		// TODO Auto-generated method stub
		return userDao.changePWD(user);
	}



	@Override
	public List<User> showClass() {
		// TODO Auto-generated method stub
		return userDao.showClass();
	}



	@Override
	public List<User> showTeacher() {
		// TODO Auto-generated method stub
		return userDao.showTeacher();
	}



	@Override
	public String showScore(String paperId, String username) {
		// TODO Auto-generated method stub
		return userDao.showScore(paperId, username);
	}



	@Override
	public List<Score> checkPaper(Score s) {
		// TODO Auto-generated method stub
		return userDao.checkPaper(s);
	}






	


	

}
