package com.kh.finalProject.req.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.req.model.service.ReqService;
import com.kh.finalProject.req.model.vo.Req;

@Controller
public class ReqController {
	
	@Autowired
	private ReqService service;
	
	@RequestMapping("/req.hd")
	public String insertReq(Req req, Model model) {
		String msg="";
		String loc="";
		try {
			if(!req.getToName().equals("EA000000000")) {
				msg="건의사항 접수가 완료되었습니다.";
				loc="/main.hd";	
			}else {				
				msg="답변이 전달 되었습니다.";
				loc="/reqList.hd";
			}
			int result=service.insertReq(req);			
		}catch(Exception e) {
			msg="다시 작성해주세요.";
			loc="/main.hd";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/reqList.hd")
	public String reqList(Model model) {
		List<Req> list=service.reqList();
		model.addAttribute("list",list);
		return "req/reqList";
	}
	
	@RequestMapping("/reqOne.hd")
	public String reqOne(@RequestParam int reqNo, Model model) {
		Req req=service.reqOne(reqNo);
		/* int reqUpdate=service.reqUpdate(reqNo); */
		model.addAttribute("reqOne",req);
		return "req/reqOne";
	}
	
	@RequestMapping("/answerUpdate.hd")
	public String answerUpdate(Req req, @RequestParam int reqNo, Model model) {
		System.out.println("123123"+reqNo);
		System.out.println(req);
		int answerUpdate=service.answerUpdate(reqNo);
		String msg="";
		if(answerUpdate > 0) {
			msg="처리 완료 되었습니다.";
		}else {
			msg="실패 하였습니다.";
		}
		String loc="/reqOne.hd?reqNo="+reqNo;
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		model.addAttribute("reqOne",req);
		
		return "common/msg";
	}

}
























