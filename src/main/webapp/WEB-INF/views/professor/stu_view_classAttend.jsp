<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/pro_header2.jsp" />
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<style>
.modal-dialog {
	overflow-y: initial !important
}

.modal-body {
	height: 100%;
	overflow-y: auto;
}
</style>


<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="display-4">학생 출결 관리</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<form action="${path }/prof/viewClassAttend.hd" method="post">
							<table class="table table-bordered table-hover col-md-10"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>강의명</th>
										<th>일자별</th>
										<th>이름</th>
										<th>학년</th>
										<th>학과</th>
										<th>검색하기</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><select name="subjectName" class="form-control form-control-sm">
												<option value="*" selected>과목선택</option>
												<option value="E1203">영어영문학</option>
												<option value="J123">자바프로그래밍</option>
												<option value="chul">철학입문1</option>
												<option value="Muyeok">무역영어</option>
										</select></td>
										<td>
									        <input id="datepicker" class="form-control form-control-sm "/>
										    <script>
										        $('#datepicker').datepicker({
										            uiLibrary: 'bootstrap4'
										        });
										    </script>
										</td>
										<td>
										<input type="text" name="" class="form-control form-control-sm" id="inlineFormInputName2" placeholder="이름검색" />
											
										</td>
										<td><select name="grade" class="form-control form-control-sm">
												<option value="*" selected>학년검색</option>
												<option value="1">1학년</option>
												<option value="2">2학년</option>
												<option value="3">3학년</option>
												<option value="4">4학년</option>
										</select></td>
										<td>
										<input type="text" class="form-control form-control-sm" id="inlineFormInputName2" placeholder="학과검색">											
											</td>
										<td><input type="submit" value="검색"></td>
									</tr>
								</tbody>
							</table>
						</form>

					</div>

					<div class="card-body">
						<div class="col-md-12">
							<table class="table table-bordered table-hover"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>학번</th>
										<th>학과</th>
										<th>학년</th>
										<th>이름</th>
										<th>출석</th>
										<th>결석</th>
										<th>지각</th>
										<th>조퇴</th>
										<th>(금일 출결상태)2019-11-04</th>
										<th>
											<button type="button" class="btn btn-primary">금일
												출석입력</button>
										</th>
										<th>
											<button type="button" class="btn btn-primary">전체
												출석조회</button>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr class="success">
										<td>A2934</td>
										<td>영문학과</td>
										<td>4학년</td>
										<td>박성술</td>
										<td>12</td>
										<td>1</td>
										<td>2</td>
										<td>2</td>
										<td>미입력</td>
										<td><select name="attendStatus" class="form-control form-control-sm">
												<option value="*" selected>출결입력</option>
												<option value="출석">출석</option>
												<option value="결석">결석</option>
												<option value="지각">지각</option>
												<option value="조퇴">조퇴</option>
										</select></td>
										<td>
											<button type="button" class="btn btn-success btn-toggle"
												data-toggle="modal" data-target="#myModal">조회</button>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="modal fade" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<table class="table table-bordered table-hover">
												<thead class="thead-dark">
													<tr>
														<th>철학 입문</th>
														<th>박성술</th>
														<th>영어과</th>
														<th>3학년</th>
													</tr>

												</thead>
											</table>
										</div>
										<div class="modal-body">
											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th>날짜</th>
														<th>출석</th>
														<th>지각</th>
														<th>조퇴</th>
														<th>결석</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2019/11/01</td>
														<td></td>
														<td></td>
														<td>O</td>
														<td></td>
													</tr>
												</tbody>
											</table>

										</div>
										<div class="modal-footer"></div>
									</div>
								</div>
							</div>
							<script>
								$(document)
										.ready(
												function() {
													$('head')
															.append(
																	'<style type="text/css">.modal .modal-body {max-height: '
																			+ ($(
																					'body')
																					.height() * .7)
																			+ 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
												});

								$('#myModal').modal("toggle");
								// 반대로 모달상태를 전환함
								$('#myModal').modal("hide");
								// 모달창 열기
								$('#myModal').modal("show");
								// 모달창 닫음
							</script>
						</div>
					</div>

				<div class="card-footer">
					<button class="btn btn-info">등록</button>
					<button class="btn btn-info">취소</button>
				</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main-content End -->
<script>
$('#dateRangePicker').datepicker({
	 format: "yyyy-mm-dd",
	 language: "kr"
	 });
</script>


	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/n_footer.jsp" />