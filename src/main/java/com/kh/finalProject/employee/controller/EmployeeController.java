package com.kh.finalProject.employee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.common.encrypt.MyEncrypt;
import com.kh.finalProject.email.controller.MailController;
import com.kh.finalProject.employee.model.service.EmployeeService;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class EmployeeController {

	@Autowired
	MailController handler;
	@Autowired
	private MyEncrypt enc; 
	@Autowired
	private EmployeeService service;

	@RequestMapping("/enrollStudent.hd")
	public ModelAndView enrollStudent() {
		ModelAndView mv = new ModelAndView();
		
		List list = service.enrollStuList();
		mv.setViewName("admin/enrollStudent");
		mv.addObject("list", list);
		return mv;
		}
	
	
		@RequestMapping("insertNewStu.do")
		@ResponseBody
		public int insertNewStu(@RequestParam int beforeStu, HttpServletRequest req) {
			BeforeStu bs = service.selectBeforeStu(beforeStu);
			Student s = settingNewStudent(bs);
			System.out.println("s : " + s);
			try {
				int result = service.insertNewStu(s, beforeStu);
				handler.forSendEmail(s.getStuEmail(), "KH 대학교에 입학 하신것을 축하드려요!", "아이디 : "+s.getStuNo()+"   \r\n    비밀번호 : "+enc.decrypt(s.getStuPw())+" 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.", req);
			}catch(Exception e) {
				System.out.println("에러");
				return 0;
			}
			
		
		return beforeStu;
		}
		
	public Student settingNewStudent(BeforeStu bs) {
		
		Student s = new Student();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate  = sdf.format(date);
		String stuNo = "S" +sysdate.substring(0, 4) + bs.getBeforeDeptCode() + String.format("%03d", bs.getBeforeStu());
		s.setStuNo(stuNo);
		s.setStuName(bs.getBeforeName());
		try {
			//암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			s.setStuPw(enc.decrypt(bs.getBeforeNo()).substring(0, 6));
			//패스워드 초기 패스워드 암호화함 
			s.setStuPw(enc.encrypt(s.getStuPw()));
			// 로그인 matches 양식
//			String su = "911010";
//			System.out.println("매치 :" + s.getStuPw().matches(su));

		}catch(Exception e) {
			e.printStackTrace();
		}
		s.setStuSsn(bs.getBeforeNo());
		s.setStuTel(bs.getBeforePhone());
		s.setStuAddr(bs.getBeforeAddr());
		s.setGender(bs.getBeforeNo().substring(6, 7).equals("1") || bs.getBeforeNo().substring(6, 7).equals("3")?"M": bs.getBeforeNo().substring(6, 7).equals("2") || bs.getBeforeNo().substring(6, 7).equals("4")?"F":"");
		s.setDeptCode(bs.getBeforeDeptCode());
		s.setStuEmail(bs.getBeforeEmail());
		s.setRegStatus("재학");
		s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ?"1-1":"미정");
		return s;
	}
	
}
