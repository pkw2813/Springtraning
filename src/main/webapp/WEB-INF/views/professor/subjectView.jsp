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
<form action="" method="post">
<div class="row" style="border-bottom:1.8px solid gray;">
	<div class="col-6">
		<h4 style="color:black;font-weight:normal;margin:5px;">개설 과목 조회</h4>
	</div>
	<div class="col-6">
		<input id="insertSubject" style="width:80px;border:0.5px solid black;background-color:lightgray;float:right;margin:5px;" class="" type='submit' value="등록"/>
	</div>
</div>

<div class="row" style="margin:6px;border:2px solid lightgray;height:565px;">
	<div class="col-12">
			<table class="spacing">
				<tr>
					<th>개설학기</th>
					<td><input id="fn_year" type='number' min="2019" max="2050" style="width:100px;"/> 년도 </td>
					<td><select>
						<option value="1학기">&nbsp; 1학기 &nbsp;</option>
						<option value="2학기">&nbsp; 2학기 &nbsp;</option>
					</select></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td>
					<input type='text' style="width:200px;">&nbsp;&nbsp;<input type='text' style="width:100px;text-align:center;" placeholder="과목코드" required/>
					</td>
					
				</tr>
				<tr>
					<th>과목설명</th>
					<td>
						<textarea class="textsize" placeholder="200자 이내로 작성"
						style="width:450px;height:70px;background-color:lightgray;resize:none;font-size:10px;"></textarea>
					</td>
				</tr>
			</table>
			<!-- row start -->
			<div class='row'>
				<div class="col-6">
					<table class="spacing">
						<tr>
							<th>교수명</th>
							<td><input type='text' required/></td>
						</tr>
						<tr>
							<th>수강학과</th>
							<td><input type='text' required/></td>
						</tr>
						<tr>
							<th>수강과정</th>
							<td><input type='text' required/></td>
						</tr>
						<tr>
							<th>개설구분</th>
							<td><select class="selectBox">
								<option value="" selected>주간</option>
								<option value="">야간</option>
							</select></td>
						</tr>
						<tr>
							<th>수강학년</th>
							<td><select class="selectBox">
								<option value="" selected>1학년</option>
								<option value="">2학년</option>
								<option value="">3학년</option>
								<option value="">4학년</option>
							</select>
							&nbsp; ~ &nbsp;
							<select class="selectBox">
								<option value="">1학년</option>
								<option value="">2학년</option>
								<option value="">3학년</option>
								<option value="">4학년</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>단 위</th>
							<td><input style="width:60px;" type='number' required/> &nbsp; 학점</td>
						</tr>
					</table>
				</div>
				<div class="col-6">
					<table class="spacing">
						<tr>
							<th>연락처</th>
							<td><input type='text' required/></td>
						</tr>
						<tr>
							<th>분반</th>
							<td><input type='text' required/></td>
						</tr>
						<tr>
							<th>전공</th>
							<td><input type='text' required/></td>
						</tr>
						<tr>
							<th>이수구분</th>
							<td><select class="selectBox">
								<option value="">교필</option>
								<option value="">교선</option>
								<option value="">전필</option>
								<option value="">전선</option>
							</select></td>
						</tr>
						<tr>
							<th>타교생 허용</th>
							<td><select class="selectBox">
								<option value="">가능</option>
								<option value="">불가능</option>
							</select></td>
						</tr>
						<tr>
							<th>단 위</th>
							<td><input style="width:60px;" type='number' required/> &nbsp; 시간</td>
						</tr>
					</table>
				</div>
			</div> <!-- row End -->
			<div class='row'> <!-- row start -->
				<div class="col-12"> <!-- col-12 start -->
					<table class="spacing">
						<tr>
							<th>평가기준</th>
							<th style="width:50px;">중간</th><td><input style="width:60px;background-color:snow" type='text'/></td>
							<th style="width:50px;">기말</th><td><input style="width:60px;background-color:snow" type='text'/></td>
							<th style="width:50px;">과제</th><td><input style="width:60px;background-color:snow" type='text'/></td>
							<th style="width:50px;">출석</th><td><input style="width:60px;background-color:snow" type='text'/></td>
						</tr>
						<tr>
							<th>과제기준</th>
							<th style="width:50px;">과제A</th><td><input style="width:60px;background-color:snow" type='text'/></td>
							<th style="width:50px;">과제B</th><td><input style="width:60px;background-color:snow" type='text'/></td>
							<th style="width:50px;">과제C</th><td><input style="width:60px;background-color:snow" type='text'/></td>
							<th style="width:50px;">과제D</th><td><input style="width:60px;background-color:snow" type='text'/></td>
						</tr>
					</table>
				</div> <!-- col-12 End -->
					<div class="col-6">
						<table class="spacing">
							<tr>
								<th>정 원</th>
								<td><input type='number' style="width:60px;"/> 명 </td>
							</tr>
							<tr>
								<th>교재 사용</th>
								<td><select class="selectBox">
									<option value="">사용</option>
									<option value="">미사용</option>
								</select></td>
							</tr>
						</table>
					</div>
					<div class="col-6">
						<table class="spacing">
							<tr>
								<th>재수강여부</th>
								<td><select class="selectBox">
									<option value="" selected>미사용</option>
									<option value="">사용</option>
								</select></td>
							</tr>
							<tr>
								<th>교재 제목</th>
								<td><input type='text'/></td>
							</tr>
						</table>
					</div>
					<div class="row gap2"></div>
					<div class="col-12">
						<table class="spacing">
							<tr>
								<th style="width:150px;">강의계획서 첨부파일</th>
								<td><input type='file'/></td>
							</tr>
						</table>
					</div>
			</div> <!-- row End -->
	</div> <!-- col-12 End -->
</div>
</form>


</body>

<script>
//textarea 글자수 제한
$(function(){
	$('.textsize').on('keyup', function() {
		if($(this).val().length > 200) {
			alert("글자수는 200자로 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 200));
		}
	});
});

$(function(){
	$("#fn_year").on('blur', function(){
		if($(this).val()<'2019'){
			alert("이전 년도는 불가능합니다.");
			$(this).val('');
		}return;
	});
});

$(function(){
	$("#insertSubject").click(function(){
		if(confirm("등록 하시겠습니까?")==true){
			document.from.submit();
		}else{
			return false;
		}
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
	table tr th{
		
		text-align:center;
		font-size:13px;
		width:100px;
		background-color:lightgray;
		border:0.5px solid lightgray;
	}
</style>

</html>