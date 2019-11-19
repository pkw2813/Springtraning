package com.kh.finalProject.student.controller;	

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.student.model.service.StudentService1;
import com.kh.finalProject.student.model.vo.Student;	

@Controller	
public class StudentController1 {	
	@Autowired	
	private StudentService1 service;	

	@RequestMapping("/student/studentInfo.hd")	
	public String selectStudent(HttpSession session, Model m) {	
		Student s=(Student)session.getAttribute("loginMember");	
		String studentNo = s.getStuNo();	
		Student result = service.selectStudent(studentNo);	
		String addr=result.getStuAddr();	
		String[] addrArr=addr.split("PSTC");
		if(addrArr.length==2) {
			result.setStuAddr(addrArr[1]);	
		}else {
			result.setStuAddr(addr);
		}
		m.addAttribute("student", result);	
		String loc;	
		if(result.getStuAccount()==null||result.getStuImgOriname()==null) {	
			loc="student/studentFirstInfo";	
		}else {	
			loc="student/studentInfo";	
			}	

		return loc;	
	}	

	@RequestMapping("/student/studentInfoUpdate.hd")
	public String studentInfoUpdate(HttpSession session,Model m) {	
		Student s=(Student)session.getAttribute("loginMember");	
		String studentNo = s.getStuNo();	
		Student result = service.selectStudent(studentNo);	
		
		m.addAttribute("student", result);	
		return "student/studentInfoUpdate";	
	}	

	@RequestMapping(value = "/student/studentInfoUpdateEnd.hd", method = RequestMethod.POST)	
	public String studentInfoUpdateEnd(HttpServletRequest req, Model m,	
			@RequestParam(value = "imgAttach", required = false) MultipartFile upFile) {	

		Student s = new Student();	
		String stuNo = req.getParameter("stuNo");	
		String stuEmail = req.getParameter("stuEmail");	
		String stuTel = req.getParameter("stuTel");	
		String stuAddr = req.getParameter("totalAddress");
		String bankName =req.getParameter("bankName");
		String AccountNumber =req.getParameter("AccountNumber");
		String AccountName =req.getParameter("AccountName");

		String stuAccount = bankName+"ACCDELIMETER"+AccountNumber+"ACCDELIMETER"+AccountName;
		String stuFile=req.getParameter("LoadImgStat");

		int result=0;	

		if(stuFile.equals("false")) {	
			s.setStuImgRename("false");	
		}	
		s.setStuNo(stuNo);	
		s.setStuEmail(stuEmail);	
		s.setStuTel(stuTel);	
		s.setStuAddr(stuAddr);	
		s.setStuAccount(stuAccount);	
		s.setStuImgRename(stuFile);	
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/image");	
		File dir = new File(saveDir);	

		if (stuFile.equals("false")) {	
			result = service.studentInfoUpdate(s);	

		} else {
			// 파일명 설정(renamed)	

			Student s1=service.selectStudent(stuNo);	
			String deleteFile=s1.getStuImgRename();	
			File del=new File(saveDir+"/"+deleteFile); 	
			del.delete();	

			String oriFileName = upFile.getOriginalFilename();	
			// 파일에서 확장자빼기	
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));	
			// rename 규칙설정	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");	
			int rnd = (int) (Math.random() * 1000);	
			String reName = sdf.format(System.currentTimeMillis()) + "_" + rnd + ext;	
			// reName된 파일명으로 저장하기	
			try {	
				upFile.transferTo(new File(saveDir + "/" + reName));	
			} catch (IOException e) {	
				e.printStackTrace();	
			}	
			s.setStuImgOriname(oriFileName);	
			s.setStuImgRename(reName);	
			

			 try { 	
				 result = service.studentInfoUpdate(s); 	
			 }catch (Exception e) { 	
				 // 파일삭제로직. 	
				 // 에러메세지 출력로직! 	
				


				 del=new File(saveDir+"/"+s.getStuImgRename());	
				 del.delete(); }	
				}	




		return "redirect:/student/studentInfo.hd";	

	}	
	
	@RequestMapping(value = "/student/changePw.hd", method = RequestMethod.POST)
	public ModelAndView pwChange(HttpSession session,HttpServletRequest req,HttpServletResponse res) {
		ModelAndView mv=new ModelAndView();
		Student loginMember=(Student)session.getAttribute("loginMember");
		String stuId=loginMember.getStuNo();
		String stuPw=service.selectNowPw(stuId);
		String changePwck=req.getParameter("pwNow");
		
		String pwck="false";
		if(stuPw.equals(changePwck)) {
			pwck="true";
		}else {pwck="false";
		}
	
		mv.addObject("pwck",pwck);
		mv.setViewName("jsonView");
		
	
		return mv;
	}
	
	@RequestMapping(value = "/student/changePwEnd.hd", method = RequestMethod.POST)
	public String pwChangeEnd(HttpSession session,HttpServletRequest req) {
		Map<String,String> userInfo = new HashMap();
		Student loginMember=(Student)session.getAttribute("loginMember");
		String stuId=loginMember.getStuNo();
		String stuPw=req.getParameter("pwfinal");
		System.out.println("id:"+stuId);
		System.out.println("pw:"+stuPw);
		userInfo.put("stuId", stuId);
		userInfo.put("stuPw", stuPw);
		int result=service.updatePw(userInfo);
		
		return "/student/studentInfoUpdate";
	}
	
	
	

}





