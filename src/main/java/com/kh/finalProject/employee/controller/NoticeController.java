package com.kh.finalProject.employee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.employee.model.service.NoticeService;
import com.kh.finalProject.employee.model.vo.NoticeVo;
import com.kh.finalProject.professor.common.PageFactory;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;

	    //공지사항  조회
	    @RequestMapping(value="/notice.hd")
	    public String noticeList(Model model, HttpServletRequest req, 
	    		@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage
	    		) throws Exception{
	        int numPerPage = 5;         
	        
	        List<NoticeVo> list = service.selectNoticeList(cPage, numPerPage);
	        for(NoticeVo n : list) {
	        	n.setRegDate(n.getRegDate().substring(0, 10));
	        }
	        int totalData = service.countNoticeList();
	        model.addAttribute("list", list);
			model.addAttribute("list", list);
			model.addAttribute("totalCount", totalData);
			model.addAttribute("pageBar",
					PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/notice.hd"));

	        return "employee/notice";
	    }
	    
	    
	    //공지사항 작성 틀
	    @RequestMapping(value="/notice/writeForm.hd")
	    public String writeNoticeForm() throws Exception{
	        
	        return "notice/writeForm";
	    }
	    
	    //공지등록
	    @RequestMapping(value="/notice/write.hd")
	    public String write(@ModelAttribute("noticeVo") NoticeVo noticeVo, Model model) throws Exception{
	        
	        int result = service.insertNotice(noticeVo);
	        
	        return "redirect:/notice/noticeList.hd";
	    }
	    
	    //게시글 조회
	    @RequestMapping(value="/notice/viewContent.hd")
	    public String viewForm(@ModelAttribute("noticeVo") NoticeVo noticeVo,  Model model, HttpServletRequest request) throws Exception{
	        
	        int code = Integer.parseInt(request.getParameter("code"));
	        noticeVo.setBoardNo(code);
	        
	        List<NoticeVo> resultVo = service.selectNoticeByCode(noticeVo);
	        
	        model.addAttribute("result", resultVo);
	        
	        return "notice/viewForm";
	    }
	    
	    //게시글 수정
	    @RequestMapping(value="/notice/updatenotice.hd")
	    public String updateNotice(@ModelAttribute("noticeVo") NoticeVo noticeVo, Model model) throws Exception{
	        
	            
	           int result =  service.updateNotice(noticeVo);
	            
	        
	        return "redirect:/notice/noticeList.hd";
	        
	    }
	    
	    //게시글 삭제
	    @RequestMapping("/notice/delete.hd")
	    public String deleteNotice(@ModelAttribute("noticeVo") NoticeVo noticeVo , Model model) {
	    	
	    	int result = service.deleteNotice(noticeVo);
	    	
	    	return "";
	    }
	
		
	
}
