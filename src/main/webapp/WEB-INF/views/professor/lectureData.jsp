<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/son_pro_header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">공지 사항</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-12">
						<table class="table">
							<tr>
								<th>번호</th>
								<th>분류</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<tr>
								<td>1</td>
								<td>공지사항</td>
								<td><a href="#">공지사항입니다</a></td>
								<td><c:out value="${ prof.profName}"/></td>
								<td>2019-10-29</td>
								<td>23</td>
							</tr>
							<tr>
								<td>1</td>
								<td>공지사항</td>
								<td>공지사항입니다</td>
								<td>아무개</td>
								<td>2019-10-29</td>
								<td>23</td>
							</tr>
							<tr>
								<td>1</td>
								<td>공지사항</td>
								<td>공지사항입니다</td>
								<td>아무개</td>
								<td>2019-10-29</td>
								<td>23</td>
							</tr>
						</table>
					</div>
					<div class="col-6">
					<form action="" method="post">
					<input type='text' class='btn' style="border:0.5px solid black;"/>
					<input type='submit' class='btn btn-info' value='검색'/>
					</form>
					</div>
					<div class="col-6">
					<button onclick="fn_insertBoard();" class="btn btn-info" style="float:right;">글쓰기</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>
	function fn_insertBoard(){
		location.href="${pageContext.request.contextPath}/professor/insertBoard";
	}
</script>

<style>
	div{
		border:0.3px solid coral;
	}
	th{
		background-color:snow;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>