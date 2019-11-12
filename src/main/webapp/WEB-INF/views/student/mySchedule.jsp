<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>


	<style>
	
		tr, td, th {
			text-align: left;
			font-size: 13px;
			border:1px solid lightgray;
			cursor: auto;
		}
		
		input{
			width:100px;
		}
	
		table {
			width: 100%;
		}

		.marginLeft {
			margin-left:10px;
		}
		.btn btn-outline-primary btn-sm{
			
		}
		#classInfo>tr{
		font-size:25px;
		}
		
		#classInfoTitle>th{
		border:1px solid Lightgray;
		font-size:16px;
		font-family:arial;
		text-align:center;
		}
		
		#classInfo>td{
		border:1px solid Lightgray;
		font-size:16px;

		}
		/* button>*{
			height:28px;
			font-size:20px;
			font-weight:bold;
			
		} */
	</style>
	
	
	<div class="main-panel">
	<div class="content-wrapper">
	
				
		<!-- 시작 -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
					
	
	<table class="table table-default table-striped">
	<thead class="thead-dark">
	<tr>
	</tr>
      <tr>
        <th colspan="11" style="font-size:25px;font-family:arial">나의 수강신청 내역</th>
      </tr>
    </thead>
    
    	
				<tr>
				<!-- <td>이수구분
				<select id="chk_isu" name="chk_isu">
					<option value="">전체</option>
					<option value="전공필수">전공필수</option>
					<option value="교양필수">교양필수</option>
					<option value="전공선택">전공선택</option>
					<option value="교양선택">교양선택</option>
				</select>
				</td>
				
				<td>학부검색
				<select id="chk_school" name="chk_school">
					<option value="">선택</option>
					<option value="A">인문대학</option>
					<option value="B">공과대학</option>
					<option value="C">경영대학</option>
				</select>
				
				<td>학과검색
				<select id="chk_dept" name="chk_dept">
					<option id="school0" value="">대학을선택하세요</option>
					<option id="school1" value=""></option>
					<option id="school2" value=""></option>
					<option id="school3" value=""></option>
				</select>
			 -->
				<td>개설년도
				<select id="chk_year" name="chk_year">
					<option value="">전체</option>
					<option id="thisYear" value=""></option>
					<option id="year2" value=""></option>
					<option id="year3" value=""></option>
					<option id="year4" value=""></option>
					<option id="year5" value=""></option>
				</select>
				</td>
				
				<td>개설학기
				<select id="chk_sem" name="chk_sem">
					<option value="">전체</option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				</td>
				</tr>
				</table>
				<br><br>
				<table class="table table-default table-striped" >
				<tr>
				<td style="width:200px;">교시</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				</tr>
				<tr>
				<td>1교시 (09:00~09:50)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
				<tr>
				<td>2교시 (10:00~10:50)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
				<tr>
				<td>3교시 (11:00~11:50)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
				<tr>
				<td>4교시 (12:00~12:50)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
				<tr>
				<td>5교시 (13:00~13:50)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
				<tr>
				<td>6교시 (14:00~14:50)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
				<tr>
				<td>7교시 (14:00~14:50)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
			
				</table>
				
				<%-- </td>
				<td >교과목명검색
				<input type="text" name="chk_subName"></input>&nbsp&nbsp<button style="font-size:12px;font-weight:bold;height:25px;" class="btn btn-primary btn-xs"type="submit">검색</button>
				</td>
				</tr>
				</table>
				
				</form>
				<br>
				<br>
				<table class="table table-sm table-hover table-striped">
				<tr>
				<thead class="thead-light">
				      <tr>
				        <th colspan="13" style="font-size:25px;font-family:arial">신청내역</th>
				      </tr>
				    </thead>
				</tr>
				<tr id="classInfoTitle">
				<th>순번</th>
				<th>학기</th>
				<th>교과목명</th>
				<th>과목명</th>
				<th>담당교수</th>
				<th>이수구분</th>
				<th>이수학점</th>
				<th>강의시간</th>
				<th>현재수강여석</th>
				<th>강의실</th>
				<th>취소</th>
				<th>신청결과</th>
				</tr>
				<c:if test='${list eq null}'> --%>
				</tr>
				</table>
				<%-- <table>
				<tr id=classInfo>
				<td>
				<image id="LoadImg" height="200px" width="150px" src="${path }/resources/images/image/selectNothing.png"/>
				</td>
				</tr>
				</c:if>
				
				<c:if test='${list ne null}'>
				<c:forEach items="${list}" var="e" varStatus="v">
				<tr id="classInfo">
				<td><c:out value='${e["ROWNUM"] }'/></td>
				<td><c:out value='${e["SUB_YEAR"]}'/>-<c:out value='${e["SUB_SEMESTER"]}'/></td>
				<td><c:out value='${e["T_DEPT"] }'/></td>
				<td><c:out value='${e["SUB_NAME"] }'/></td>
				<td><c:out value='${e["PROF_NAME"] }'/></td>
				<td><c:out value='${e["SUB_TYPE"] }'/></td>
				<td>최대: <c:out value='${e["COMPLETE_PT"] }'/></td>
				<td>매주: <c:out value='${e["SUB_DATE"] }'/> <c:out value='${e["SUB_TIME"] }'/></td>
				<td><c:out value='${e["PRE_CAPA"] }'/>/<c:out value='${e["CAPACITY"] }'/></td>
				<td><c:out value='${e["SUB_ROOM"] }'/></td>
				
				<c:if test='${e["OPEN_YN"] eq "Y"}'>
			
				
				<td style="text-align:center">
				
				<c:if test='${e["CHECK_IN"] eq null or e["CHECK_IN"] ne loginMember.stuNo}'>
				<button id="button-applyClass" style="font-size:12px;font-weight:bold;height:25px;" onclick="applyClass(this.id,this.value)" class="btn btn-primary btn-xs"
				value='${loginMember.stuNo },${e["SUB_CODE"]},${e["PROF_ID"]},${e["SUB_YEAR"]}-${e["SUB_SEMESTER"]}'>신청</button>
				</c:if>
				
				<c:if test='${e["CHECK_IN"] eq loginMember.stuNo}'>
				<button id="button-cancelClass" style="font-size:12px;font-weight:bold;height:25px;" onclick="cancelClass(this.id,this.value)" class="btn btn-danger btn-xs"
				value='${loginMember.stuNo},${e["SUB_CODE"]},${e["PROF_ID"]},${e["SUB_YEAR"]}-${e["SUB_SEMESTER"]}'>취소</button>
				</td>		
				</c:if>
				</c:if>
				<td style="text-align:center">
				결과출력
				</td>
				</tr>
				
				</c:forEach>
				</c:if>
				</table>
				<br><br>
				${pageBar}
				<form name="popForm">
			    <input type="hidden" id="profEvalForm" name="profEvalForm" value=""/>
				</form> --%>
				
		

			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<script>
		
	
		/* 년도 띄워주기 */
		var today = new Date();
		var yyyy = today.getFullYear();
		console.log(yyyy);
		$("#thisYear").attr("value",yyyy);
		$("#thisYear").text(yyyy);
		$("#year2").attr("value",(yyyy-1));
		$("#year2").text((yyyy-1));
		
		$("#year3").attr("value",(yyyy-2));
		$("#year3").text((yyyy-2));
		
		$("#year4").attr("value",(yyyy-3));
		$("#year4").text((yyyy-3));
		
		$("#year5").attr("value",(yyyy-4));
		$("#year5").text((yyyy-4));
		
	
	/* 	
		$('#chk_school').change(function () {
			
			if (!$(this).val()) {
				 
				$("#school1").attr("value","");
				$("#school1").text("");
				$("#school2").attr("value","");
				$("#school2").text("");
				$("#school3").attr("value","");
				$("#school3").text("");
		  }
			  if ($(this).val() === 'A') {
				 
					$("#school1").attr("value","국어국문학과");
					$("#school1").text("국어국문학과");
					$("#school2").attr("value","영어영문학과");
					$("#school2").text("영어영문학과");
					$("#school3").attr("value","철학과");
					$("#school3").text("철학과");
			  }
			  else if ($(this).val() === 'B') {
				
				 	$("#school1").val("기계공학과");
					$("#school1").text("기계공학과");
					$("#school2").val("컴퓨터공학과");
					$("#school2").text("컴퓨터공학과");
					$("#school3").val("전자공학과");
					$("#school3").text("전자공학과");
			  }
			  else if ($(this).val() === 'C') {
					 
				  	$("#school1").val("호텔관광학과");
					$("#school1").text("호텔관광학과");
					$("#school2").val("회계학과");
					$("#school2").text("회계학과");
					$("#school3").val("경영학과");
					$("#school3").text("경영학과");
			  }
			});
		
		
	
		
 	function cancelClass(id,value){
			
 		if (confirm("취소하시겠습니까?") == true){    //확인
 			
 			var data={value};
			 $.post({
		            url: "${path}/student/cancelMyClass.hd",
		            type: "post",
		            data: data,
		            success: function(data){
		                	alert("재신청은 기간내 조회/신청페이지에서 가능합니다");
		                	location.href="${path}/student/myClassInfo.hd"; 
		                	
		            },
		            error: function(){
		                alert("에러처리");
		            }
		        });
		 }else{   //취소

		     return false;

		 }
 		
 		
			
			 
 	}
		
	 */
	
	</script>
	
	
		 

	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>