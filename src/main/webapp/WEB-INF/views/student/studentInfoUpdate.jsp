<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>
	
	
	<style>
	
		tr {
			text-align: left;
			font-size: 13px;
			border: 1px solid;
		
		}
		
		td {
			text-align: left;
			font-size: 13px;
			border: 1px solid;
	
		
		}
		th{
		text-align: left;
			font-size: 13px;
			border: 1px solid;
		
		}
		
		input{
			width:100px;
		}
	
	</style>
	
	<script type="text/javascript">
		function LoadImg(value){
			if(value.files && value.files[0]){
				var reader=new FileReader();
				reader.onload=function(e){
					$('#LoadImg').attr('src',e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
	
	<div class="main-panel">
	<div class="content-wrapper">
		<!-- 시작 -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
	<form method="post" action="${path }/student/studentInfoUpdateEnd.hd">
	<table class="table table-warning table-hover">
	<thead class="thead-dark">
	<tr>
	<td colspan="8">
			<input type="file" id="imgAttach" name="imgAttach" onchange="LoadImg(this);"><!-- 파일업로드되는곳 -->
				<img id="LoadImg" height="300px">
	</td>
	</tr>
      <tr>
        <th colspan="9" style="font-size:25px;font-family:arial">${student.stuName}님의 기본정보 변경</th><br/>
      </tr>
    </thead>
				<tr> 
					<th style="text-align:center;font-size:20px;" rowspan="6"  width="200px">
						<img height="200px" src="${path }/resources/images/image/${student.stuImgOriname}"/>
						<br><br>
							<input type="file" name="up_file" id="up_file">
								</tr>
			<th>학생번호</th>
			<td><input type="text" value="${student.stuNo}" style="width:130px" required disabled/>
				<input type="hidden" name="stuNo" value="${student.stuNo}"/>
			</td>
			<th>성명</th>
			<td><input type="text" value="${student.stuName}" required disabled/></td>
			<th>주민등록번호(외국인등록번호)</th>
			<td><input type="text" value="${student.stuSsn}" style="width:130px" required disabled/></td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td><input type="text" name="stuTel" value="${student.stuTel}" style="width:120px" required/></td>
			<th>성별</th>
			<td><input type="text" value="${student.gender}" required disabled/></td>
			<th>메일주소</th>
			<td><input type="text" name="stuEmail"value="${student.stuEmail}" style="width:200px" style="width:200px" required/></td>
		</tr>
		<tr>
			<th>입학년월</th>
			<td><input type="text" value="<fmt:formatDate value="${student.enterDate}" pattern="yyyy-MM-dd"/>" required disabled/></td>
			<th>학적상태</th>
			<td><input type="text" value="${student.regStatus}" required disabled/></td>
			<th>주소</th>
			<td><input type="text" name="stuAddr" value="${student.stuAddr}" style="width:200px" required/></td>
		</tr>
			<tr>
			
				<th>지도교수</th>
				<td><input type="text" value="${student.profId}" required disabled/></td>
				<th>학과코드</th>
				<td><input type="text" value="${student.deptCode}" required disabled/></td>
				<th>계좌번호</th>
				<td><input type="text" name="stuAccount" value="${student.stuAccount}"  style="width:200px" required/></td>
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
	 <input type="submit" value="수정완료"/>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	
	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>