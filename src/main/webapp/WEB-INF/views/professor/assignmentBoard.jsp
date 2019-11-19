<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
	div {
		border: 1px solid black;
	}
	.table td {
		text-align:center;
	}
	th {
		text-align:center;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div id="assignmentTitle">
						<h3 class="font-weight-bold mb-0">
						<c:forEach var="list" items="${profSubjectList}" varStatus="s">
							<c:if test="${s.count eq 1}">
								<c:out value="${acaYear}"/>학년도 <c:out value="${acaSemester}"/>학기
								<c:out value="${list.subName }"/>&nbsp;과제 게시판
							</c:if>
						</c:forEach>
						</h3>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<!-- <form class="forms"> -->
					<div class="card-header">
						<div class="row">
							<div class="col-4" id="choiceClass">
							<label for="choiceClass" class="text-warning fontBlack" style="font-weight:bold;">강의 선택</label>
								<select class="form-control" style="color:black;" id="subjectName">
									<c:forEach var="list" items="${profSubjectList}" >
										<option value="<c:out value="${list.subName }"/>"><c:out value="${list.subName }"/></option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<!-- </form> -->
					<!----------------------- 게시판 시작 --------------->
					<div class="card-body">
						<div class="row">
							<div class="col-12">
							<h5>총 ${totalCount }건의 과제가 있습니다.</h5>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>첨부파일</th>
										<th>조회수</th>
									</tr>
									<c:forEach items="${arList }" var="arL">
									<c:if test="${arL!=null }">
									<tr>
										<td style="width:80px;">${arL.asgmtNo}</td>
										<td style="width:100px;"><a href="${path }/prof/selectAssignment?subSeq=${arL.subSeq}&asgmtNo=${arL.asgmtNo}">${arL.asgmtRegdTitle}</a></td>
										<td style="width:100px;">${arL.profName}</td>
										<td style="width:70px;"><fmt:formatDate value="${arL.asgmtRegdDate }" pattern="yyyy-MM-dd"/></td>
										<td style="width:100px;"><c:out value="${ arL.asgmtRegdOrifileName}"/></td>
										<td style="width:50px;"><c:out value="${ arL.readCount}"/></td>
									</tr>
									</c:if>
									</c:forEach>
									<c:if test="${empty arList}">
									<tr>
										<td colspan="6">조회된 과제가 아직 없습니다.</td>
									</tr>
									</c:if>
								</table>
								</div>
							<div style="height:25px;"></div>
							<div>${pageBar }</div>
							</div>
							<div class="col-6">
							<!-- <form action="" method="post">
							<input type='text' class='btn' style="border:0.5px solid black;"/>
							<input type='submit' class='btn btn-dark' value='검색'/>
							</form> -->
							</div>
							<div class="col-6">
							<button onclick="assignmentReg();" class="btn btn-dark" style="float:right;">과제 등록하기</button>
							</div>
						</div>
					</div>
					<!----------------------- 게시판  끝 --------------->
					
				</div>
			</div>
		</div>
	</div>

<script>
	$("#subjectName").change(function() {
		alert($(this).val()+" 과목 게시판을 조회합니다."); 
		$("#assignmentTitle").html("<h3 class='font-weight-bold mb-0'><c:out value='${acaYear}'/>학년도 <c:out value='${acaSemester}'/>학기 "+$(this).val()+" 과제 게시판"+"</h3>");
				
	});
	
	
	function test() {
		alert("버튼이 눌림!");
	}
	
	function assignmentReg() {
		location.href="${path}/prof/assignmentRegister.hd";
	}

</script>


	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />