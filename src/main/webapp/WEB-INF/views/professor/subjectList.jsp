<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/demo/chart-pie-demo.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개설 과목 조회</title>
</head>
<body style="overflow-y:hidden;overflow-x:hidden;">

<div class="row gap1"></div>
	<table class="table">
		<tr>
			<th>개설년도</th>
			<th>강의대상 학년</th>
			<th>학기구분</th>
			<th>교과목명</th>
			<th>이수학점</th>
			<th>과목코드</th>
			<th>강의대상 학과</th>
			<th>강의목표</th>
			<th>이수구분</th>
			<th>학과번호</th>
			<th>강의실</th>
			<th>강의요일</th>
			<th>강의시간</th>
		</tr>
		<c:forEach items="${list }" var="subject">
			<tr>
				<td>${subject.SUB_YEAR }</td>
				<td>${subject.TARGET_GRADE }학년</td>
				<td>${subject.SUB_SEMESTER }학기</td>
				<td><input style="color:blue;" type='button' class="btn btn-default selectSubject" value="${subject.SUB_NAME }"/></td>
				<td>${subject.COMPLETE_PT }점</td>
				<td>${subject.SUB_CODE }</td>
				<td>${subject.DEPT_NAME }</td>
				<td>${subject.TARGET_SUBJECT }</td>
				<td>${subject.SUB_TYPE }</td>
				<td>${subject.DEPT_CODE }</td>
				<td>${subject.SUB_ROOM }</td>
				<td>${subject.SUB_DATE }</td>
				<td>${subject.SUB_TIME }</td>
			</tr>
		</c:forEach>

	</table>


</body>

<script>
$(function(){
	$(".selectSubject").click(function(){
		var subCode = $(this).parent().next().next().html();
		console.log(subCode);
		window.opener.selectSubject(subCode);
		self.close();
	});
});


</script>

<style>
	select[class="selectBox"]{
		appearance: none;
	}
/* 	div{
		border:0.2px solid coral;
	} */
	.gap1{
		height:30px;
	}
	.gap2{
		height:80px;
	}
	.spacing{
		border-spacing:4px;
	    border-collapse: separate;
	}
	table tr{
		
		text-align:center;
		font-size:13px;
		width:100px;
		border:0.5px solid lightgray;
	}
	table tr th{
		background-color:lightgray;
	}
</style>

</html>