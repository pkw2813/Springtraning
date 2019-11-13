<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">강의 계획서</h4>
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
							</tr>
							<c:forEach items="${plan }" var="plan">
							<c:if test="${plan!=null }">
							<tr>
								<td style="width:80px;">${plan.planNo}</td>
								<td style="width:100px;">강의 계획서</td>
								<td><a href="${pageContext.request.contextPath }/professor/selectPlanView?planNo=${plan.planNo}">${plan.planSubName }수업 - ${plan.profName } 교수 계획서</a></td>
								<td style="width:100px;"><c:out value="${ plan.profName}"/></td>
								<td style="width:50px;"><fmt:formatDate value="${plan.planDate }" pattern="yyyy-MM-dd"/></td>
							</tr>
							</c:if>
							</c:forEach>
						</table>
					<div style="height:25px;"></div>
					<div>${pageBar }</div>
					</div>
					<div class="col-6">
					<form action="" method="post">
					<input type='text' class='btn' style="border:0.5px solid black;"/>
					<input type='submit' class='btn btn-dark' value='검색'/>
					</form>
					</div>
					<div class="col-6">
					<button onclick="fn_insertPlan();" class="btn btn-dark" style="float:right;">글쓰기</button>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</div>

<script>
	function fn_insertPlan(){
		location.href="${pageContext.request.contextPath}/professor/insertPlan";
	}
</script>

<style>
	th{
		background-color:snow;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>