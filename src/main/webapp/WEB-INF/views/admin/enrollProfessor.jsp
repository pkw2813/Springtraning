<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="container-fluid">
<div class="row">
	<div class="col-6">
		<c:forEach var="p" items="${colList}" varStatus="pv">
				<hr>
				<h4 style="margin: 0 auto; text-align: center;"><b>${p['COL_NAME']}</b></h4> 
				<hr>
			<table class="table">
			<tr>
		<th>번 호</th>
		<th>학과 명</th>
		<th>교수 번호</th>
		<th>교수 이름</th>
		<th>전화 번호</th>
		<th>이메일</th>
		<th> 주소</th>
		<th><input type="button" class="btn btn-outline-success btn-fw" onclick="insertNewStu(${stu.beforeStu});" value="등록"/></th>
	</tr>
			<c:forEach var="pro" items="${list}" varStatus="v">
						
					
					<c:if test ="${p['COL_CODE'] == pro['COL_CODE']}">
					<tr>
						<td>${v.index +1}</td>
						<td>${pro['DEPT_NAME'] }</td>
						<td>${pro['PROF_ID'] }</td>
						<td>${pro['PROF_NAME']}</td>
						<td>${pro['PHONE'] }</td>
						<td>${pro['EMAIL'] }</td>
						<td>${pro['ADDRESS'] }</td>
						<td>
					<input type="button" class="btn btn-outline-danger btn-fw" onclick="deleteBeforeStu(${stu.beforeStu});" value="삭제"/>
				</td>					
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</c:forEach>
	</div>
	</div>
	
</div>

<script>

function insertNewStu(result) {
	console.log(result);
	$.ajax({
		type : 'post',
		url: "${pageContext.request.contextPath}/insertNewStu.do",
		data : {"beforeStu" : result},
		success : function(data) {
			console.log(data);
		}

	});
}


function deleteBeforeStu() {

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
	/* div{
		border:0.3px solid coral;
	} */
</style>

	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>