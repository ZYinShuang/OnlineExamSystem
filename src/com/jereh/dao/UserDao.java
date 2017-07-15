package com.jereh.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jereh.entity.Score;
import com.jereh.entity.Search;
import com.jereh.entity.User;

public interface UserDao {
	
	
public int insertUsers(User user);
	
	public int  deletUsers(String[] arr);
	
	public ArrayList<User> searchUsers();
	
	public int searchCount(Search  search);
	
	public User getUSerByUSernameAndPassword(String username, String password);
	
	public int updateUsers(User user);
	
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
