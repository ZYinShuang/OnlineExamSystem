package com.jereh.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jereh.entity.Answer;
import com.jereh.entity.Course;
import com.jereh.entity.CourseStage;
import com.jereh.entity.Option;
import com.jereh.entity.Problem;
import com.jereh.entity.Search;
import com.jereh.entity.Selection;

import com.jereh.service.CourseService;

@Controller
@RequestMapping("course/")
public class CourseController {

	@Resource
	private CourseService courseService;
	
	@RequestMapping("courseList")
	@ResponseBody
	public List<Course> courseList(){
		//System.out.println(courseService.courseList());
		List<Course> list = courseService.courseList();
		//System.out.println(list);
		return courseService.courseList();
	}
	
	@RequestMapping("courseStageList")
	@ResponseBody
	public List<CourseStage> courseStageList(@RequestParam(value="cid") int cid){
		//System.out.println(courseService.courseList());
		//System.out.println(cid);
		return courseService.courseStageList(cid);
	}

	
	@RequestMapping("showCourseStageList")
	@ResponseBody
	public List<CourseStage> showCourseStageList(@RequestParam(value="cid") int cid){
		return courseService.showCourseStageList(cid);
	}
	
	@RequestMapping("searchCourse")
	@ResponseBody
	public Map<String, Object> searchShortAnswer(@RequestParam(value="s_title",required=false,defaultValue="") String s_title,
			@RequestParam(value="s_isShow",required=false,defaultValue="2") int s_isShow,
			@RequestParam(value="page",required=false,defaultValue="1") int page,
			@RequestParam(value="rows",required=false,defaultValue="10") int rows){
		
		int startNumber = (page-1)*rows;
		Search search = new Search(0, 0, s_title, 0, s_isShow, startNumber, rows, 0);
		List<Course> list = courseService.showCourseList(search);
		//System.out.println(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", courseService.searchCount(search));
		map.put("rows", list);
		//System.out.println(map.toString());
		return map;
	}
	
	@RequestMapping("submitCourse")
	@ResponseBody
	public String submitSelection(@RequestParam(value="cid") int cid,
			@RequestParam(value="isShow") boolean isShow,
			@RequestParam(value="course") String course,
			@RequestParam(value="isShows[]") boolean[] isShows,
			@RequestParam(value="stage[]") String[] stage){
		
		Course cou = new Course(cid, course, isShow);
		//System.out.println(cou);
		//System.out.println(Arrays.toString(stage));
		//System.out.println(Arrays.toString(isShows));
		
		int isCok=0,isCSok=0;
		if(cid==0){
			isCok = courseService.insertCourse(cou);//返回新增主键
			for (int i = 0; i < stage.length; i++) {
				CourseStage cStage = new CourseStage(0, isCok, stage[i], isShows[i]);
				int n = courseService.insertCourseStage(cStage);
				if(n>0)isCSok++;
			}
		}else{
			isCok = courseService.updateCourse(cou);//返回影响行数
			String[] arr1 = {cid+""};
			int m = courseService.delCourseStage(arr1);
			for (int i = 0; i <stage.length ; i++) {
				CourseStage cStage = new CourseStage(0, cid, stage[i], isShows[i]);
				//int n = seService.updateOption(opt);
				int n = courseService.insertCourseStage(cStage);
				if(n>0&&m>0)isCSok++;
			}
		}
		//System.out.println(isCok);
		//System.out.println(isCSok);
		if(isCok>0&&isCSok==stage.length){
			return "true";
		}else{
			return "false";
		}
	}
	
	
	@RequestMapping("delCourse")
	@ResponseBody
	public String delShortAnswer(@RequestParam(value="arr[]" ) String[] arr){
		int isCok = courseService.delCourse(arr);
		int isCSok = courseService.delCourseStage(arr);
		if(isCok>0&&isCSok>0){
			return "true";
		}else{
			return "false";
		}
	}
	
	
	
	
	
	
	
}
