package com.kh.finalProject.employee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.beforeStudent.model.service.BeforeStuService;
import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.common.encrypt.MyEncrypt;
import com.kh.finalProject.email.controller.MailController;
import com.kh.finalProject.employee.model.service.EmployeeService;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class EmployeeController {

	@Autowired
	MailController handler;
	@Autowired
	private MyEncrypt enc;
	@Autowired
	private EmployeeService service;

	@Autowired
	BeforeStuService bService;

	static Map<Object, Integer> count = new HashMap();

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
		try {
			int result = service.insertNewStu(s, beforeStu);
			handler.forSendEmail(s.getStuEmail(), "KH 대학교에 입학 하신것을 축하드려요!", "아이디 : " + s.getStuNo()
					+ "   \r\n    비밀번호 : " + enc.decrypt(s.getStuPw()) + " 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.", req);
		} catch (Exception e) {
			System.out.println("에러");
			return 0;
		}

		return beforeStu;
	}

	
	//교수 등록 삭제 리스트
	@RequestMapping("/enrollprofessor.hd")
	public ModelAndView enrollprofrssor(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Professor> list = service.selectProfList(cPage, numPerPage);
		int totalData = service.profCount();
		mv.setViewName("admin/enrollProfessor");
		mv.addObject("list",list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/enrollprofessor.hd"));
		return mv;
	}

	
	@RequestMapping("/changeProfessor.hd")
	public ModelAndView changeProfessor(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, String deptCode) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		List<Professor> list = service.changeProfessor(cPage, numPerPage, deptCode);
		int totalData = service.changeProfessorCount(deptCode);
		mv.addObject("list",list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/changeProfessor.hd"));
		mv.setViewName("admin/enrollProfessor");
		return mv;
	}
	
	
	
	
	// 직원
	@RequestMapping("/enrollemployee.hd")
	public ModelAndView enrollemployee(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Employee> list = service.selectEmpList(cPage, numPerPage);
		int totalData = service.empListCount();
		mv.addObject("list",list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/enrollemployee.hd"));
		mv.setViewName("admin/enrollEmp");
		return mv;
	}
	
	
	
	
	
	public Student settingNewStudent(BeforeStu bs) {

		Student s = new Student();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(date);
		System.out.println();
		Map sMap = settingStudentNumber(bs.getBeforeDeptCode());
		int stuNum = (int) sMap.get(bs.getBeforeDeptCode());
		String stuNo = "S" + sysdate.substring(0, 4) + bs.getBeforeDeptCode() + String.format("%03d", stuNum);
		s.setStuNo(stuNo);
		s.setStuName(bs.getBeforeName());
		try {
			// 암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			s.setStuPw(enc.decrypt(bs.getBeforeNo()).substring(0, 6));
			// 패스워드 초기 패스워드 암호화함
			s.setStuPw(enc.encrypt(s.getStuPw()));

			// 성별땜에
			bs.setBeforeNo(enc.decrypt(bs.getBeforeNo()));
			// 성별 설정
			s.setGender(bs.getBeforeNo().substring(6, 7).equals("1") || bs.getBeforeNo().substring(6, 7).equals("3")
					? "남"
					: bs.getBeforeNo().substring(6, 7).equals("2") || bs.getBeforeNo().substring(6, 7).equals("4") ? "여"
							: "");

			// 다시 암호화
			bs.setBeforeNo(enc.encrypt(bs.getBeforeNo()));

			// 로그인 matches 양식
//			String su = "911010";
//			System.out.println("매치 :" + s.getStuPw().matches(su));

		} catch (Exception e) {
			e.printStackTrace();
		}
		s.setStuTel(bs.getBeforePhone());
		s.setStuAddr(bs.getBeforeAddr());
		s.setStuSsn(bs.getBeforeNo());
		s.setDeptCode(bs.getBeforeDeptCode());
		s.setStuEmail(bs.getBeforeEmail());
		s.setRegStatus("재학");
//		s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ? "1-1" : "미정");
		s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ? "1-0" : "3-0");
		return s;
	}

	// 학과 코드랑
	public Map settingStudentNumber(String deptCode) {
		int deptCount = service.selectDeptCount(deptCode);
		List<Map> colList = bService.selectColList();
		for (Map col : colList) {
			List<Map> deptList = bService.selectDeptList((String) col.get("COL_CODE"));
			for (int i = 0; i < deptList.size(); i++) {
				if (count.containsKey(deptList.get(i).get("DEPT_CODE"))) {
					if (deptCode.equals(deptList.get(i).get("DEPT_CODE")) && deptCount != 0) {
						int lastNum = service.selectLastNum(deptCode);
							count.put(deptList.get(i).get("DEPT_CODE"), lastNum + 1);
						}else {
							count.put(deptList.get(i).get("DEPT_CODE"), + 1);
						}
				} else {
					if (deptCode.equals(deptList.get(i).get("DEPT_CODE")) && deptCount != 0) {
						int lastNum = service.selectLastNum(deptCode);
						count.put(deptList.get(i).get("DEPT_CODE"), lastNum + 1);
					} else {
						count.put(deptList.get(i).get("DEPT_CODE"), 1);
					}
				}
			}

		}
		return count;
	}

	
	@RequestMapping("/employee/insertEmp.hd")
	public String insertEmp(Employee emp, HttpServletRequest req) {
		System.out.println("인서트 시작 : " + emp);
		String msg = "";
		String loc = "";
		Employee e = settingNewEmployee(emp);
		 System.out.println(e);
		try {
			int result = service.insertNewEmp(e);
			handler.forSendEmail(e.getEmail(), "KH 대학교에 근무 하게 된 것을 축하드려요!", "아이디 : " + e.getEmpId()
			+ "   \r\n    비밀번호 : " + enc.decrypt(e.getEmpPw()) + " 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.", req);
		} catch (Exception x) {
			System.out.println("에러");
		}
		
		return "common/msg";
	}
	


	public Employee settingNewEmployee(Employee e) {
		System.out.println("세팅 진입 : " + e);
		System.out.println("번호 : " + e.getEmpSsn());
		Employee emp = new Employee();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(date);
		int empNum = 0;
		if(service.empLastNumCheck(e.getDeptCode()) > 0) {
			empNum = service.selectEmpLastNum(e.getDeptCode());
		}else {
			empNum = 1;
		}
		System.out.println("번호 세팅 : " + empNum);
		String empNo = "E" + sysdate.substring(0, 4) + e.getDeptCode() + String.format("%02d", empNum);
		emp.setEmpId(empNo);
		emp.setEmpName(e.getEmpName());
		try {
			// 암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			emp.setEmpPw(e.getEmpSsn().substring(0, 6));
			System.out.println(emp.getEmpPw());
			// 패스워드 초기 패스워드 암호화함
			emp.setEmpPw(enc.encrypt(emp.getEmpPw()));
			System.out.println(emp.getEmpPw());
			// 성별땜에
			// 성별 설정
			emp.setGender(e.getEmpSsn().substring(6, 7).equals("1") || e.getEmpSsn().substring(6, 7).equals("3")
					? "남"
					: e.getEmpSsn().substring(6, 7).equals("2") || e.getEmpSsn().substring(6, 7).equals("4") ? "여"
							: "");

			// 다시 암호화
			emp.setEmpSsn(enc.encrypt(e.getEmpSsn()));

			// 로그인 matches 양식
//			String su = "911010";
//			System.out.println("매치 :" + s.getStuPw().matches(su));

		} catch (Exception x) {
			x.printStackTrace();
		}
		emp.setPhone(e.getPhone());
		emp.setAddress(e.getAddress());
		emp.setDeptCode(e.getDeptCode());
		emp.setEmail(e.getEmail());
		System.out.println("세팅 끝 : " + emp);
//		s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ? "1-1" : "미정");
		return emp;
	}
	
	@RequestMapping("/professor/insertProf.hd")
	public String insertProf(Professor p, HttpServletRequest req) {
		System.out.println("인서트 시작 : " + p);
		String msg = "";
		String loc = "";
		Professor prof = settingNewProfessor(p);
		 System.out.println(prof);
		try {
			int result = service.insertNewProf(prof);
			handler.forSendEmail(prof.getEmail(), "KH 대학교에 근무 하게 된 것을 축하드려요!", "아이디 : " + prof.getProfId()
			+ "   \r\n    비밀번호 : " + enc.decrypt(prof.getProfPw()) + " 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.", req);
		} catch (Exception x) {
			System.out.println("에러");
		}
		
		return "common/msg";
	}	
	
	public Professor settingNewProfessor(Professor p) {
		System.out.println("세팅 진입 : " + p);
		System.out.println("번호 : " + p.getProfSsn());
		Professor prof = new Professor();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(date);
		int profNum = 0;
		if(service.empLastNumCheck(p.getDeptCode()) > 0) {
			profNum = service.selectProfLastNum(p.getDeptCode());
		}else {
			profNum = 1;
		}
		System.out.println("번호 세팅 : " + profNum);
		String rofNo = "P" + sysdate.substring(0, 4) + p.getDeptCode() + String.format("%02d", profNum);
		prof.setProfId(rofNo);
		prof.setProfName(p.getProfName());
		try {
			// 암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			prof.setProfPw(p.getProfSsn().substring(0, 6));
			System.out.println(prof.getProfPw());
			// 패스워드 초기 패스워드 암호화함
			prof.setProfPw(enc.encrypt(prof.getProfPw()));
			System.out.println(prof.getProfPw());
			// 성별땜에
			// 성별 설정
			prof.setGender(p.getProfSsn().substring(6, 7).equals("1") || p.getProfSsn().substring(6, 7).equals("3")
					? "남"
					: p.getProfSsn().substring(6, 7).equals("2") || p.getProfSsn().substring(6, 7).equals("4") ? "여"
							: "");

			// 다시 암호화
			prof.setProfSsn(enc.encrypt(p.getProfSsn()));

			// 로그인 matches 양식
//			String su = "911010";
//			System.out.println("매치 :" + s.getStuPw().matches(su));

		} catch (Exception x) {
			x.printStackTrace();
		}
		prof.setPhone(p.getPhone());
		prof.setAddress(p.getAddress());
		prof.setDeptCode(p.getDeptCode());
		prof.setEmail(p.getEmail());
		System.out.println("세팅 끝 : " + prof);
//		s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ? "1-1" : "미정");
		return prof;
	}

	@RequestMapping("/deleteEmployee.hd")
	public String deleteProf(@RequestParam int num) {
		
		return "";
	}

}
