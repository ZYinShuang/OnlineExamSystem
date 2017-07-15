package com.jereh.service;

import java.util.ArrayList;
import java.util.List;

import com.jereh.entity.Score;
import com.jereh.entity.Search;
import com.jereh.entity.User;

public interface UserService {

	public int insertUsers(User user);
	
	public int deletUsers(String[] arr);
	
	public int updateUsers(User user);
	
	public ArrayList<User> searchUsers();
	
	public int searchCount(Search  search);
	
	public User getUSerByUSernameAndPassword(String username, String password);
	
	public List<User> showUserList(Search  search);
	//int searchUser(Search search);
	
	public int changePWD(User user);
	
	public List<User> showClass();
	
	public List<User> showTeacher();
	
	//�ɼ���ѯ
	public String showScore(String paperId,String username);
	
	//����ѧ���ź;�����ѯ����
	public List<Score> checkPaper(Score s);
}
