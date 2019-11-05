<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/pro_header2.jsp"/>

<style>
	tr{
		height : 20px;
	}
</style>

<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">Main Content</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<div class="col-md-8 row"
							style="display: block; text-align: center;">
							<table class="table table-condensed table-bordered table-hover"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>
											<div class="input-group input-group-sm">
												<span class="input-group-addon" id="sizing-addon3">강의명
													&nbsp;&nbsp;&nbsp;</span> <select class="form-control">
													<option>영어학개론</option>
													<option>건축학개론</option>
													<option>자바기초</option>
													<option>철학입문</option>
												</select>
											</div>
										</th>
										<th>
											<div class="input-group input-group-sm">
												<span class="input-group-addon" id="sizing-addon3">학기구분&nbsp;&nbsp;&nbsp;</span>
												<select class="form-control">
													<option>1학기</option>
													<option>2학기</option>
												</select>
											</div>
										</th>
										<th>
											<div class="input-group input-group-sm">
												<span class="input-group-addon" id="sizing-addon3">종류구분&nbsp;&nbsp;&nbsp;</span>
												<select class="form-control">
													<option>중간고사</option>
													<option>기말고사</option>
													<option>과제1</option>
													<option>과제2</option>
													<option>과제3</option>
													<option>과제4</option>
												</select>
											</div>
										</th>
										<th>
											<button class="btn btn-primary" type="submit" value="">검색</button>
										</th>
									</tr>
								</thead>
							</table>
						</div>

					</div>
					<div class="card-body">
						<div class="col-md-12">
							<table class="table table-condensed table-bordered table-hover"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>학번</th>
										<th>이름</th>
										<th>학년</th>
										<th>학과</th>
										<th>중간고사 성적</th>
										<th>성적 입력</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>A1023</td>
										<td>박성술</td>
										<td>3학년</td>
										<td>컴퓨터공학과</td>
										<td>미입력</td>
										<td>
											<input type="number" class="form-control form-control-sm" name="grade"
											step="0.01" maxlength="10" max="100.00" min="0"
											placeholder="성적입력">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer">
						<div style="display: block; text-align: right;">
							<button class="btn btn-info">등록</button>
							<button class="btn btn-primary">수정</button>
							<button class="btn btn-primary">수정완료</button>
							<button class="btn btn-danger">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Main-content End -->

		<!-- Body section End -->
		<jsp:include page="/WEB-INF/views/common/n_footer.jsp" />