package com.jereh.dao;

import java.util.List;
import java.util.Map;

import com.jereh.entity.IsClass;
import com.jereh.entity.PaperCallOption;
import com.jereh.entity.PaperHead;
import com.jereh.entity.PaperTest;
import com.jereh.entity.StudentAnswer;
import com.jereh.entity.TJscore;

public interface PaperCreateDao {
	// 查询数据条数
	public int selectCount();
	// 按页数查找
	/*public List<PaperHead> selectPage(Map<String, Integer> map);*/
	List<PaperHead> selectPage(IsClass isClass);
	List<PaperHead> selectPageT(IsClass isClass);
	List<PaperHead> selectList(IsClass isClass);
	// 查询试卷信息
	public PaperHead selectPaper(String paperId) ;
	// 查询题型数量
	public List<PaperTest> selectTypeCt(String paperId);
	// 查询试卷的单选题和多选题
	public List<PaperTest> selectSingleAndMuti(String paperId);
	// 查询试卷的判断题、填空题、简单题
	public List<PaperTest> selectJFA(String paperId);
	
	// 添加数据
	int insert(PaperHead paperHead);
	// 保存试卷答案
	int insertAnswer(StudentAnswer studentAnswer);
	// 添加题目
	String selectProblem(PaperCallOption paperCallOption);
	// 计算分数
	String calcPaper(String paperId);
	//清空answer数据
	int delScore(StudentAnswer studentAnswer);
	//清空score数据
	int delAnswer(StudentAnswer studentAnswer);
	
	//禁用试卷
	int closePaper(String paperId);
	//启用试卷
	int openPaper(String paperId);
	
	//检查重复答卷
	int rePaper(String paperId,int studentId);
	
}
