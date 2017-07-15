package com.jereh.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jereh.entity.Answer;
import com.jereh.entity.Option;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.Selection;
import com.jereh.service.SelectionService;

@Controller
@RequestMapping("selection/")
public class SelectionController {

	@Resource
	private SelectionService seService;
	
	@RequestMapping("searchSelection")
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
		List<Selection> list = seService.serchSelection(search);
		//System.out.println(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", seService.searchCount(search));
		map.put("rows", list);
		
		//System.out.println(map.toString());
		return map;
	}
	
	@RequestMapping("searchOption")
	@ResponseBody
	public List<Option> searchOption(@RequestParam(value="pid") int pid){
		return seService.serchOption(pid);
	}
	
	@RequestMapping("submitSelection")
	@ResponseBody
	public String submitSelection(@RequestParam(value="id") int id,
			@RequestParam(value="cid") int cid,
			@RequestParam(value="cStage") int cStage,
			@RequestParam(value="title") String title,
			@RequestParam(value="nycd") int nycd,
			@RequestParam(value="isShow") boolean isShow,
			@RequestParam(value="aid") int aid,
			@RequestParam(value="remark") String remark,
			@RequestParam(value="anwArr[]") boolean[] anwArr,
			@RequestParam(value="optArr[]") String[] optArr,
			@RequestParam(value="optIdArr[]") int[] optIdArr,
			@RequestParam(value="anwNum") int anwNum,
			@RequestParam(value="type") int type){
		
		Problem problem = new Problem(id, cid, cStage, title, type, nycd, isShow, anwNum);
		Answer anw = new Answer(aid, id, "", remark);
		
		int isPok=0,isAok=0,isOok=0;
		if(id==0){
			isPok = seService.insertProblem(problem);//返回新增主键
			anw.setPid(isPok);
			isAok = seService.insertAnswer(anw);
			for (int i = 0; i < optArr.length; i++) {
				Option opt = new Option(optIdArr[i], isPok, optArr[i], anwArr[i]);
				int n = seService.insertOption(opt);
				if(n>0)isOok++;
			}
		}else{
			isPok = seService.updateProblem(problem);//返回影响行数
			isAok = seService.updateAnswer(anw);//返回影响行数
			String[] arr1 = {id+""};
			int m = seService.delOption(arr1);
			for (int i = optArr.length-1; i >=0 ; i--) {
				Option opt = new Option(optIdArr[i], id, optArr[i], anwArr[i]);
				//int n = seService.updateOption(opt);
				int n = seService.insertOption(opt);
				if(n>0&&m>0)isOok++;
			}
		}
		
		if(isPok>0&&isAok>0&&isOok==optArr.length){
			return "true";
		}else{
			return "false";
		}
	}
	
	
	@RequestMapping("delSelection")
	@ResponseBody
	public String delShortAnswer(@RequestParam(value="arr[]" ) String[] arr){
		int isPok = seService.delProblem(arr);
		int isAok = seService.delAnswer(arr);
		int isOok = seService.delOption(arr);
		if(isPok>0&&isAok>0&&isOok>0){
			return "true";
		}else{
			return "false";
		}
	}
	
	
	
	
	
	
	
}
