package com.jereh.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jereh.entity.Course;
import com.jereh.entity.Score;
import com.jereh.entity.Search;
import com.jereh.entity.User;
import com.jereh.service.UserService;

@Controller
@RequestMapping("login/")
public class UserController {

	@Resource
	private UserService userService;

	@RequestMapping("admins")
	public String adminis(@Param("username") String username,
			@Param("password") String password, HttpSession session) {
		User user = userService
				.getUSerByUSernameAndPassword(username, password);
//		 System.out.println(user);
//		System.out.println("用户名"+username+",\n密码"+password);
		if (user == null) {
				
			session.setAttribute("error", "用户名或密码错误");
			return "redirect:/login.jsp";
		} else if (!user.isIs_show()) {
			session.setAttribute("error", "您的账号已被冻结");
			return "redirect:/login.jsp";
		} else {

			session.setAttribute("user", user);
//			System.out.println(user);
			return "redirect:/index.jsp";
		}
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		//System.out.println(request.getSession().getAttribute("user"));
		request.getSession().invalidate();
		//System.out.println(request.getSession().getAttribute("user"));
		return "redirect:/login.jsp";
	}

	// @RequestMapping("showUserList")
	// @ResponseBody
	// public List<User> showStudentList(){
	// //System.out.println(courseService.courseList());
	// //System.out.println(userService.showUserList());
	// return userService.showUserList();
	//
	// }

	@RequestMapping("submitUser")
	@ResponseBody
	public String submitSelection(@RequestParam(value = "id") int id,
			@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "type") int type,
			@RequestParam(value = "is_show") boolean is_show,
			@RequestParam(value = "isclass") String isclass) {

		User user = new User(id, username, password, type, name, is_show,isclass);
		 //System.out.println(isclass);
		int isCok = 0, isCSok = 0;
		if (id == 0) {
			// ����
			Search s = new Search(-1, -1, "", 4, "", 2,"");
			List<User> dateUser = userService.showUserList(s);
			//System.out.println(dateUser);
			// System.out.println(dateUser.get(0).getUsername());
			for (int i = 0; i < dateUser.size(); i++) {
				if (dateUser.get(i).getUsername().equals(username)) {
					return "sameUN";
				}
			}

			isCok = userService.insertUsers(user);// ������������
		} else {
			// �޸�
			isCok = userService.updateUsers(user);

		}
		// System.out.println(isCok);
		// System.out.println(isCSok);
		if (isCok > 0 && isCok > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping("delUserss")
	@ResponseBody
	public String delShortAnswer(@RequestParam(value = "arr[]") String[] arr) {
		int isCok = userService.deletUsers(arr);

		if (isCok > 0) {
			return "true";
		} else {
			return "false";
		}

	}

	@RequestMapping("searchUsers")
	@ResponseBody
	public Map<String, Object> searchShortAnswer(
			@RequestParam(value = "s_username", required = false, defaultValue = "") String s_username,
			@RequestParam(value = "s_isShow", required = false, defaultValue = "2") int s_isShow,
			@RequestParam(value = "s_name", required = false, defaultValue = "") String s_name,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "s_type", required = false, defaultValue = "4") int s_type,
			@RequestParam(value = "rows", required = false, defaultValue = "10") int rows,
			@RequestParam(value = "s_isclass", required = false, defaultValue = "") String s_isclass) {
		
		int startNumber = (page - 1) * rows;
		Search search = new Search(startNumber, rows, s_username, s_type,
				s_name, s_isShow,s_isclass);

		List<User> list = userService.showUserList(search);
		//System.out.println(list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", userService.searchCount(search));
		map.put("rows", list);
		// System.out.println(map.toString());
		return map;
	}

	@RequestMapping("changePWD")
	@ResponseBody
	public String changePWD(HttpServletRequest request, HttpSession session,
			
			@RequestParam(value = "password") String password,
			@RequestParam(value = "Upassword2") String Upassword2,
			@RequestParam(value = "Upassword") String Upassword) {
		
		
		List<User> list = new ArrayList<User>();
		list.add((User) request.getSession().getAttribute("user"));
		// ԭʼ����
		String pwd = list.get(0).getPassword();
		if (Upassword2 == null || Upassword == null || password == null
				|| password.equals("") || Upassword2.equals("")
				|| Upassword.equals("")) {

			return "bothnull";
		} else if (password.equals(pwd)) {

			if (Upassword2.equals(Upassword)) {
				String username = list.get(0).getUsername();
				User user1 = new User(username, Upassword);
				userService.changePWD(user1);
				
				return "ok";
				 
			} else {
				return "bothmis";
			}

		} else {

			return "ymis";
		}

	}
	
	
	//�����Ծ�ʱ�İ༶ѡ��
	
	@RequestMapping("showClass")
	@ResponseBody
	public List<User> courseList(){
		//System.out.println(courseService.courseList());
		List<User> list = userService.showClass();
		for(int i=0;i<list.size();i++){
			//System.out.println(list.get(i).getIsclass());
		}
		
		return userService.showClass();
		
	}
	
	

	//�����Ծ�ʱ����ʦѡ��
	
	@RequestMapping("showTeacher")
	@ResponseBody
	public List<User> showTeacher(){
		//System.out.println(courseService.courseList());
		List<User> list = userService.showTeacher();
		for(int i=0;i<list.size();i++){
			//System.out.println(list.get(i).getName());
		}
		
		return userService.showTeacher();
		
	}
	
	
/*	
	@RequestMapping("showScore")
	@ResponseBody
	public String showScore(){
		
		return "true";
	}*/
	
	
	@RequestMapping("checkPaper")
	@ResponseBody
	public List<Score> checkPaper(HttpServletRequest request,@RequestParam(value = "paperId" , required = false , defaultValue = "") String paperId){
		List<User> ulist = new ArrayList<User>();
		ulist.add((User) request.getSession().getAttribute("user"));
		int studentId = ulist.get(0).getId();
		//System.out.println(paperId);
		Score s = new Score(paperId.split(",")[0], studentId+"", 0, 0);
		
		List<Score> list = userService.checkPaper(s);
		
		//System.out.println(list);
		
		return list;
	}
	
	
	
}
