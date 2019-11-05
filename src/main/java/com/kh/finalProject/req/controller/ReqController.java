package com.kh.finalProject.req.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.req.model.service.ReqService;
import com.kh.finalProject.req.model.vo.Req;

@Controller
public class ReqController {
	
	@Autowired
	private ReqService service;
	
	@RequestMapping("/req.hd")
	public String req(Req req, Model model) {
		String msg="";
		String loc="/";
		try {
			msg="건의사항 접수가 완료되었습니다.";
			int result=service.insertReq(req);			
		}catch(Exception e) {
			msg="다시 작성해주세요.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}

}
