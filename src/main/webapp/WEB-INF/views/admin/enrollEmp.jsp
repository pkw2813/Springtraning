<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="main-panel">
		<div class="content-wrapper">
<div class="card card-body">
 <div class="col-6">
	 <select class="form-control selectCol col-sm-5" style="display: inline-block; margin-right: 5px;" name ='beforeColCode'>								
		 </select>
		 <!-- 여기에 학과 선택 넣어야함 .selectCol -->
		 <select class="form-control selectdep col-sm-5"  style="display: inline-block; margin-left: 5px;" name='beforeDeptCode' required>
			 </select>
			 
			 <table class="table">
				 <tr>
					 <th>번 호</th>
					 <th>근무 학과</th>
					 <th>교직원 번호</th>
					 <th>교직원 이름</th>
					 <th>전화 번호</th>
					 <th>이메일</th>
					 <th> 주소</th>
					 <th><input type="button" class="btn btn-outline-success btn-fw" onclick="insertNewProf();" value="등록"/></th>
				 </tr>
		 <c:forEach var="emp" items="${list}" varStatus="v">
					 
				 <tr>
					 <td>${v.count}</td>
					 <td>${emp['DEPT_NAME'] }</td>
					 <td>${emp['PROF_ID'] }</td>
					 <td>${emp['PROF_NAME']}</td>
					 <td>${emp['PHONE'] }</td>
					 <td>${emp['EMAIL'] }</td>
					 <td>${emp['ADDRESS'] }</td>
					 <td>
				 <input type="button" class="btn btn-outline-danger btn-fw" onclick="deleteProf();" value="삭제"/>
			 </td>					
		 </tr>
	 </c:forEach>
 </table>
 </div>
 <div class="card-footer">
		 ${pageBar }
	 </div>

</div>
 




<script>
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
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>