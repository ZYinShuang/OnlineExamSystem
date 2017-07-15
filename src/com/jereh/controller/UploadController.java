package com.jereh.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jereh.entity.Answer;
import com.jereh.entity.Option;
import com.jereh.entity.Problem;
import com.jereh.entity.User;
import com.jereh.service.SelectionService;
import com.jereh.service.ShortAnswerService;
import com.jereh.util.UploadExcleUtil;



@Controller
@RequestMapping("upload/")
public class UploadController {
	@Resource
	private UploadExcleUtil uploadExcleUtil;
	@Resource
	private SelectionService selectionService;
	@Resource
	private ShortAnswerService shortAnswerService;
	@Resource
	private Answer answer;
	@Resource
	private Option option;
	@Resource
	private Problem problem;
	@Resource
	private User user;
	//�ϴ���ѡ��
	@RequestMapping("file/single")	
	@Transactional
	public ModelAndView uploadSingle(HttpSession session,
						@RequestParam int s_course,
						@RequestParam int s_cStage,
			            @RequestParam MultipartFile file) 
			throws IllegalStateException, IOException{
		//����ļ���Ϊ��
		if(!file.isEmpty()) {
			//�ϴ��ķ�����·��
			String location=session.getServletContext()
					.getRealPath("upload");
			String path = location+"/"+
					System.currentTimeMillis()+
					file.getOriginalFilename();
			//System.out.println(path);
			file.transferTo(new File(path));
			
			List<String[]> rowList = uploadExcleUtil.start(path);
			for (int i = 0; i < rowList.size(); i++) {
				   String[] cell = rowList.get(i);
				   problem.setCid(s_course);
				   problem.setcStage(s_cStage);
				   problem.setType(1);//��ѡ��
				   problem.setShow(true);
				   problem.setTitle(cell[0]);
				   if(cell[0].equals("000000000")){
					   break;
				   }
				   cell[6] = cell[6].trim();
				   problem.setNycd((int)Double.parseDouble(cell[6]));
				   System.out.println(problem);
				   int pid =  selectionService.insertProblem(problem);
				   System.out.println(pid);
				   int anw = 0;
				   if(cell[7].trim().toUpperCase().equals("A")) {
					   anw = 1;
				   }else if(cell[7].trim().toUpperCase().equals("B")) {
					   anw = 2;
				   }else if(cell[7].trim().toUpperCase().equals("C")) {
					   anw = 3;
				   }else if(cell[7].trim().toUpperCase().equals("D")) {
					   anw = 4;
				   }else if(cell[7].trim().toUpperCase().equals("E")) {
					   anw = 5;
				   }
				   for(int j=1;j<=5;j++) {
					   if(cell[j].trim().equals("")) {
						   continue;
					   }
					   option.setPid(pid);
					   option.setOption(cell[j]);
					   if(anw==j) {
						   option.setAnw(true);
					   }else {
						   option.setAnw(false);
					   }
					   selectionService.insertOption(option);
				   }
				   answer.setPid(pid);
				   answer.setAnswer("");
				   answer.setRemark(cell[8]);
				   selectionService.insertAnswer(answer);
			}
		}
		ModelAndView mav=new ModelAndView("Question/ProblemUpload");
		mav.addObject("success", "单选题上传成功");
		return mav;
	}
	//�ϴ���ѡ��
	@RequestMapping("file/multi")		
	public ModelAndView uploadMulti(HttpSession session,
						@RequestParam int s_course,
						@RequestParam int s_cStage,
			            @RequestParam MultipartFile file) 
			throws IllegalStateException, IOException{
		//����ļ���Ϊ��
		if(!file.isEmpty()) {
			//�ϴ��ķ�����·��
			String location=session.getServletContext()
					.getRealPath("upload");
			String path = location+"/"+
					System.currentTimeMillis()+
					file.getOriginalFilename();
			//System.out.println(path);
			file.transferTo(new File(path));
			
			List<String[]> rowList = uploadExcleUtil.start(path);
			for (int i = 0; i < rowList.size(); i++) {
				String[] cell = rowList.get(i);
				   problem.setCid(s_course);
				   problem.setcStage(s_cStage);
				   problem.setType(2);//��ѡ��
				   problem.setShow(true);
				   problem.setTitle(cell[0]);
				   System.out.println(cell[6]);
				   cell[6] = cell[6].trim();
				   problem.setNycd((int)Double.parseDouble(cell[6]));
				   int pid =  selectionService.insertProblem(problem);
				   String anw = "";
				   if(cell[7].trim().toUpperCase().contains("A")) {
					   anw += 1;
				   }
				   if(cell[7].trim().toUpperCase().contains("B")) {
					   anw += 2;
				   }
				   if(cell[7].trim().toUpperCase().contains("C")) {
					   anw += 3;
				   }
				   if(cell[7].trim().toUpperCase().contains("D")) {
					   anw += 4;
				   }
				   if(cell[7].trim().toUpperCase().contains("E")) {
					   anw += 5;
				   }
				   for(int j=1;j<=5;j++) {
					   if(cell[j].trim().equals("")) {
						   continue;
					   }
					   option.setPid(pid);
					   option.setOption(cell[j]);
					   if(anw.contains(String.valueOf(j))) {
						   option.setAnw(true);
					   }else {
						   option.setAnw(false);
					   }
					   selectionService.insertOption(option);
				   }
				   answer.setPid(pid);
				   answer.setAnswer("");
				   answer.setRemark(cell[8]);
				   selectionService.insertAnswer(answer);	
			}
//			System.out.println("�ϴ��ɹ�");
		}
		ModelAndView mav=new ModelAndView("Question/ProblemUpload");
		mav.addObject("success", "多选题上传成功");
		return mav;
	}
	//�ϴ��ж���
	@RequestMapping("file/judge")		
	public ModelAndView uploadJudge(HttpSession session,
			@RequestParam int s_course,
			@RequestParam int s_cStage,
            @RequestParam MultipartFile file) 
            		throws IllegalStateException, IOException{
		//����ļ���Ϊ��
		if(!file.isEmpty()) {
			//�ϴ��ķ�����·��
			String location=session.getServletContext()
					.getRealPath("upload");
			String path = location+"/"+
					System.currentTimeMillis()+
					file.getOriginalFilename();
			//System.out.println(path);
			file.transferTo(new File(path));
			
			List<String[]> rowList = uploadExcleUtil.start(path);
			for (int i = 0; i < rowList.size(); i++) {
				String[] cell = rowList.get(i);
				   problem.setCid(s_course);
				   problem.setcStage(s_cStage);
				   problem.setType(3);//�ж���
				   problem.setShow(true);
				   problem.setTitle(cell[0]);
				   System.out.println(cell[0]);
				   if(cell[0].equals("0000")){
					   break;
				   }
				   cell[1] = cell[1].trim();
				   problem.setNycd((int)Double.parseDouble(cell[1]));
				   int pid =  selectionService.insertProblem(problem);
				   answer.setPid(pid);
				   answer.setAnswer(cell[2]);
				   answer.setRemark(cell[3]);
				   selectionService.insertAnswer(answer);	
			}
//			System.out.println("�ϴ��ɹ�");
		}
		ModelAndView mav=new ModelAndView("Question/ProblemUpload");
		mav.addObject("success", "判断题上传成功");
		return mav;
	}
	//�ϴ������
	@RequestMapping("file/fill")		
	public ModelAndView uploadFill(HttpSession session,
			@RequestParam int s_course,
			@RequestParam int s_cStage,
            @RequestParam MultipartFile file) 
            		throws IllegalStateException, IOException{
		//����ļ���Ϊ��
		if(!file.isEmpty()) {
			//�ϴ��ķ�����·��
			String location=session.getServletContext()
					.getRealPath("upload");
			String path = location+"/"+
					System.currentTimeMillis()+
					file.getOriginalFilename();
			System.out.println(path);
			file.transferTo(new File(path));
			
			List<String[]> rowList = uploadExcleUtil.start(path);
			for (int i = 0; i < rowList.size(); i++) {
				String[] cell = rowList.get(i);
				   problem.setCid(s_course);
				   problem.setcStage(s_cStage);
				   problem.setType(4);//�ж���
				   problem.setShow(true);
				   problem.setTitle(cell[0]);
				   System.out.println(cell[0]);
				   if(cell[0].equals("")){
					   break;
				   }
				   cell[1] = cell[1].trim();
				   problem.setNycd((int)Double.parseDouble(cell[1]));
				   int pid =  selectionService.insertProblem(problem);
				   answer.setPid(pid);
				   answer.setAnswer(cell[2]);
				   answer.setRemark(cell[3]);
				   selectionService.insertAnswer(answer);	
			}
//			System.out.println("�ϴ��ɹ�");
		}
		ModelAndView mav=new ModelAndView("Question/ProblemUpload");
		mav.addObject("success", "填空题上传成功");
		return mav;
	}
	//�ϴ������
	@RequestMapping("file/answer")		
	public ModelAndView uploadAnswer(HttpSession session,
			@RequestParam int s_course,
			@RequestParam int s_cStage,
            @RequestParam MultipartFile file) 
            		throws IllegalStateException, IOException{
		//����ļ���Ϊ��
		if(!file.isEmpty()) {
			//�ϴ��ķ�����·��
			String location=session.getServletContext()
					.getRealPath("upload");
			String path = location+"/"+
					System.currentTimeMillis()+
					file.getOriginalFilename();
			System.out.println(path);
			file.transferTo(new File(path));
			
			List<String[]> rowList = uploadExcleUtil.start(path);
			for (int i = 0; i < rowList.size()+1; i++) {
				String[] cell = rowList.get(i);
				   problem.setCid(s_course);
				   problem.setcStage(s_cStage);
				   problem.setType(5);//�ж���
				   problem.setShow(true);
				   problem.setTitle(cell[0]);
				   cell[1] = cell[1].trim();
				   problem.setNycd((int)Double.parseDouble(cell[1]));
				   int pid =  selectionService.insertProblem(problem);
				   answer.setPid(pid);
				   answer.setAnswer(cell[2]);
				   answer.setRemark(cell[3]);
				   selectionService.insertAnswer(answer);	
			}
//			System.out.println("�ϴ��ɹ�");
		}
		ModelAndView mav=new ModelAndView("Question/ProblemUpload");
		mav.addObject("success", "简答题上传成功");
		return mav;
	}
	
