<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>
	
<!-- 카카오 주소 찾기 API -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<style>
	
		tr, td, th {
			text-align: left;
			font-size: 13px;
		
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
		#button{
			height:28px;
			font-size:14px;
			font-weight:bold;
			
		}
	</style>
	
	
	<div class="main-panel">
	<div class="content-wrapper">
	
				
		<!-- 시작 -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
					
	<form method="post" action="${path }/student/studentInfoUpdateEnd.hd" enctype="multipart/form-data">
	
	<table class="table table-default table-striped">
	<thead class="thead-dark">
	<tr>
	</tr>
      <tr>
        <th colspan="11" style="font-size:25px;font-family:arial">강의조회/신청</th>
      </tr>
    </thead>
    	
				<tr>
				<td>시간표 구분
				<input type="radio" name="chk_major" value="전공">전공
				<input type="radio" name="chk_major" value="교양">교양
				</td>
				<td>이수구분
				
				<select id="chk_isu" name="chk_isu" >
					<option value=>전체</option>
					<option value="전공필수">전공필수</option>
					<option value="교양필수">교양필수</option>
					<option value="전공선택">전공선택</option>
					<option value="교양선택">교양선택</option>
				</select>
				</td>
				<td>학부분류
				
				<select id="chk_hakbu" name="chk_hakbu" width="100px" >
					<option value=>전체</option>
					<option value="경영대학">경영대학</option>
					<option value="인문대학">인문대학</option>
					<option value="공과대학">공과대학</option>
				</select>
				</td>
				<td>개설년도
			
				<select id="chk_hakbu" name="chk_year" >
					<option id="thisYear" value=""></option>
					<option id="year2" value=""></option>
					<option id="year3" value=""></option>
					<option id="year4" value=""></option>
					<option id="year5" value=""></option>
				</select>
				</td>
				<td>개설학기
				
				<select id="chk_sem" name="chk_sem">
					<option value=>전체</option>
					<option value="1">1학기</option>
					<option value="2">2학기</option>
				</select>
				</td>
				<td>주야구분
				<select id="chk_night" name="chk_night">
					<option value=>전체</option>
					<option value="주간">주간</option>
					<option value="야간">야간</option>
				</select>
				</td>
				<td >교과목명검색
				<input type="text" name="chk_no"></input>
				</td>
				</tr>
				</table>
				<br>
				<br>
				<table class="table table-sm table-hover table-striped">
				<tr>
				<thead class="thead-light">
				      <tr>
				        <th colspan="13" style="font-size:25px;font-family:arial">강의 시간표</th>
				      </tr>
				    </thead>
				</tr>
				<tr id="classInfoTitle">
				<th>순번</th>
				
				<th>교과목명</th>
				<th>과목명</th>
				<th>담당교수</th>
				<th>이수구분</th>
				<th>이수학점</th>
				<th>강의시간</th>
				<th>수강여석</th>
				<th>강의실</th>
				<th>수강평</th>
				<th>신청/철회</th>
				</tr>
				<c:forEach items="${list}" var="e" varStatus="v">
				<tr id="classInfo">
				<td><c:out value='${e["ROWNUM"] }'/></td>
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
				<button id="button" class="btn btn-primary btn-xs">보기</button>
				</td>
				<td style="text-align:center">
				<button id="button"class="btn btn-primary btn-xs">신청</button>
				</c:if>
				<c:if test='${e["OPEN_YN"] eq "N"}'>
				<td></td>
				<td></td>
				</c:if>
				</td>
				</tr>
				</c:forEach>
				</table>
				
					<%-- <th style="text-align:center;font-size:15px;" rowspan="6"  width="200px">
						
					
			<th>학생번호</th>
			<td><input type="text" value="${student.stuNo}" style="width:130px" required disabled/>
				<input type="hidden" name="stuNo" value="${student.stuNo}"/>
			</td>
			
		<tr>
			<th>입학년월</th>
			<td><input type="text" value="<fmt:formatDate value="${student.enterDate}" pattern="yyyy-MM-dd"/>" required disabled/></td>
			<th>학적상태</th>
			<td>
				<select id="regStatus" name="regStatus" width="100px" disabled>
					<option value=>선택없음</option>
					<option value="재학">재학</option>
					<option value="휴학">휴학</option>
					<option value="졸업">졸업</option>
					<option value="제적">제적</option>
				</select>
			</td>
			<th>
				주소
			</th>
			
			
		</tr>
			
			<tr>
				
				<th>학년학기</th>
				<td><input type="text" value="${student.stuYearSem}" required disabled/></td>
				<th>최대학점</th>
				<td><input type="text" value="${student.maxPsbCr}" required disabled/></td>
				<th>인정학기</th>
				<td><input type="text" value="${student.conSemester}" required disabled/></td>
			</tr>
	</table>
	<div class="card-footer" style="text-align : center;">
	 <input type="submit" id="submit" value="수정완료" class="btn btn-primary"/> --%>
	 

	</form>
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
		
	
		
	
	
	</script>
	
	
		 

	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>