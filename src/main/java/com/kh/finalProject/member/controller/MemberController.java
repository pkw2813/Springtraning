package com.kh.finalProject.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.email.controller.MailController;
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
	@Autowired
	private MailController mc;
	
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
	
	@RequestMapping("/stuIdSearch.hd")
	public String stuIdSearch(Student s, @RequestParam String loginNo, HttpServletRequest req,Model model,
			@RequestParam String searchName,
			@RequestParam String searchEmail
			) {
		StringBuilder sb = new StringBuilder();
		String msg="";
		String loc="/";
		Map map=new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchEmail", searchEmail);
		if(loginNo.equals("s")) {
			Student stu=stuService.stuIdSearch(s);
			if(stu!=null) {
				if(stu.getStuName().equals(s.getStuName())&&stu.getStuEmail().equals(s.getStuEmail())) {
					sb.append("귀하의 학번은 "+ stu.getStuNo() + "입니다.");
					mc.forSendEmail(s.getStuEmail(),"학번 안내입니다." , sb.toString(), req);
					msg="메일로 학번을 전송하였습니다.";
				}else {
					msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
				}
			}else {
				msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
			}
		}else{
			Map m=proService.empIdSearchModal(map);
			if(m!=null) {
				if(m.get("PROF_NAME").equals(map.get("searchName"))&&m.get("EMAIL").equals(map.get("searchEmail"))) {
					sb.append("귀하의 사번은 "+ m.get("PROF_ID") + "입니다.");
					mc.forSendEmail((String)map.get("searchEmail"),"사번 안내입니다." , sb.toString(), req);
					msg="메일로 사번을 전송하였습니다.";
				}else {
					msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
				}
			}else {
				msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/stuPwSearch.hd")
	@ResponseBody
	public String stuPwSearch(Student s, @RequestParam String loginNo) {
		
		System.out.println(s);
		System.out.println(loginNo);
		ObjectMapper mapper=new ObjectMapper();
		String jsonArr="";
				if(loginNo.equals("s")) {
					Student stu=stuService.stuIdSearch(s);
					if(stu!=null) {
						if(stu.getStuNo().equals(s.getStuNo())&&stu.getStuEmail().equals(s.getStuEmail())) {
							try {
								jsonArr=mapper.writeValueAsString(stu);
							} catch (JsonProcessingException e) {
								e.printStackTrace();
							}
						}
					}else{
						
						
					}
				}
		return jsonArr;
	}
	
	

}


















