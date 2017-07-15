package com.jereh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jereh.entity.AllScore;
import com.jereh.entity.PaperHead;
import com.jereh.entity.PaperTest;
import com.jereh.entity.SearchPaper;
import com.jereh.entity.StudentScore;
import com.jereh.entity.TJscore;
import com.jereh.service.PaperCreateService;
import com.jereh.service.ScoreService;
@Controller
@RequestMapping("Exam/")
public class ExamController {
  @Resource
  private ScoreService scoreService;
  @Resource
  private PaperCreateService paperCreateService;
 
 /* @RequestMapping("scoreList")
  @ResponseBody
  public List<StudentScore> selectList(
		  @RequestParam( value="paperId",required=false) String paperId){
	  System.out.println(paperId);
	  List<StudentScore> list =scoreService.selectList(paperId);
	 // System.out.println(list.get(0).getStudentId());
	  return list;
  }*/
  
  
  @RequestMapping("searchScore")
  @ResponseBody
  public Map<String, Object>  searchScore(
		  @RequestParam( value="paperId",required=false) String paperId,
		  @RequestParam(value = "page", required = false, defaultValue = "1") int page,
		  @RequestParam(value = "rows", required = false, defaultValue = "10") int rows){
	  //System.out.println(paperId);
	  
	  int startNumber = (page - 1) * rows;
	  SearchPaper searchPaper = new SearchPaper(paperId, startNumber, rows);
	 
	  List<StudentScore> list =scoreService.selectList(searchPaper);
	 
	  Map<String,Object> map = new HashMap<String, Object>();
	  map.put("total", scoreService.searchCount());
	  map.put("rows", list);
	  int i = scoreService.searchCount();
	  return map;
  }
  
  
  
  
  
  
  
  @RequestMapping("studentPaper")
  @ResponseBody
  public List<PaperTest> selectStudentPaper(
		  @RequestParam String paperId,
		  @RequestParam String studentId,@RequestParam String studentName,HttpSession session){
	  Map<String,String> map = new HashMap<String,String>();
	  map.put("paperId", paperId);
	  map.put("studentId", studentId);
	  session.setAttribute("studentId", studentId);
	  session.setAttribute("paperId", paperId);
	  session.setAttribute("studentName", studentName);
	  PaperHead paperInfo      = paperCreateService.selectPaper(paperId);
	  List<PaperTest> listType = paperCreateService.selectTypeCt(paperId);
	  List<PaperTest> listJFA  = paperCreateService.selectJFA(paperId);
	  List<PaperTest> list     = scoreService.selectPagerJFA(map);
	  session.setAttribute("paperType", listType);
	  session.setAttribute("paperInfo", paperInfo);
	  session.setAttribute("listJFA", list);
	 
	  return list;
  }
  
  
  @RequestMapping("calcPaper")
  public String calcPaper(HttpServletRequest request){
	  String result = "";
	  String paperId = request.getParameter("paperId");
	  try {
		 result= paperCreateService.calcPaper(paperId);
	  }catch(Exception e){
		 result= e.getMessage(); 
	  }
	  return "Exam/PaperCheck";
  }
  
 
  @RequestMapping("insertTJ")
  public String insertTJ(@RequestParam(value = "sumfile") int fileScore,
		  @RequestParam(value = "sumshort") int shortScore,
		  HttpServletRequest request
		  ){
	  System.out.println("���"+fileScore);
	  System.out.println("���"+shortScore);
	  String studentId = (String) request.getSession().getAttribute("studentId");
	  String paperId = (String) request.getSession().getAttribute("paperId");
	 
	  TJscore tJscore = new TJscore(fileScore, shortScore, paperId, studentId);
	  String i = scoreService.selectTJ(tJscore);
	  if(i!=null){
		  scoreService.updateTJ(tJscore);
		  scoreService.updateTJ2(tJscore);
	  }else{
	 
	  scoreService.insertTJ(tJscore);
	  scoreService.insertTJ2(tJscore);
	  }
	  
	  return "Exam/PaperCheck";
	  //return "true";	
  }
  
  
  @RequestMapping("calAllScore")
  public String calAllScore(@RequestParam(value="arrsid[]") int[] arrsid,
			@RequestParam(value="arrpid[]") String[] arrpid,
			@RequestParam(value="allscore[]") int[] allscore){
	  
	  
	  
	for(int i=0;i<arrsid.length;i++){
	  AllScore aScore = new AllScore(arrsid[i], arrpid[i], allscore[i]);
	 // System.out.println(aScore);
	  Integer check = scoreService.selectAllScore(aScore);
	  //System.out.println(check);
	  if(check==null){
		  scoreService.calAllScore(aScore);
	  }else{
		  scoreService.updateAllScore(aScore);
	  }
	  
	}
	  return "Exam/PaperCheck";
  }
  
  
  
}
