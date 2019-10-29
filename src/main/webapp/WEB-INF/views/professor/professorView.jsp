<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

<div class="container-fluid">
	<div class="row">
		<div class="col-10">
			<table class="table">
				<tr>
					<th>교번</th>
					<td>124</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>홍길동</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>671021-1024231</td>
				</tr>
				<tr>
					<th>학과번호</th>
					<td>201</td>
				</tr>	
				<tr>
					<th>이메일</th>
					<td>king@naver.com</td>
				</tr>
				<tr>	
					<th>전화번호</th>
					<td>01012341234</td>
				</tr>
				<tr>	
					<th>주소</th>
					<td>서울특별시 강동구 길동</td>
				</tr>
				<tr>	
					<th>성별</th>
					<td>남</td>
				</tr>
				<tr>
					<th>주/야</th>
					<td>주간</td>
				</tr>
			</table>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">
					<button class="btn form-control" onclick="fn_updateProf();">
					정보수정
					</button>
				</div>
				<div class="col-4"></div>
			</div>
		</div>
		<div class="col-2">
			<div class="gap2">
				이미지 사진<img src=""/>
			</div>
			<div class="gap0"></div>
			<div class="gap3">
				현재 진행중인 과목
			</div>
		</div>
	</div>
</div>

<script>
	function fu_updateProf(){
		location.href="${pageContext.request.contextPath}/professor/updateProf";
	}
</script>

<style>
	.gap0{
		height:50px;
	}
	.gap1{
		height:100px;
	}
	.gap2{
		height:200px;
	}
	.gap3{
		height:300px;
	}
	div{
		border:0.3px solid coral;
	}
</style>

	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>