<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 달력 import start -->
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<!-- 달력 import end -->

<style>
	/* div {
		border: 1px solid black;
	} */
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
								<c:out value="${list.subName }"/>&nbsp;과제 등록하기
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

						<div class="card-body">
							<div class="row">
								<div class="form-group col-5">
									<label for="exampleInputName1">과제 제목</label>
									<input type="text" class="form-control" id="exampleInputName1" placeholder="과제 제목을 입력해주세요.">
								</div>
								<div class="form-group col-7">
			                      <label>첨부파일</label>
			                      <input type="file" name="img[]" class="file-upload-default">
			                      <div class="input-group col-12">
			                        <input type="text" class="form-control file-upload-info" disabled="" placeholder="업로드할 파일을 선택해주세요.">
			                        <span class="input-group-append">
			                          <button class="file-upload-browse btn btn-primary" type="button">첨부파일 선택</button>
			                        </span>
			                      </div>
			                    </div>
							</div>

							<div class="form-group">
								<label for="exampleTextarea1">과제 설명</label>
								<textarea class="form-control" id="exampleTextarea1" rows="25"></textarea>
							</div>
						</div>

						<div class="card-footer" style="text-align:center;">
							<button class="btn btn-primary mr-2" onclick="test();">등록</button>
							<button class="btn btn-inverse-dark btn-fw" onclick="test();">취소</button>

						</div>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>

<script>
	$("#subjectName").change(function() {
		//alert($(this).val()+" 과목을 선택하셨습니다."); 
		$("#assignmentTitle").html("<h3 class='font-weight-bold mb-0'><c:out value='${acaYear}'/>학년도 <c:out value='${acaSemester}'/>학기 "+$(this).val()+" 과제 등록하기"+"</h3>");
				
	});
	
	
	function test() {
		alert("버튼이 눌림!");
	}

</script>


	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />