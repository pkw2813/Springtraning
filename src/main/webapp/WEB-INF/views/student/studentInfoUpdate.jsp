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
		
			cursor: auto;
		}
		
		input{
			width:100px;
		}
	
		table {
			width: 100%;
		}

	
	</style>
	

	
	<div class="main-panel">
	<div class="content-wrapper">
	
				
		<!-- 시작 -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
	<form method="post" action="${path }/student/studentInfoUpdateEnd.hd" enctype="multipart/form-data">
	<table class="table table-default table-hover table-striped">
	<thead class="thead-dark">
	<tr>
	<td colspan="8">
	</td>
	</tr>
      <tr>
        <th colspan="9" style="font-size:25px;font-family:arial">${student.stuName}님의 기본정보 변경</th><br/>
      </tr>
    </thead>
				<tr> 
					<th style="text-align:center;font-size:15px;" rowspan="6"  width="200px">
						
						<c:if test="${student.stuImgRename eq null }">
								<image id="LoadImg" height="200px" width="150px" src="${path }/resources/images/image/default.jpg"/>
								</c:if>
								<c:if test="${student.stuImgRename ne null }">
								<image id="LoadImg" height="200px" width="150px"  src="${path }/resources/images/image/${student.stuImgRename}"/>
								</c:if>
						<br><br>
							<input type="file" id="imgAttach"  name="imgAttach" value="false" class="btn btn-primary"/>
								<label for="imgAttach" class="btn btn-primary">사진 변경</label>
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
	 <input type="submit" value="수정완료" class="btn btn-primary"/>
	 

	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<script>
	$("#imgAttach").hide();
		function LoadImg(value){
			
			if(value.files && value.files[0]){
				var reader=new FileReader();
				reader.onload=function(e){
					$('#LoadImg').attr('src',e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		$("#imgAttach").change(function(){
			LoadImg(this);
		})
		
		
		$("#LoadImg").on("change",function(){
			$("#imgAttach").attr("value","true");
		})
		
		
		
	</script>


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>