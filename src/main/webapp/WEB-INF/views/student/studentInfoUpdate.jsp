<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>
	<script>
	$(function(){
		$('[name=upFile]').on('change',function(){
			var fileName=this.files[0].name;
			$(this).next('.custom-file-label').html(fileName);
		});
	});

	</script>
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
	<form method="get" action="${path }/student/studentInfoUpdateEnd.hd">
	<table class="table table-warning table-hover">
	<thead class="thead-dark">
      <tr>
        <th colspan="9" style="font-size:25px;font-family:arial">${student.stuName} 님의 학적 기본정보 변경</th><br/>
      </tr>
    </thead>
		<tr>
			<th rowspan="4">
				<image height="200px" src="${path }/resources/images/image/${student.stuImgOriname}"/>
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
			<td><input type="text" name="stuEamil"value="${student.stuEmail}" style="width:200px" style="width:200px" required/></td>
		</tr>
		<tr>
			<th>입학년월</th>
			<td><input type="text" value="<fmt:formatDate value="${student.enterDate}" pattern="yyyy-MM-dd"/>" required disabled/></td>
			<th>학적상태</th>
			<td><input type="text" value="${student.regStatus}" required disabled/></td>
			<th>주소</th>
			<td><input type="text" name="stuStuAddr" value="${student.stuAddr}" style="width:200px" required/></td>
		</tr>
			<tr>
				<td id="imageButton"></td>
				<th>지도교수</th>
				<td><input type="text" value="${student.profId}" required disabled/></td>
				<th>학과코드</th>
				<td><input type="text" value="${student.deptCode}" required disabled/></td>
				<th>계좌번호</th>
				<td><input type="text" name="stuAccount" value="${student.stuAccount}"  style="width:200px" required/></td>
			</tr>
			<tr>
				<td></td>
				<th>학년학기</th>
				<td><input type="text" value="${student.stuYearSem}" required disabled/></td>
				<th>최대학점</th>
				<td><input type="text" value="${student.maxPsbCr}" required disabled/></td>
				<th>인정학기</th>
				<td><input type="text" value="${student.conSemester}" required disabled/></td>
			</tr>
			
	</table>
	 <input type="submit" value="수정완료">
	</form>
	
	
	
	<script>
	
	
	
	
	
	</script>


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>