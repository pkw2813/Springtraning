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
					<td><input type="text" value="" readonly/></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" value="" readonly/></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" value="" readonly/></td>
				</tr>
				<tr>
					<th>학과번호</th>
					<td><input type="text" value="" readonly/></td>
				</tr>	
				<tr>
					<th>이메일</th>
					<td><input type="email" value=""/></td>
				</tr>
				<tr>	
					<th>전화번호</th>
					<td><input type="tel" value=""/></td>
				</tr>
				<tr>	
					<th>주소</th>
					<td><input type="text" value=""/></td>
				</tr>
				<tr>	
					<th>성별</th>
					<td><input type="text" value="" readonly/></td>
				</tr>
				<tr>
					<th>주/야</th>
					<td><input type="text" value="" readonly/></td>
				</tr>
			</table>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">
					<button class="btn form-control" onclick="fn_updateProf();">
					수정
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