	@RequestMapping("file/upClass")
	public ModelAndView uploadClass(HttpSession session,
			@RequestParam MultipartFile fileClass) throws IllegalStateException, IOException{
		if(!fileClass.isEmpty()){
			
			String location = session.getServletContext().getRealPath("upload");
			String path = location+"/"+System.currentTimeMillis()+fileClass.getOriginalFilename();
			System.out.println(path);
			fileClass.transferTo(new File(path));
			List<String[]> rowList = uploadExcleUtil.start(path);
			for(int i=0;i<rowList.size();i++){
				String[] cell = rowList.get(i);
				
				user.setUsername(cell[0]);
				
				user.setPassword(cell[1]);
				user.setName(cell[2]);
				user.setIsclass(cell[5]);
				
//				user.setType((int)Double.parseDouble(cell[4]));
				System.out.println(cell[3]);
				System.out.println(cell[4]);
				if(cell[3].equals("1.0")){
					user.setType(1);
				}else if(cell[3].equals("2.0")){
					user.setType(2);
				}else if(cell[3].equals("3.0")){
					user.setType(3);
				}
				
				if(cell[4].equals("1.0")){
					user.setIs_show(true);
				}else if(cell[4].equals("0.0")){
					user.setIs_show(false);
				}
				
				
				selectionService.insertClass(user);
				
				
			}
			System.out.println("�ϴ��ɹ�");
			
			
		}
		ModelAndView mav=new ModelAndView("User/user");
		mav.addObject("success", "�ϴ��ɹ�");
		return mav;
		
		
	}
	
	
	
}
