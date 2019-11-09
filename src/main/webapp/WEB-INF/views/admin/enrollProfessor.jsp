<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="container-fluid">
<div class="row">
	<div class="col-6">
		<hr>
		<div>
			<h4 style="margin: 0 auto; text-align: center;" ><b class="titleCol">${p['COL_NAME']}</b></h4> 
		</div>				
		<hr>
		<select class="form-control selectCol col-sm-5" style="display: inline-block; margin-right: 5px;" name ='beforeColCode'>								
			</select>
			<!-- 여기에 학과 선택 넣어야함 .selectCol -->
			<select class="form-control selectdep col-sm-5"  style="display: inline-block; margin-left: 5px;" name='beforeDeptCode' required>
				</select>
				
				<c:forEach var="p" items="${colList}" varStatus="pv">
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
						<td>${v.count}</td>
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


$(function() {
	$(document).ready(function(){

		$.ajax({
			type : "post",
			url: "${pageContext.request.contextPath}/selectColList.do",
			success: function(data) {
				let colListHtml = "";
				
				colListHtml = "<option value='select' id='selCol'>대학 선택</option>";
				for(let i = 0; i < data.list.length; i++) {
					let cols = data.list[i];
					console.log(cols['COL_CODE']);

					colListHtml += "<option value='"+cols['COL_CODE']+"'  class='colList'>"+cols['COL_NAME']+"</option>";
				}
				 	
				$('.selectCol').html(colListHtml);
					$('.selectCol').change(function(){
						$('.titleCol').val($('.selectCol').val());
					$("#selCol").attr('disabled',true);
			
		
	})
			
			}
		})
	})
});



//대학이 선택 되었을때 해당 대학에 포함되어 있는 학과를 리스트로 가져옴
 $(function(){
 	$('.selectCol').change(function(){
 		let val = $('.selectCol').val();
		$.ajax({
			type : "post",
			url: "${pageContext.request.contextPath}/selectDeptList.do",
			data: {"result" : $('.selectCol').val()},
			success: function(data) {
				let deptListHtml = "<option value='select' id='selDept'>학과 선택</option>";
				for(let i = 0; i < data.list.length; i++) {
					let depts = data.list[i];

					deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
				}
				
				$('.selectdep').html(deptListHtml);
					$('.selectdep').change(function(){
					$("#selDept").attr('disabled',true);
		});
 	}
 });
	 });
 });




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