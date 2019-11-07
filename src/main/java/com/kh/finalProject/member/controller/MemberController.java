package com.kh.finalProject.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("/main.hd")
	public String main() {
		return "common/main";
	}
	
	@RequestMapping("login")
	public String login() {
		return "redirect:/index.jsp";
	}

	@RequestMapping(value="/login.hd", method=RequestMethod.POST)
	public String Login1(
			HttpSession session,
			HttpServletRequest req,
			@RequestParam(value="loginNo") String loginNo, 
			@RequestParam(value="loginId") String loginId, 
			@RequestParam(value="loginPwd") String loginPwd
			) {
		
		String msg="";
		String loc="";

		if(loginNo.equals("s")) {
			Student stu=stuService.selectOne(loginId,loginPwd);
			session.setAttribute("loginMember", stu);
		}else if(loginNo.equals("p")){
			Professor pro=proService.selectOne(loginId,loginPwd);
			session.setAttribute("loginMember", pro);
		}else{
			Employee emp=empService.selectOne(loginId,loginPwd);
			session.setAttribute("loginMember", emp);
		}
		if(session.getAttribute("loginMember")!=null) {
			msg="로그인 되었습니다.";
			loc="/main.hd";
		}else {
			msg="학/사번 또는 비밀번호를 확인해주세요.";
			loc="/";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/logout.hd")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	
	

}
