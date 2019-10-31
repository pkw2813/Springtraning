package com.kh.finalProject.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.employee.model.service.EmployeeService;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.service.ProfessorService;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.service.StudentService;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class MemberController {
	
	@Autowired
	private StudentService stuService;
	@Autowired
	private EmployeeService empService;
	@Autowired 
	private ProfessorService proService;
	
	@RequestMapping("/login")
	public String Login() {
		return "common/login";
	}
	
	@RequestMapping("/login.hd")
	public String Login1(
			HttpSession session,
			HttpServletRequest req,
			@RequestParam(value="loginNo") String loginNo, 
			@RequestParam(value="loginId") String loginId, 
			@RequestParam(value="loginPwd") String loginPwd
			) {
		
		String msg="";
		String loc="/";
		System.out.println(loginId+"@@"+loginPwd);
		if(loginNo.equals("s")) {
			System.out.println("1");
			Student stu=stuService.selectOne(loginId,loginPwd);
			session.setAttribute("loginMember", stu);
		}else if(loginNo.equals("p")){
			System.out.println("2");
			Professor pro=proService.selectOne(loginId,loginPwd);
			session.setAttribute("loginMember", pro);
		}else{
			System.out.println("3");
			Employee emp=empService.selectOne(loginId,loginPwd);
			session.setAttribute("loginMember", emp);
		}
		System.out.println(session);
		if(session!=null) {
			msg="로그인 되었습니다.";
			loc="index.jsp";
		}else {
			msg="학/사번 또는 비밀번호를 확인해주세요.";
			loc="/";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "common/msg";
	}
	
	

}
