package com.kh.finalProject.student.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.student.model.service.StudentService1;
import com.kh.finalProject.student.model.vo.Student;


@Controller
public class StudentController1 {
	
	@Autowired
	private StudentService1 service;
		
	@RequestMapping("/student/studentInfo.hd")
	public String selectStudent(HttpSession session,Model m) {
		/* Student s=(Student)session.getAttribute("loginMember"); */
		String studentNo="SA0012019001";
		Student s=service.selectStudent(studentNo);
		m.addAttribute("student",s);
	
		return "student/studentInfo";
		
		
	}
	
	@RequestMapping("/student/studentInfoUpdate.hd")
	public String studentInfoUpdate(Model m) {
		String studentNo="SA0012019001";
		Student s=service.selectStudent(studentNo);
		m.addAttribute("student",s);
		return "student/studentInfoUpdate";
	}
	
	@RequestMapping(value = "/student/studentInfoUpdateEnd.hd",method=RequestMethod.POST)
	public String studentInfoUpdateEnd(HttpServletRequest req, Model m,@RequestParam(value="imgAttach",required=false) MultipartFile upFile) {
		
		
		Student s =new Student();
		String stuNo=req.getParameter("stuNo");
		String stuEmail=req.getParameter("stuEmail");
		String stuTel=req.getParameter("stuTel");
		String stuAddr=req.getParameter("stuAddr");
		String stuAccount=req.getParameter("stuAccount");
		String stuImgOriname=req.getParameter("imgAttach");
		s.setStuNo(stuNo);
		s.setStuEmail(stuEmail);
		s.setStuTel(stuTel);
		s.setStuAddr(stuAddr);
		s.setStuAccount(stuAccount);
		
		String saveDir=req.getSession().getServletContext().getRealPath("/resources/images/image");
		File dir=new File(saveDir);
		MultipartFile f= upFile;
	
			if(!upFile.isEmpty()) {
				//파일명 설정(renamed)
				String oriFileName=upFile.getOriginalFilename();
				//파일에서 확장자빼기
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				//rename 규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				//reName된 파일명으로 저장하기
				try {
					upFile.transferTo(new File(saveDir+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				s.setStuImgOriname(oriFileName);
				s.setStuImgRename(reName);
				
		
	}
	
	try {
		
		int result =service.studentInfoUpdate(s);
	}catch(Exception e) {
		//파일삭제로직.
		//에러메세지 출력로직!
		System.out.println("에러파일저장안됨");
		/*
		 * if(!list.isEmpty()) { for(Attachment a:list) 
		 * { File del=new File(saveDir+"/"+a.getRenamedFileName());
		 * del.delete(); } }
		 */
	}
	

	
		
		return "redirect:/student/studentInfo.hd";
		
	}
	
	
}
