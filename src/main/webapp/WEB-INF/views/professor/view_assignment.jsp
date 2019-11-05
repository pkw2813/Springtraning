<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/pro_header2.jsp" />

<style>
#choiceClass select, #choiceYear select, #choiceSeme select {
	color: black;
}
</style>

<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">과제 제출 조회</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">조회 대상 강의 설정</h3>
						<div class="row">
							<div class="col-md-3" id="choiceClass">
								<label for="choiceClass" class="text-warning">강의선택</label> <select
									class="form-control">
									<option>강의1</option>
									<option>강의12</option>
									<option>강의13</option>
								</select>
							</div>
							<div class="col-md-3" id="choiceYear">
								<label for="choiceClass" class="text-warning">연도선택</label> <select
									class="form-control">
									<option>2019</option>
									<option>2018</option>
									<option>2017</option>
								</select>
							</div>
							<div class="col-md-3" id="choiceSeme">
								<label for="choiceClass" class="text-warning">학기선택</label> <select
									class="form-control">
									<option>1학기</option>
									<option>2학기</option>
								</select>
							</div>
							<div class="col-md-3">
								<label for="submitButton36" class="text-warning">검색하기(클릭)</label>
								<button id="submitButton36" type="submit"
									class="btn btn-block btn-warning">검색
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  -->
		<div class="row" style="text-align : center;">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<h2>#영문학기초 과제 제출 게시판</h2>
					</div>
					<div class="card-body">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>작성자</th>
										<th>글 제목</th>
										<th>작성일자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>박성술</td>
										<td><a class="form-control">자바에대한 고찰</a></td>	
										<td>2019/08/07</td>
									</tr>
									<tr>
										<td>박성술</td>
										<td><a class="form-control">자바에대한 고찰</a></td>
										<td>2019/08/07</td>
									</tr>
									<tr>
										<td>박성술</td>
										<td><a class="form-control">자바에대한 고찰</a></td>
										<td>2019/08/07</td>
									</tr>
									<tr>
										<td>박성술</td>
										<td><a class="form-control">자바에대한 고찰</a></td>
										<td>2019/08/07</td>
									</tr>
								</tbody>
							</table>
					</div>
					<div class="card-footer">
						<ul class="pagination" style="justify-content: center;">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--  -->

	</div>




	<!-- Main-content End -->

	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/n_footer.jsp" />