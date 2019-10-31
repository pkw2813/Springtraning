<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH 대학교</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'/>
<link href="${path}/resources/css/login.css" rel="stylesheet" type='text/css'/>
<script src="${path }/resources/js/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	var emparr="";
	$(".login_stu").click(function(){
		$(".login_stu").removeClass(".hvr-bounce-to-right");
		$(".login_stu").css("backgroundColor","#46b8ff");
		$(".login_pro").css("backgroundColor","#abdbff");
		$(".login_emp").css("backgroundColor","#abdbff");
		$.ajax({
		    success:function(){
		    emparr="<form class='form-horizontal' action='${path }/login.hd'>";
		    emparr+="<input type='hidden' name='loginNo'value='s'/>"
		    emparr+="<input type='text' name='loginId' placeholder='학번을 입력해주세요' class='form-control input-md'>";
		    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
		    emparr+="<div class='spacing'>";
		    emparr+="<a href='#'>학번 / 비밀번호 찾기 </a><br/></div>";
		    emparr+="<label><input type='checkbox' name='idSave' /><small>아이디 저장</small></label>";
		    emparr+="<input type='submit' class='btn btn-info btn-sm pull-right' value='로그인'>";
		    emparr+="<button id='adm_btn' class='btn btn-info btn-sm pull-right adm_btn'>입학신청</button></form>"
			$(".panel-heading").html("<h3 class='panel-title'>학생 로그인</h3>");
		    $(".col-md-7").html(emparr);
		    }
		});
	});
	$(".login_pro").click(function(){
		$(".login_pro").removeClass(".hvr-bounce-to-right");
		$(".login_pro").css("backgroundColor","#46b8ff");
		$(".login_stu").css("backgroundColor","#abdbff");
		$(".login_emp").css("backgroundColor","#abdbff");
		$.ajax({
		    success:function(){
		    emparr="<form class='form-horizontal' action='${path }/login.hd'>";
		    emparr+="<input type='hidden' name='loginNo'value='p'/>"
		    emparr+="<input type='text' name='loginId' placeholder='사번을 입력해주세요' class='form-control input-md'>";
		    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
		    emparr+="<div class='spacing'>";
		    emparr+="<a href='#'>사번 / 비밀번호 찾기 </a><br/></div>";
		    emparr+="<label><input type='checkbox' name='idSave' /><small>아이디 저장</small></label>";
		    emparr+="<input type='submit' class='btn btn-info btn-sm pull-right' value='로그인'></form>";
			$(".panel-heading").html("<h3 class='panel-title'>교수 로그인</h3>");
		    $(".col-md-7").html(emparr);
		    }
		});
	});
	$(".login_emp").click(function(){
		$(".login_emp").removeClass(".hvr-bounce-to-right");
		$(".login_emp").css("backgroundColor","#46b8ff");
		$(".login_stu").css("backgroundColor","#abdbff");
		$(".login_pro").css("backgroundColor","#abdbff");
		$.ajax({
		    success:function(){
		    emparr="<form class='form-horizontal' action='${path }/login.hd'>";
		    emparr+="<input type='hidden' name='loginNo'value='e'/>"
		    emparr+="<input type='text' name='loginId' placeholder='사번을 입력해주세요' class='form-control input-md'>";
		    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
		    emparr+="<div class='spacing'>";
		    emparr+="<a href='#'>사번 / 비밀번호 찾기 </a><br/></div>";
		    emparr+="<label><input type='checkbox' name='idSave' /><small>아이디 저장</small></label>";
		    emparr+="<input type='submit' class='btn btn-info btn-sm pull-right' value='로그인'></form>";
			$(".panel-heading").html("<h3 class='panel-title'>교직원 로그인</h3>");
		    $(".col-md-7").html(emparr);
		    }
		});
	});
});



	

	
</script>

<body>
	<div class="middlePage">
		<div class="page-header">
			<h3 class="logo">
				안녕하세요 서울대학교 종합정보 시스템입니다.
			</h3>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">학생 로그인</h3>
			</div>
			<div class="panel-body" id="12">
				<div class="row">
					<div class="col-md-5">
						<div class="login_stu hvr-bounce-to-right">
							<p>학생</p>
						</div>
						<div class="login_pro hvr-bounce-to-right">
							<p>교수</p>
						</div>
						<div class="login_emp hvr-bounce-to-right">
							<p>교직원</p>
						</div>
					</div>
					<div class="col-md-7" style="border-left: 1px solid #ccc; height: 160px">
					
						<form class="form-horizontal" action="${path }/login.hd">
							<input type="hidden" name="loginNo" value="s"/>
							<input type="text" name="loginId" placeholder="학번을 입력해주세요" class="form-control input-md">
							<input type="password" name="loginPwd" placeholder="비밀번호를 입력해주세요" class="form-control input-md input_pwd">
							<div class="spacing">
								<a href="#">학번 / 비밀번호 찾기</a> <br />
							</div>
							<label>
								<input type="checkbox" name="checkboxes" id="checkboxes-0" value="1" /> 
								<small>아이디 저장</small>
							</label>
							<input type="submit" class="btn btn-info btn-sm pull-right" value="로그인"/>
							<button id="adm_btn" class="btn btn-info btn-sm pull-right adm_btn">입학신청</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>