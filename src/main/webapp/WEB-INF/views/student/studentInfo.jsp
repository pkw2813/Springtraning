<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
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

th {
	text-align: left;
	font-size: 13px;
	border: 1px solid;
}

input {
	width: 100px;
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
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<table class="table table-warning table-hover">
							<thead class="thead-dark">
								<tr>
									<th colspan="9" style="font-size: 25px; font-family: arial">${student.stuName}
										님의 학적 기본정보</th>
									<br/>
								</tr>
							</thead>
							<tr>
								<th rowspan="6" style="text-align:center"  width="200px">
								<image height="200px" src="${path }/resources/images/image/${student.stuImgOriname}"/>
							</tr>
							<tr>
							<th>학생번호</th>
							<td><input type="text" value="${student.stuNo}"
								style="width: 130px" required disabled /></td>
							<th>성명</th>
							<td><input type="text" value="${student.stuName}" required
								disabled /></td>
							<th>주민등록번호(외국인등록번호)</th>
							<td><input type="text" value="${student.stuSsn}"
								style="width: 130px" required disabled /></td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td><input type="text" value="${student.stuTel}"
									style="width: 120px" required disabled /></td>
								<th>성별</th>
								<td><input type="text" value="${student.gender}" required
									disabled /></td>
								<th>메일주소</th>
								<td><input type="text" value="${student.stuEmail}"
									style="width: 200px" style="width:200px" required disabled /></td>
							</tr>
							<tr>
								<th>입학년월</th>
								<td><input type="text"
									value="<fmt:formatDate value="${student.enterDate}" pattern="yyyy-MM-dd"/>"
									required disabled /></td>
								<th>학적상태</th>
								<td><input type="text" value="${student.regStatus}"
									required disabled /></td>
								<th>주소</th>
								<td><input type="text" value="${student.stuAddr}"
									style="width: 200px" required disabled /></td>
							</tr>
							<tr>
							
								<th>지도교수</th>
								<td><input type="text" value="${student.profId}" required
									disabled /></td>
								<th>학과코드</th>
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
						<div class="card-footer" style="text-align : center;">
						<a class="collapse-item"
							href="${path }/student/studentInfoUpdate.hd">개인정보수정</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<h3>gdgd</h3>
					</div>
				</div>
			</div>
			<div class="col-md-4 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<h4>aseas</h4>
					</div>
					<div class="card-body">
						<h3>gdgd</h3>
					</div>
					
					</div>
				</div>
			</div>
		</div>
		
		<!-- main panel end -->





		<jsp:include page="/WEB-INF/views/common/footer.jsp" />