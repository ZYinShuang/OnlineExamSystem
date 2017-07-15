package com.jereh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jereh.entity.Answer;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.ShortAnswer;
import com.jereh.service.ShortAnswerService;

@Controller
@RequestMapping("shortAnswer/")
public class ShortAnswerController {
	
	@Resource
	private ShortAnswerService saService;
	

	@RequestMapping("submitShortAnswer")
	@ResponseBody
	public String submitShortAnswer(@RequestParam(value="id") int id,
			@RequestParam(value="cid") int cid,
			@RequestParam(value="cStage") int cStage,
			@RequestParam(value="title") String title,
			@RequestParam(value="nycd") int nycd,
			@RequestParam(value="isShow") boolean isShow,
			@RequestParam(value="aid") int aid,
			@RequestParam(value="answer") String answer,
			@RequestParam(value="remark") String remark,
			@RequestParam(value="type") int type){
		
		Problem problem = new Problem(id, cid, cStage, title, type, nycd, isShow, 1);
		Answer anw = new Answer(aid, id, answer, remark);
		int isPok=0,isAok=0;
		if(id==0){
			isPok = saService.insertProblem(problem);//返回新增主键
			anw.setPid(isPok);
			isAok = saService.insertAnswer(anw);
		}else{
			isPok = saService.updateProblem(problem);//返回影响行数
			isAok = saService.updateAnswer(anw);//返回影响行数
		}
		//System.out.println(isPok+"////////"+isPok);
		if(isPok>0&&isAok>0){
			return "true";
		}else{
			return "false";
		}
	}
	
	
	@RequestMapping("delShortAnswer")
	@ResponseBody
	public String delShortAnswer(@RequestParam(value="arr[]" ) String[] arr){
		int isPok = saService.delProblem(arr);
		int isAok = saService.delAnswer(arr);
		if(isPok>0&&isAok>0){
			return "true";
		}else{
			return "false";
		}
	}
	
	@RequestMapping("searchShortAnswer")
	@ResponseBody
	public Map<String, Object> searchShortAnswer(@RequestParam(value="s_course",required=false,defaultValue="0") int s_course,
			@RequestParam(value="s_cStage",required=false,defaultValue="0") int s_cStage,
			@RequestParam(value="s_title",required=false,defaultValue="") String s_title,
			@RequestParam(value="s_nycd",required=false,defaultValue="0") int s_nycd,
			@RequestParam(value="s_isShow",required=false,defaultValue="2") int s_isShow,
			@RequestParam(value="page",required=false,defaultValue="1") int page,
			@RequestParam(value="rows",required=false,defaultValue="10") int rows,
			@RequestParam(value="type",required=true) int type){
		
		int startNumber = (page-1)*rows;
		Search search = new Search(s_course, s_cStage, s_title, s_nycd, s_isShow, startNumber, rows, type);
		List<ShortAnswer> list = saService.serchShortAnswer(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", saService.searchCount(search));
		map.put("rows", list);
		
		//System.out.println(map.toString());
		return map;
	}
	
	
	
	
	

}
