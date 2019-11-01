package com.kh.finalProject.email.controller;

import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.email.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	MailService mailService;
	
	@RequestMapping(value="/email.do")
	public ModelAndView checkEmail() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("enroll/enrollStudent");
		mv.addObject("random",ran);
		System.out.println("checkEmail");
		System.out.println("랜덤 값 : " + ran);
		return mv;
	}
	
	@RequestMapping(value="/login/createEmailCheck.do", method = RequestMethod.GET)
	public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam String random, HttpServletRequest request) {
		System.out.println("createEmailCheck");
		System.out.println("userEmail :" +userEmail );
		System.out.println("random : " + random);
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject ="회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 "+ authCode + "입니다.");
		
		return mailService.send(subject, sb.toString(), "lgwan840@gmail.com", userEmail);
 		
	}
	
	@RequestMapping(value="emailAuth.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random, HttpSession session) {
		System.out.println("emailAuth");
		String originaljoinCode = (String)session.getAttribute("authCode");
		String originalRandom = Integer.toString((int)session.getAttribute("random"));
		if(originaljoinCode.equals(authCode) && originalRandom.equals(random))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else return new ResponseEntity<String>("false", HttpStatus.OK);
	}
	
}
