package com.kh.finalProject.professor.common;

public class PageFactory {

public static String getPageBar(int totalCount, int cPage, int numPerPage, String url) {
		
		String pageBar = "";
		int pageBarSize = 5;
		
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize-1;
		
		int totalPage = (int)Math.ceil((double)totalCount/numPerPage);
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
			
		}else {
			
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
			
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			
			if(cPage==pageNo) {
				
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
				
			}else {
				
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar += "</li>";
				
			}
			pageNo++; //이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} //while문 끝
		
		if(pageNo > totalPage) {
			
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";
			
		}else {
			
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar += "</li>";
			
		}
		
		pageBar += "</ul>";
		
		pageBar += "<script>function fn_paging(cPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage";
//		pageBar += "location.href='"+url+"?cPage='+cPage"; <-- function안에 있는 매개변수는 현재 페이지를 보내야함
//		'"+url+"?cPage='+cPage"; 로 보낸 value값은 변수로 인식한다.
		pageBar += "} </script>";
		
		return pageBar;
		
	}
public static String getAjaxPageBar(int index, int totalCount, int cPage, int numPerPage, String url) {
	
	String pageBar = "";
	int pageBarSize = 5;
	
	int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
	int pageEnd = pageNo + pageBarSize-1;
	
	int totalPage = (int)Math.ceil((double)totalCount/numPerPage);
	
	pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
	
	if(pageNo==1) {
		
		pageBar += "<li class='page-item disabled'>";
		pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
		pageBar += "</li>";
		
	}else {
		
		pageBar += "<li class='page-item'>";
		pageBar += "<a class='page-link' href='javascript:ajaxData("+index+","+(pageNo-1)+")'>이전</a>";
		pageBar += "</li>";
		
	}
	
	while(!(pageNo>pageEnd||pageNo>totalPage)) {
		
		if(cPage==pageNo) {
			
			pageBar += "<li class='page-item active'>";
			pageBar += "<a class='page-link'>"+pageNo+"</a>";
			pageBar += "</li>";
			
		}else {
			
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:ajaxData("+index+","+pageNo+")'>"+pageNo+"</a>";
			pageBar += "</li>";
			
		}
		pageNo++; //이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
	} //while문 끝
	
	if(pageNo > totalPage) {
		
		pageBar += "<li class='page-item disabled'>";
		pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
		pageBar += "</li>";
		
	}else {
		
		pageBar += "<li class='page-item'>";
		pageBar += "<a class='page-link' href='javascript:ajaxData("+index+","+(pageNo)+")'>다음</a>";
		pageBar += "</li>";
		
	}
	
	pageBar += "</ul>";
	
	
	return pageBar;
	
}
}