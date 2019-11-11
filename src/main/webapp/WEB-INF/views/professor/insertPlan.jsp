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
				<!-- <div class="row"><p style="font-size:25px;">글작성</p></div> -->
				<form action="${pageContext.request.contextPath }/professor/insertBoardEnd" method="post">
					<div class="row" style="text-align:center;">
						<div class="col-6">
							학년도 / 학기: 2019 학년도 1학기
						</div>
						<div class="col-6">
							OOO 수업계획서
						</div>
					</div>
					<div class="row" style="text-align:center;">
						<div class="col-6">
							교 과 목 명 : 국어국문
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-3">
							d
						</div>
						<div class="col-3">
						<div class="row">
							<div class="col-12">1</div>
						</div>
						<div class="row">
							<div class="col-12">2</div>
						</div>
						</div>
						<div class="col-6">
							d
						</div>
					</div>
							<table class="spacing">
								
							</table>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4"></div>
						<div class="col-4">&nbsp;
							<input class="btn btn-dark" type='submit' value=" 글 작성 "/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='button' id="boardView" class="btn btn-dark" value=" 글 목록 ">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	
	$(function(){
		$("#boardView").click(function(){
			history.back();
		});
	});

</script>

<style>
	div{
		border:1px solid coral;
	}

	.spacing{
		border-spacing:4px;
	    border-collapse: separate;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>