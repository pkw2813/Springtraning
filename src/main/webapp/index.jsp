<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">Main Content</h4>
					</div>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-md-8 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead class="thead-dark">
									<tr>
										<th>1</th>
										<th>2</th>
										<th>3</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead class="thead-dark">
									<tr>
										<th>1</th>
										<th>2</th>
										<th>3</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
		


			<jsp:include page="/WEB-INF/views/common/footer.jsp" />