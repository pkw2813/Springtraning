<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>

    
<style>
tr, td, th {
	text-align: left;
	font-size: 13px;
	cursor: auto;

}

input {
	width: 100px;
}

table {
	width: 100%;
}
</style>

<script>
	$(function() {
		$('[name=upFile]').on('change', function() {
			var fileName = this.files[0].name;
			$(this).next('.custom-file-label').html(fileName);
		});
	});
</script>
<div class="main-panel">
	<div class="content-wrapper">

		<!-- 시작 -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
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
								<th rowspan="6" style="text-align:center"  width="200px">
								
								
								<c:if test="${student.stuImgRename eq null }">
						
								<image height="200px" width="150px" src="${path }/resources/images/image/default.jpg"/> 
								</c:if>
								<c:if test="${student.stuImgRename ne null }">
						
								<image height="200px" width="150px" src="${path }/resources/images/image/${student.stuImgRename}"/>
								</c:if>
								
							</tr>
							<tr>
							<th>학생번호</th>
							<td><input type="text" value="${student.stuNo}"
								style="width: 130px" required disabled /></td>
							<th>성명</th>
							<td><input type="text" value="${student.stuName}" required
								disabled /></td>
							<th>&nbsp;&nbsp;&nbsp;주민등록번호<br>(외국인등록번호)</th>
							<td><input type="text" value="${student.stuSsn}"
								style="width: 130px" required disabled /></td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td><input type="text" value="${student.stuTel}"
									style="width: 120px" required disabled /></td>
								<th>성별</th>
								<td><select id="gender" name="gender" width="100px" disabled>
								  	<option value=>선택없음</option>
								    <option value="남">남</option>
								    <option value="여">여</option>
								
								</select></td>
								<th>메일주소</th>
								<td><input type="email" value="${student.stuEmail}"
									style="width: 200px" style="width:200px" required disabled /></td>
							</tr>
							<tr>
								<th>입학년월</th>
								<td><input type="text"
									value="<fmt:formatDate value="${student.enterDate}" pattern="yyyy-MM-dd"/>"
									required disabled /></td>
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
								
								
<%-- 								<td><input type="text" value="${student.regStatus}" required disabled /></td> --%>
								<th>주소</th>
								<td><input type="text" value="${student.stuAddr}"
									style="width: 200px" required disabled /></td>
							</tr>
							<tr>
							
								<th>지도교수</th>
								<td><input type="text" value="${student.profId}" required
									disabled /></td>
								<th>학과명</th>
								<td><input type="text" value="${student.deptCode}" required
									disabled /></td>
								<th>계좌번호</th>
								<td><input type="text" value="${student.stuAccount}"
									style="width: 200px" required disabled /></td>
							</tr>
							<tr>
								
								<th>학년학기</th>
								<td><input type="text" value="${student.stuYearSem}"
									required disabled /></td>
								<th>최대학점</th>
								<td><input type="text" value="${student.maxPsbCr}" required
									disabled /></td>
								<th>인정학기</th>
								<td><input type="text" value="${student.conSemester}"
									required disabled /></td>
							</tr>
						</table>
						</div>
						<div class="card-footer" style="text-align : center;">
						<a class="btn btn-primary" href="${path }/student/studentInfoUpdate.hd">개인정보수정</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<form action="${path}/beforeStudent/enroll.hd" method="POST">
			<span class="close">&times;</span>
			<p>입학 신청</p>
			<div class="form-group">
			<hr>
				<label class="control-label">이름</label>
					<input type="text" id="beforeName" name="beforeName" placeholder="이름 을 입력하세요" class="form-control" required />
			<hr>
			<label class="control-label">입학 유형</label>
			<select class="form-control" name="beforeType">				<option value="정시" class="enrollType" >정시</option>
				<option value="수시" class="enrollType">수시</option>
				<option value="편입" class="enrollType">편입</option>				
			</select>		
				<hr>
			<label class="control-label">연락처</label>
					<input type="tel" id="beforePhone" name="beforePhone" placeholder=" '-' 제외 입력" autocomplete=off class="form-control" />
					<input type="hidden" class="saveEmail" id="saveEmail" name="beforeEmail" value="">
					<input type="hidden" class="flagEmail" id="flagEmail" name="flagEmail" value="false">
					<br>
					<label class="control-label">E-mail</label>					
					<div class="emailCheck">
					<input type="email" id="email" name="email" placeholder="이메일을 입력하세요" class="form-control" required >
					<button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button>
					</div>
	
					<br>
			
	
	
	
		<script>
			$("#regStatus").val('${student.regStatus}');
			$("#gender").val('${student.gender}');
		
		</script>



		<jsp:include page="/WEB-INF/views/common/footer.jsp" />