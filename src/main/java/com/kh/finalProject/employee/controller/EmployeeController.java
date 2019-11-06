package com.kh.finalProject.employee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.service.EmployeeService;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class EmployeeController {

	
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
		public int insertNewStu(@RequestParam int beforeStu) {
			BeforeStu bs = service.selectBeforeStu(beforeStu);
			System.out.println("bs 확인" + bs);
			Student s = settingNewStudent(bs);
			System.out.println("세팅한 student : " + s);
			try {
				System.out.println("try 문 내부");
				int result = service.deleteBeforeStu(beforeStu);
				int result2 = service.insertNewStu(s);
			}catch(Exception e) {
				System.out.println("에러");
				return 0;
			}
			
		
		return beforeStu;
		}
		
	public static Student settingNewStudent(BeforeStu bs) {
		
		Student s = new Student();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate  = sdf.format(date);
		String stuNo = "S" +sysdate.substring(0, 4) + bs.getBeforeDeptCode() + String.format("%03d", bs.getBeforeStu());
		s.setStuNo(stuNo);
		s.setStuName(bs.getBeforeName());
		s.setStuPw(bs.getBeforeNo().substring(0, 6));
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
