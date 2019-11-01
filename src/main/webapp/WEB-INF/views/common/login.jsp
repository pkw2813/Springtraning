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
		    emparr+="<button type='button' id='adm_btn' class='btn btn-info btn-sm pull-right adm_btn'>입학신청</button></form>"
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

<style>
	.modal{
		display: none;
		position : fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height:100%;	
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
		
	
</style>

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
							<button type="button" id="adm_btn" class="btn btn-info btn-sm pull-right adm_btn" onclick="enrollStudent();">입학신청</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달창  -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>입학 신청</p>
			<div class="form-group">
				<label class="control-label">EMAIL</label>
					<input type="text" id="email" name="email" placeholder="이메일을 입력하세요" class="form-control" />
					<button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button>
					<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
			</div>
			<input type="hidden" path="random" id="random" value="${random }" />
		</div>
	</div>	
	
	
	
	
</body>

<script>


function enrollStudent() {
   $(".modal").css("display","block");
   
   $.ajax({
	   url : "<c:url value='/email.do'/>",
		success : function(data) {
			console.log(data);
			$("#random").val() = data;
		}
   });
}


$(function(){
	$(".close").click(function(){
		$(".modal").css("display","none");
	});
});
$(function() {
window.on("click",function() {
	if(event.target == $("#mymodal")) {
		$(".modal").css("display","none");	
	}
}) 
});

$(function(){
	/*이메일 인증 버튼 클릭시 발생하는 이벤트	*/
	$(document).on("click", "#emailBtn", function(){
	/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
	$.ajax({
		/* beforeSend: function(){
		loadingBarStart();
		}, */
			type:"get",
			url : "<c:url value='/login/createEmailCheck.do'/>",
			data : "userEmail=" + $("#email").val() + "&random=" + $("#random").val(),
				//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
				/* encodeURIComponent
				예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
				중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
				그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
				success : function(data){
					alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
				},
				error: function(data){
					alert("에러가 발생했습니다.");
					console.log(data);
					return false;
				}
			})
			})
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	*/
	$(document).on("click", "#emailAuthBtn", function(){
		$.ajax({
			/* beforeSend: function(){
			loadingBarStart();
			}, */
				type:"get",
				url:"<c:url value='/login/emailAuth.do'/>",
				data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
				success:function(data){
					if(data=="complete"){
					alert("인증이 완료되었습니다.");
					}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
					}
					},
				complete: function(){
					loadingBarEnd();
					},
				error:function(data){
					alert("에러가 발생했습니다.");
					}
					});
			});
			})
</script>



</html>