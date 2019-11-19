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
	div {
		border: 1px solid black;
	}
	input textarea {
		font-weight:bold;
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
							<c:if test="${ar ne null}">
								<c:out value="${ar.subName }"/>&nbsp;과제 <c:out value="${ar.asgmtNo }"/>
							</c:if>
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
						<div class="card-body">
							<div class="row">
								<div class="form-group col-5">
									첨부파일
									<c:if test="${ar ne null}">
									<label><c:out value="${ar.asgmtRegdDate }"/></label>
								</c:if>
									<input type="text" class="form-control" id="exampleInputName1" style="color:black; background-color:#cef1da;" readonly>
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
								<textarea class="form-control" id="exampleTextarea1" rows="25" style="font-weight:bold; color:black; background-color:#cef1da;" readonly></textarea>
							</div>
						</div>

						<div class="card-footer" style="text-align:center;">
							<button class="btn btn-primary mr-2" onclick="test();">수정</button>
							<button class="btn btn-inverse-dark btn-fw" onclick="test();">목록으로</button>

						</div>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>

<script>
		<c:if test="${ar ne null}">
			$("#exampleInputName1").val('<c:out value="${ar.asgmtRegdTitle }"/>');
			$("#exampleTextarea1").val('<c:out value="${ar.asgmtRegdContent }"/>');
		</c:if>
	
	
		function test() {
		alert("버튼이 눌림!");
	}

</script>


	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />