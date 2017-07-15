package com.jereh.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jereh.entity.IsClass;
import com.jereh.entity.PaperCallOption;
import com.jereh.entity.PaperHead;
import com.jereh.entity.PaperTest;
import com.jereh.entity.StudentAnswer;
import com.jereh.entity.User;
import com.jereh.service.PaperCreateService;


@Controller
@RequestMapping("paper/")
public class PaperCreateController {
	@Resource
	private PaperCreateService paperCreatService;
	@Resource
	private PaperCallOption paperCallOption;
	@Resource
	private StudentAnswer studentAnswer;
	@RequestMapping("searchPaper")
	@ResponseBody
	public Map<String, Object> searchShortAnswer(HttpServletRequest request,
			@RequestParam(value="page",required=false,defaultValue="1") int page,
			@RequestParam(value="rows",required=false,defaultValue="10") int rows){
		
		int from = (page-1)*rows ;
		Map<String,Integer> mapOption = new HashMap<String,Integer>();
		mapOption.put("from", from);
		mapOption.put("to", rows);
		
		List<User> userlist = new ArrayList<User>();
		userlist.add((User) request.getSession().getAttribute("user"));
		String isclass=userlist.get(0).getIsclass();
		String teacher = userlist.get(0).getName();
		int type = userlist.get(0).getType();
		//System.out.println(isclass);
		
		IsClass isClass = new IsClass(from, rows, isclass,teacher,type);
		
		List<PaperHead> list = paperCreatService.selectPage(isClass);
		System.out.println(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", paperCreatService.selectCount());
		map.put("rows", list);
		return map;
	}
	
	@RequestMapping("searchList")
	@ResponseBody
	public Map<String, Object> searchList(HttpServletRequest request,
			@RequestParam(value="page",required=false,defaultValue="1") int page,
			@RequestParam(value="rows",required=false,defaultValue="10") int rows){
		
		int from = (page-1)*rows ;
		Map<String,Integer> mapOption = new HashMap<String,Integer>();
		mapOption.put("from", from);
		mapOption.put("to", rows);
		
		List<User> userlist = new ArrayList<User>();
		userlist.add((User) request.getSession().getAttribute("user"));
		String isclass=userlist.get(0).getIsclass();
		String teacher = userlist.get(0).getName();
		int type = userlist.get(0).getType();
		//System.out.println(isclass);
		
		IsClass isClass = new IsClass(from, rows, isclass,teacher,type);
		
		List<PaperHead> list = paperCreatService.selectList(isClass);
		System.out.println(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", paperCreatService.selectCount());
		map.put("rows", list);
		return map;
	}
	
	
	@RequestMapping("export")
	public String export(@RequestParam String paperId,
						 @RequestParam String flag,
			     			HttpServletRequest resquest,
			     			HttpSession session) {
		PaperHead paperInfo     = paperCreatService.selectPaper(paperId);
		List<PaperTest> listType = paperCreatService.selectTypeCt(paperId);
		List<PaperTest> listSM  = paperCreatService.selectSingleAndMuti(paperId);
		List<PaperTest> listJFA = paperCreatService.selectJFA(paperId);
		session.setAttribute("paperType", listType);
		session.setAttribute("paperInfo", paperInfo);
		session.setAttribute("listSM", listSM);
		session.setAttribute("listJFA", listJFA);
		if(flag.equals("student")) {
			return "Exam/Exam";
		}else {
			return "Exam/testPaper";
		}
	}
	@RequestMapping("paperList")
	@ResponseBody
	public List<PaperHead> paperList(HttpServletRequest resquest) {
		Map<String,Integer> mapOption = new HashMap<String,Integer>();
		mapOption.put("from", 0);
		mapOption.put("to", Integer.MAX_VALUE);
		
		

		List<User> userlist = new ArrayList<User>();
		userlist.add((User) resquest.getSession().getAttribute("user"));
		int type=userlist.get(0).getType();
		String name = userlist.get(0).getName();
		
		IsClass isclass =new IsClass(0,Integer.MAX_VALUE ,type,name);
		List<PaperHead> headers =paperCreatService.selectPageT(isclass); 
		return headers;
	}
	
	
	
	
	
	@RequestMapping("paperSubmit")
	@Transactional
	public ModelAndView  paperSubmit(@RequestParam String paperId,
			                  HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		List<User> list = new ArrayList<User>();
		list.add((User) request.getSession().getAttribute("user"));
		int sid = list.get(0).getId();
		List<PaperTest> listSM  = paperCreatService.selectSingleAndMuti(paperId);
		List<PaperTest> listJFA = paperCreatService.selectJFA(paperId);
		
		studentAnswer.setStudentId(sid+"");
		studentAnswer.setPaperId(paperId);
		paperCreatService.delAnswer(studentAnswer);
		paperCreatService.delScore(studentAnswer);
		for (PaperTest paperTest : listSM) {
			int problemNo = paperTest.getPid();
			if(paperTest.getType()==1) {
				String sValue = request.getParameter("sOption_"+problemNo);
				if(sValue==null){
					studentAnswer.setProblemId(problemNo);
					studentAnswer.setAnswer("");
					
				}else{
				sValue = URLDecoder.decode(sValue, "utf-8");
				
				
				studentAnswer.setProblemId(problemNo);
				studentAnswer.setAnswer(sValue);
				}
				
				paperCreatService.insertAnswer(studentAnswer);
			}else if(paperTest.getType()==2) {
				studentAnswer.setPaperId(paperId);
				studentAnswer.setStudentId(sid+"");
				studentAnswer.setProblemId(problemNo);
				String sValue = "";
				for(int i=1;i<paperTest.getItem().length();i++) {
					String temp =request.getParameter("mOption_"+problemNo+"_"+i);
					if(temp==null||temp.equals(""))continue;
					sValue +="#@#"+URLDecoder.decode(temp,"utf-8");
				}
				studentAnswer.setAnswer(sValue);
				paperCreatService.insertAnswer(studentAnswer);
			}
		}
		for (PaperTest paperTest : listJFA) {
			int problemNo = paperTest.getPid();
			String sValue = request.getParameter("Option_"+problemNo);
			
			sValue = sValue.replace("<", "&lt;");
			sValue = sValue.replace(">", "&gt;");
			sValue = sValue.replace("\"", "\'");
			
			studentAnswer.setPaperId(paperId);
			studentAnswer.setStudentId(""+sid);
			studentAnswer.setProblemId(problemNo);
			studentAnswer.setAnswer(sValue);
			paperCreatService.insertAnswer(studentAnswer);
		}
		session.removeAttribute("paperType");
		session.removeAttribute("paperInfo");
		session.removeAttribute("listSM");
		session.removeAttribute("listJFA");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Exam/ExamStart");
		mv.addObject("examAnswer", "试卷提交成功");
		return mv;
	}
	//添加数据
	@RequestMapping("insert")
	@Transactional
	@ResponseBody
	public String  insert(@RequestBody PaperHead paperHead) {
		paperHead.setClassId("");
		
		paperCallOption.setIsclass(paperHead.getIsclass());
		paperCallOption.setName(paperHead.getName());
		paperCallOption.setPaperId(paperHead.getPaperId());
		//System.out.println(paperHead.getName());
		paperCallOption.setCourseId(paperHead.getCourseId());
		paperCallOption.setCourseStage(paperHead.getCourseStage());
		paperCallOption.setpType(1);//单选题
		paperCallOption.setNd_e_number(paperHead.getS_eCount());
		paperCallOption.setNd_m_number(paperHead.getS_mCount());
		paperCallOption.setNd_d_number(paperHead.getS_dCount());
		paperCallOption.setPoint(paperHead.getSinglePoint());
		paperCreatService.selectProblem(paperCallOption);
		paperCallOption.setpType(2);//多选题
		paperCallOption.setNd_e_number(paperHead.getM_eCount());
		paperCallOption.setNd_m_number(paperHead.getM_mCount());
		paperCallOption.setNd_d_number(paperHead.getM_dCount());
		paperCallOption.setPoint(paperHead.getMultPoint());
		paperCreatService.selectProblem(paperCallOption);
		paperCallOption.setpType(3);//判断题
		paperCallOption.setNd_e_number(paperHead.getJ_eCount());
		paperCallOption.setNd_m_number(paperHead.getJ_mCount());
		paperCallOption.setNd_d_number(paperHead.getJ_dCount());
		paperCallOption.setPoint(paperHead.getJudgePoint());
		paperCreatService.selectProblem(paperCallOption);
		paperCallOption.setpType(4);//填空题
		paperCallOption.setNd_e_number(paperHead.getF_eCount());
		paperCallOption.setNd_m_number(paperHead.getF_mCount());
		paperCallOption.setNd_d_number(paperHead.getF_dCount());
		paperCallOption.setPoint(paperHead.getFillPoint());
		paperCreatService.selectProblem(paperCallOption);
		paperCallOption.setpType(5);//问答题
		paperCallOption.setNd_e_number(paperHead.getA_eCount());
		paperCallOption.setNd_m_number(paperHead.getA_mCount());
		paperCallOption.setNd_d_number(paperHead.getA_dCount());
		paperCallOption.setPoint(paperHead.getAnswerPoint());
		paperCreatService.selectProblem(paperCallOption);
		int resultStudent = paperCreatService.insert(paperHead);
		if(resultStudent>0){
			return "true";
		}else{
			return "false";
		}
		
	}
	
	@RequestMapping("setState")
	@ResponseBody
	public String closePaper(@RequestParam(value="arrpaperId[]") String[] arrpaperId){
		for(int i=0;i<arrpaperId.length;i++){
			String paperId = arrpaperId[i];
		//System.out.println(paperId);
		paperCreatService.closePaper(paperId);
		}
		return "Exam/PaperList";
	}
	

	@RequestMapping("setStateOpen")
	@ResponseBody
	public String openPaper(@RequestParam(value="arrpaperId[]") String[] arrpaperId){
		for(int i=0;i<arrpaperId.length;i++){
			String paperId = arrpaperId[i];
		//System.out.println(paperId);
		paperCreatService.openPaper(paperId);
		}
		return "Exam/PaperList";
	}
	
	
	
	@RequestMapping("rePaper")
	@ResponseBody
	public int rePaper(@RequestParam(value="arr[]") String[] arrpaperId,HttpServletRequest request){
		List<User> list = new ArrayList<User>();
		int mark = 1;
		list.add((User) request.getSession().getAttribute("user"));
		int studentId = list.get(0).getId();
		for(int i=0;i<arrpaperId.length;i++){
			String paperId = arrpaperId[0];
		 mark =	paperCreatService.rePaper(paperId,studentId);
		}
		if(mark!=0){
		return 1;
		}else{
			return 0;
		}
	}
	
	
	
}
