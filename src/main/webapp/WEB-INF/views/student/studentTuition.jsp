<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
	table, tr, td, th {
	 	cursor: auto;
	 }
</style>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">등록금 고지서</h4>
					</div>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead class="thead-dark">
									<tr>
										<th>등록금액</th>
										<th>학년도 학기</th>
										<th>납부기한</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><div id="tuition"></div></td>
										<td>${tuition.acaYearSem}</td>
										<td>${tuition.dueDate}</td>
									</tr>
									<tr>
										<td colspan="3" style="text-align:center;">학번: ${tuition.stuNo }</td>
									</tr>
									<tr>
										<td colspan="3" style="text-align:center;">납부기한일 전까지 반드시 납부바랍니다.</td>
									</tr>
									<tr>
										<td colspan="3" style="text-align:right;">KH대학교 총장</td>
									</tr>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		<script>
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			};
			
			var tuition=numberWithCommas(${tuition.tuition});
			$("#tuition").html(tuition+"원");
			
		</script>


			<jsp:include page="/WEB-INF/views/common/footer.jsp" />