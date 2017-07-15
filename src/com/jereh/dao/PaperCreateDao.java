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
	// ��ѯ��������
	public int selectCount();
	// ��ҳ������
	/*public List<PaperHead> selectPage(Map<String, Integer> map);*/
	List<PaperHead> selectPage(IsClass isClass);
	List<PaperHead> selectPageT(IsClass isClass);
	List<PaperHead> selectList(IsClass isClass);
	// ��ѯ�Ծ���Ϣ
	public PaperHead selectPaper(String paperId) ;
	// ��ѯ��������
	public List<PaperTest> selectTypeCt(String paperId);
	// ��ѯ�Ծ�ĵ�ѡ��Ͷ�ѡ��
	public List<PaperTest> selectSingleAndMuti(String paperId);
	// ��ѯ�Ծ���ж��⡢����⡢����
	public List<PaperTest> selectJFA(String paperId);
	
	// �������
	int insert(PaperHead paperHead);
	// �����Ծ��
	int insertAnswer(StudentAnswer studentAnswer);
	// �����Ŀ
	String selectProblem(PaperCallOption paperCallOption);
	// �������
	String calcPaper(String paperId);
	//���answer����
	int delScore(StudentAnswer studentAnswer);
	//���score����
	int delAnswer(StudentAnswer studentAnswer);
	
	//�����Ծ�
	int closePaper(String paperId);
	//�����Ծ�
	int openPaper(String paperId);
	
	//����ظ����
	int rePaper(String paperId,int studentId);
	
}
