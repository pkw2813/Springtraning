<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
#choiceClass select, #choiceYear select, #choiceSeme select {
	color: black;
}
</style>

<div class="main-panel">
	<div class="content-wrapper">
	
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">공지 게시판</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		
		<div class="row" style="text-align : center;">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
	    <form id="boardForm" name="boardForm" method="post">
	        <table class="table table-striped table-hover">
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>날짜</th>
	                    <th>조회수</th>
	                </tr>
	            </thead>
	            <tbody>
	                <%-- <c:forEach var="result" items="${list }" varStatus="status"> --%>
	                    <tr>
	                        <td><c:out value="1"/></td>
	                        <td><a href='#' onClick='fn_view();'><c:out value="제목"/></a></td>
	                        <td><c:out value="작성자"/></td>
	                        <td><c:out value="작성일"/></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td><c:out value="1"/></td>
	                        <td><a href='#' onClick='fn_view();'><c:out value="제목"/></a></td>
	                        <td><c:out value="작성자"/></td>
	                        <td><c:out value="작성일"/></td>
	                        <td></td>
	                    </tr>
	                <%-- </c:forEach> --%>
	            </tbody>
	        </table>
    	</form>
    	<div class="card-body">
    	
    	</div>
    	<div class="card-footer" style="text-align : left;">
            <a href='#' onClick='fn_write()' class="btn btn-success">공지사항 작성</a>            
    	</div>
      </div>
   </div> 
<script>
//글쓰기
function fn_write(){
    
    var form = document.getElementById("boardForm");
    
    form.action = "<c:url value='/board/writeForm.do'/>";
    form.submit();
    
}
 
//글조회
function fn_view(code){
    
    var form = document.getElementById("boardForm");
    var url = "<c:url value='/board/viewContent.do'/>";
    url = url + "?code=" + code;
    
    form.action = url;    
    form.submit(); 
}
</script>
					<div class="card-footer">
					</div>
				</div>
			</div>
		</div>
		<!-- 본문 끝 -->
		<!-- 게시판 내용 모달 시작  -->
		
		<!-- 게시판 내용 모달 끝  -->



	<!-- Main-content End -->

	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />