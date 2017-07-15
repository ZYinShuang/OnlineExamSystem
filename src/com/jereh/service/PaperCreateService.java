package com.jereh.service;

import java.util.List;

import com.jereh.entity.IsClass;
import com.jereh.entity.PaperCallOption;
import com.jereh.entity.PaperHead;
import com.jereh.entity.PaperTest;
import com.jereh.entity.StudentAnswer;
import com.jereh.entity.TJscore;


public interface PaperCreateService {
	    // 查询页数
		int selectCount();
		// 按页查询
		/*List<PaperHead> selectPage(Map<String, Integer> map);*/
		List<PaperHead> selectPage(IsClass isClass);
		List<PaperHead> selectPageT(IsClass isClass);
		List<PaperHead> selectList(IsClass isClass);
		// 添加数据
		int insert(PaperHead paperHead);
		// 保存试卷答案
		int insertAnswer(StudentAnswer studentAnswer);
		// 添加题
		String selectProblem(PaperCallOption paperHead);
		// 查询题型数量
		public List<PaperTest> selectTypeCt(String paperId);
		// 查询试卷信息
		public PaperHead selectPaper(String paperId) ;
		// 查询试卷的单选题和多选题
		public List<PaperTest> selectSingleAndMuti(String paperId);
		// 查询试卷的判断题、填空题、简单题
		public List<PaperTest> selectJFA(String paperId);
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
