package com.kh.finalProject.student.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.student.model.service.StudentService3;
import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.GraduationCon;
import com.kh.finalProject.student.model.vo.MySchedule;
import com.kh.finalProject.student.model.vo.MyScheduleForInfo;
import com.kh.finalProject.student.model.vo.StuTuition;


@Controller
public class StudentController3 {
	private Logger logger = LoggerFactory.getLogger(StudentController3.class);
	@Autowired
	private StudentService3 service;
	
	@RequestMapping("/student/tuitionBill.hd")
	public String selectTuition(HttpSession session, Model model) {
		System.out.println("/student/tuitionBill.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String semester="";
		if(todayMonth>=1&&todayMonth<=6) {
			semester="01";
		}else if(todayMonth>=7&&todayMonth<=12) {
			semester="02";
		}
		
		String acaYearSem=today.substring(0, 4)+"-"+semester;
		System.out.println("acaYearSem:"+acaYearSem);
		
		tuition.setAcaYearSem(acaYearSem);
		StuTuition student=service.selectBasicStudentInfo(studentNo);
		if(student.getStuAddr()!=null&&student.getStuAddr().contains("PSTC")&&student.getStuAddr().split("PSTC").length==2) {
			student.setStuPostcode(student.getStuAddr().split("PSTC")[0]); // 우편번호 저장
		}else {
			student.setStuPostcode(""); // 우편번호 저장
		}
		StuTuition result=service.selectTuitionOne(tuition);
		System.out.println("result:"+result);
		model.addAttribute("student", student); // 학생 기본 정보 보내기
		model.addAttribute("tuition", result);
		
		return "student/studentTuition";
	}
	
	
	@RequestMapping("/student/tuitionCert.hd")
	public String selectTuitionCert(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("/student/tuitionCert.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		String selectYearSem="";
		String selectYearSemKor="";
		
		List<StuTuition> tuitionCertList=service.selectTuitionCertList(studentNo);
		for(int i=0; i<tuitionCertList.size(); i++) {
			String acaYear=tuitionCertList.get(i).getAcaYearSem().substring(0, 4);
			System.out.println("학년도:"+acaYear);
			int tcListLength=tuitionCertList.get(i).getAcaYearSem().length();
			String semester=tuitionCertList.get(i).getAcaYearSem().substring(tcListLength-2, tcListLength);
			System.out.println("학기:"+semester);
			tuitionCertList.get(i).setAcaYearSemKor(acaYear+"학년도 "+semester+"학기");
			if(i==0) {
				selectYearSem=acaYear+"-"+semester; // 가장 최근의 학년 학기만 저장
				selectYearSemKor=acaYear+"학년도 "+semester+"학기"; // 가장 최근의 학년 학기만 저장
			}
		}
		System.out.println("tuitionCertList:"+tuitionCertList);
		model.addAttribute("tuitionCertList", tuitionCertList);
		
		System.out.println("로그인한 아이디:"+studentNo);
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		tuition.setAcaYearSem(selectYearSem);
		StuTuition student=service.selectBasicStudentInfo(studentNo);
		if(student.getStuAddr()!=null&&student.getStuAddr().contains("PSTC")&&student.getStuAddr().split("PSTC").length==2) {
			student.setStuPostcode(student.getStuAddr().split("PSTC")[0]); // 우편번호 저장
		}else {
			student.setStuPostcode(""); // 우편번호 저장
		}
		StuTuition result=service.selectTuitionOne(tuition);
		System.out.println("result:"+result);
		model.addAttribute("student", student); // 학생 기본 정보 보내기
		model.addAttribute("tuition", result);
		model.addAttribute("selectYearSemKor", selectYearSemKor);
		
		return "student/studentTuitionCert";
	}
	
	@RequestMapping("/student/tuitionCertAjax.hd")
	@ResponseBody
	public String selectTuitionByAjax(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		// @ResponseBody이용 jackson
		System.out.println("/student/tuitionCertAjax.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		String selectYearSem="";
		selectYearSem=req.getParameter("selectYearSem");
		System.out.println("ajax로 입력받은 selectYearSem:"+selectYearSem);
		
		tuition.setAcaYearSem(selectYearSem);
		
		ObjectMapper mapper=new ObjectMapper();
		StuTuition result=service.selectTuitionOne(tuition);
		String jsonStr="";
		  try {
			jsonStr=mapper.writeValueAsString(result); // 매개변수에 배열도 들어갈 수 있다!! 매우 편리하다!! 자바스크립트 객체 형식으로 변환 해준다.
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  res.setContentType("application/json;charset=utf-8"); // 인코딩 설정하기
		return jsonStr;
	}
	
	@RequestMapping(value="/student/payTuitionAjax.hd", method=RequestMethod.POST)
	@ResponseBody
	public String updatePayTuitionByAjax(HttpSession session, HttpServletRequest req, HttpServletResponse res) { // 등록금을 납부하면
		System.out.println("/student/payTuitionAjax.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		String curStuYearSem="";
		curStuYearSem=service.selectStuYearSem(studentNo); // 현재 학년-학기(예:1-1) 조회하기
		System.out.println("curAcaYearSem(변경 이전):"+curStuYearSem);
		int curAcaYear=0;
		int curSem=0;
		if(!curStuYearSem.equals("")&&curStuYearSem.split("-").length==2) { // 현재 학년 학기가 ""가 아니고, 현재 학년 학기가 "-"로 배열로 나눠질때
			curAcaYear=Integer.parseInt(curStuYearSem.split("-")[0]); // 현재 학년 저장
			curSem=Integer.parseInt(curStuYearSem.split("-")[1]); // 현재 학기 저장
			if(curSem==0) { // 신입생(1-0), 편입생(3-0)이면
				curSem=1; // 현재 학기 1학기로 설정
				curStuYearSem=curAcaYear+"-"+curSem;
			}else if(curSem==1) { // 현재 학기가 1학기이면
				curSem=2; // 현재 학기 2학기로 설정
				curStuYearSem=curAcaYear+"-"+curSem;
			}else if(curSem==2) { // 현재 학기가 2학기이면
				curAcaYear++; // 현재 학년에 1을 더해준다.
				curSem=1; // 현재 학기는 1학기로 설정
				curStuYearSem=curAcaYear+"-"+curSem;
			}
		}
		System.out.println("curAcaYearSem(변경 이후):"+curStuYearSem);
		Student student=new Student();
		student.setStuNo(studentNo);
		student.setStuYearSem(curStuYearSem); // 변경된 학년-학기(예:1-1) 저장
		
		String acaYearSem="";
		acaYearSem=req.getParameter("acaYearSem"); // ajax로 입력받은 현재 학년도(예:2019학년도 1학기) 학기
		System.out.println("ajax로 입력받은 acaYearSem:"+acaYearSem);
		tuition.setAcaYearSem(acaYearSem);
		System.out.println("update이전:"+tuition);
		
		String resultStr="";
		
		try {
			service.updateTuitionOne(tuition, student); // 학생 테이블에 학년 학기 update, 등록금 테이블도 PAYMENT_STAT, PAYMENT_DATE update
			resultStr="1"; // 업데이트 성공
		}catch(Exception e) {
			e.printStackTrace();
			resultStr="0"; // 업데이트 실패
			logger.info("등록금 업데이트 안 됨");
		}
		
		System.out.println("resultStr:"+resultStr);
		
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		  try {
			jsonStr=mapper.writeValueAsString(resultStr); // 매개변수에 배열도 들어갈 수 있다!! 매우 편리하다!! 자바스크립트 객체 형식으로 변환 해준다.
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  res.setContentType("application/json;charset=utf-8"); // 인코딩 설정하기
		return jsonStr;
	}
	
	
	@RequestMapping("/student/myGraduation.hd")
	public String selectMyGraduation(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("/student/myGraduation.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		
		System.out.println("로그인한 아이디:"+studentNo);
		GraduationCon graduationCon=service.selectGraduationCon(studentNo);
		System.out.println("graduationCon:"+graduationCon);
		String birthday="";
		if(graduationCon!=null) {
			String year=graduationCon.getStuSSn().substring(0, 2);
			String month=graduationCon.getStuSSn().substring(2, 4);
			String day=graduationCon.getStuSSn().substring(4, 6);
			birthday=year+"년 "+month+"월"+day+"일";
		}

		model.addAttribute("graduationCon", graduationCon); // 학생 졸업조건 넘기기
		model.addAttribute("birthday", birthday); // 학생 생년월일 넘기기
		
		return "student/myGraduation";
	}
	
	@RequestMapping("/student/mySchedule.hd")
	public String selectMySchedule(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("/student/mySchedule.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		
		//////////////////////
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String acaYear=today.substring(0, 4);
		String acaSemester="";
		if(todayMonth>=1&&todayMonth<=6) {
			acaSemester="1";
		}else if(todayMonth>=7&&todayMonth<=12) {
			acaSemester="2";
		}
		
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		MyScheduleForInfo msfi=new MyScheduleForInfo();
		msfi.setStuNo(studentNo);
		msfi.setAcaYear(acaYear);
		msfi.setAcaSemester(acaSemester);
		
		System.out.println("msfi:"+msfi);
		List<MySchedule> myScheduleList=service.selectMySchedule(msfi);
		System.out.println("myScheduleList:"+myScheduleList);
		
		model.addAttribute("myScheduleList", myScheduleList); // 학생 시간표 넘기기
		
		return "student/mySchedule";
	}
}
