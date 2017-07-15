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

import com.jereh.entity.Course;
import com.jereh.entity.CourseStage;
import com.jereh.entity.Search;
import com.jereh.entity.Student;
import com.jereh.service.StudentService;


@Controller
@RequestMapping("student/")
public class StudentController {
	
	@Resource
	private StudentService studentService;
	
	@RequestMapping("showStudentList")
	@ResponseBody
	public List<Student> showStudentList(){
		//System.out.println(courseService.courseList());
		return studentService.showStudentList();
	}
	
	

	@RequestMapping("delStudent")
	@ResponseBody
	public String delShortAnswer(@RequestParam(value="arr[]" ) String[] arr){
		int isCok = studentService.delStudent(arr);
	
		if(isCok>0){
			return "true";
		}else{
			return "false";
		}

}
	
	
	@RequestMapping("searchStudent")
	@ResponseBody
	public Map<String, Object> searchShortAnswer(@RequestParam(value="s_title",required=false,defaultValue="") String s_title,
			@RequestParam(value="s_isShow",required=false,defaultValue="2") int s_isShow,
			@RequestParam(value="page",required=false,defaultValue="1") int page,
			@RequestParam(value="rows",required=false,defaultValue="10") int rows){
		
		int startNumber = (page-1)*rows;
		Search search = new Search(0, 0, s_title, 0, s_isShow, startNumber, rows, 0);
		List<Student> list = studentService.showStudentList();
		//System.out.println(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", studentService.searchStudent(search));
		map.put("rows", list);
		
		//System.out.println(map.toString());
		return map;
	}
	
	
	
	@RequestMapping("submitStudent")
	@ResponseBody
	public String submitSelection(@RequestParam(value="cid") int cid,
			@RequestParam(value="isShow") boolean isShow,
			@RequestParam(value="name") String course,
			@RequestParam(value="isShows[]") boolean[] isShows,
			@RequestParam(value="stage[]") String[] stage){
		
		Student student = new Student(cid, course, isShow);
		//System.out.println(student);
		//System.out.println(Arrays.toString(stage));
		//System.out.println(Arrays.toString(isShows));
		
		int isCok=0,isCSok=0;
		if(cid==0){
			isCok = studentService.insertStudent(student);//返回新增主键
			for (int i = 0; i < stage.length; i++) {
				CourseStage cStage = new CourseStage(0, isCok, stage[i], isShows[i]);
				int n = studentService.insertCourseStage(cStage);
				if(n>0)isCSok++;
			}
		}else{
			isCok = studentService.updateStudent(student);//返回影响行数
			String[] arr1 = {cid+""};
//			int m = studentService.delStudent(arr1);
//			for (int i = 0; i <stage.length ; i++) {
//				CourseStage cStage = new CourseStage(0, cid, stage[i], isShows[i]);
//				//int n = seService.updateOption(opt);
//				int n = studentService.insertCourseStage(cStage);
//				if(n>0&&m>0)isCSok++;
//			}
		}
		//System.out.println(isCok);
		//System.out.println(isCSok);
		if(isCok>0&&isCok>0){
			return "true";
		}else{
			return "false";
		}
	}
	
	

	@RequestMapping("showCourseStageList")
	@ResponseBody
	public List<CourseStage> showCourseStageList(@RequestParam(value="cid") int cid){
		return studentService.showCourseStageList(cid);
	}
	
	
	
}
