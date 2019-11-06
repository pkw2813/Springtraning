package com.kh.finalProject.professor.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService1;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Controller
public class ProfessorController1 {
	private Logger logger = LoggerFactory.getLogger(ProfessorController1.class);
	@Autowired
	private ProfessorService1 service;
	//강의조회
	@RequestMapping("/professor/subjectView")
	public String subjectView() {
		
		
		
		return "professor/subjectView";
	}
	//강의개설
	@RequestMapping("/professor/insertSubject")
	public String insertSubject(Model model) {
		
		String profName = service.selectProfName();
		model.addAttribute("profName",profName);
		
		return "professor/insertSubject";
	}
	//강의개설 END
	@RequestMapping("/professor/insertSubjectEnd")
	public String insertSubjectEnd(MultipartFile upfile,@RequestParam Map<String,String> map,HttpServletRequest req) {
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/SubjectProject");
		
		File dir = new File(saveDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(!upfile.isEmpty()) {
			String oriFileName = upfile.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int random = (int)(Math.random()*1000);
			String reName = sdf.format(System.currentTimeMillis())+"_"+random+ext;
			
			try {
				upfile.transferTo(new File(saveDir+"/"+reName));
			}catch(IOException e){
				e.printStackTrace();
			}
			
			map.put("upFile", reName);
			map.put("oriFile",oriFileName);
			
		}
		
		logger.info("파일이름 : "+upfile.getOriginalFilename());
		
		logger.info("맵 : "+map);
		String msg="";
		try {
			Map<String,String> result = service.insertSubjectEnd(upfile,map);
		}catch(RuntimeException e) {
			logger.info("생성불가");
		}
		
		
		
		return "redirect:/";
	}
	//교수정보
	@RequestMapping("/professor/professorView")
	public String professorView(Model model) {
		
//		Professor p = service.professorView();
//		
//		model.addAttribute("prof",p);
		
		return "professor/professorView";
	}
	//교수 정보 수정
	@RequestMapping("/professor/updateProf")
	public String updateProfessor(Model model) {
		
//		Professor p = service.professorView();
//		
//		model.addAttribute("prof",p);
		
		return "professor/updateProfessor";
	}
	@RequestMapping("/professor/updateProfessorEnd")
	public String updateProfessorEnd(Model model, HttpServletRequest req, Professor p) {
		
		String msg = "";
		String loc ="/";
		
		int result = service.updateProfessorEnd(p);
		if(result>0) {
			msg = "수정완료";
			loc = "/son_n_index.jsp";
		}else {
			msg = "수정실패";
			loc = "/son_n_index.jsp";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	//교수 비밀번호 변경
	@RequestMapping("/professor/updatePwd")
	public String profUpdatePwd(Model model, HttpServletRequest req) {
		
		String profId = req.getParameter("profId");
		
		model.addAttribute("profId",profId);
		
		return "professor/profUpdatePwd";
	}
	@RequestMapping("/professor/profUpdatePwdEnd")
	public String profUpdatePwdEnd(Model model, HttpServletRequest req, Professor p) {
		
		String profId = req.getParameter("profId");
		String profPw = req.getParameter("profPw");
		String profPwdUpdate = req.getParameter("profPwdUpdate");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("profId",profId);
		map.put("profPw",profPw);
		map.put("profPwdUpdate",profPwdUpdate);
		
		
		String msg = "";
		String loc ="/";
		
		int result = service.profUpdatePwdEnd(map);
		
		if(result>0) {
			msg = "비밀번호 변경완료";
			loc = "/index.jsp";
		}else {
			msg = "비밀번호가 다릅니다!";
			loc = "/index.jsp";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	//강의 자료 게시판
	@RequestMapping("/professor/lectureData")
	public String lecturePlan(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage ,Model model) {
//		Professor p1 = (Professor)session.getAttribute("loginMember");
//		String id = p1.getProfId();
//		Professor p = service.professorView();
//		
//		model.addAttribute("prof",p);
		
		int numPerPage=10;
		
		List<ProfessorBoard> list = service.boardView(cPage, numPerPage);
		int totalData = service.selectBoardCount();
		
		model.addAttribute("board",list);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/lectureData"));
		
		return "professor/lectureData";
	}
	//게시판 등록
	@RequestMapping("/professor/insertBoard")
	public String insertBoard(Model model) {
		
//		Professor p = service.professorView();
//		
//		model.addAttribute("prof",p);
		
		return "professor/insertBoard";
	}
	//게시판 보기
	@RequestMapping("/professor/selectBoardView")
	public ModelAndView selectBoardView(Model model, int profBoardNo) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("profBoard",service.selectBoardView(profBoardNo));
		mv.addObject("profAttachment",service.selectProfAttachment(profBoardNo));
		
		mv.setViewName("/professor/selectBoardView");
		
		return mv;
	}
	@RequestMapping("/professor/insertBoardEnd")
	public ModelAndView insertBoardEnd(MultipartFile[] upFile, HttpServletRequest req, ProfessorBoard pb) {

		String msg = "";
		String loc = "";
		
		ModelAndView mv = new ModelAndView();
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/SubjectProject");
		
		List<ProfBoardAttachment> list = new ArrayList<ProfBoardAttachment>();
		
		File dir = new File(saveDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int random = (int)(Math.random()*1000);
				String reName = sdf.format(System.currentTimeMillis())+"_"+random+ext;
				
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				ProfBoardAttachment pba = new ProfBoardAttachment();
				pba.setBoardOrifilename(oriFileName);
				pba.setBoardRefilename(reName);
				
				list.add(pba);
			}
			
		}
		
		try {
			service.insertBoardEnd(pb,list);
			msg = "작성 완료";
			loc = "/professor/lectureData";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg = "작성 실패";
			loc = "/professor/insertBoardEnd";
			logger.info("생성불가");
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
//	과목조회
	@RequestMapping("/professor/subjectCodeView")
	public String subjectCodeView(Model model) {
		
		List<Subject> list = service.subjectCodeView();
		
		model.addAttribute("list",list);
		
		return "professor/subjectList";
	}
	@RequestMapping(value="/professor/selectSubject", produces = "application/text; charset=utf8")
	@ResponseBody
	public String seletcSubject(String subCode,HttpServletResponse res) {
		
		ObjectMapper mapper = new ObjectMapper();
		logger.info("subCode : "+subCode);
		
		Map<String,String> map = service.selectSubject(subCode);

		
		String jsonStr = "";
		try {
			jsonStr = mapper.writeValueAsString(map); // 멤버변수에 있는 값 들을 전부 자바스크립트 객체방식으로 바꿈( {key:value} 형식으로 )
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=UTF-8");
		
		return jsonStr; // <- 받아온 객체가 넘어간다
	}
	
	//파일 다운로드용
	@RequestMapping("/professor/fileDownLoad")
	public void fileDownload(String oName, String rName, HttpServletRequest req, HttpServletResponse res) {
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/SubjectProfessor");
		
		File downFile = new File(saveDir+"/"+rName);
		
		try {
			FileInputStream fis = new FileInputStream(downFile);
			bis = new BufferedInputStream(fis);
			
			sos = res.getOutputStream();
			String resFileName = "";
			
			boolean isMSIE = req.getHeader("user-agent").indexOf("MSIE")!=-1 || req.getHeader("user-agent").indexOf("Trident")!=-1;
			
			if(isMSIE) {
				resFileName = URLEncoder.encode(oName, "UTF-8");
				resFileName = resFileName.replaceAll("\\+", "%20");
			}else {
				resFileName = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			res.setContentType("application/octet-stream;charset=utf-8");
			
			res.setContentLength((int)downFile.length());
			int read = 0;
			
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				sos.close();
				bis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}






























































