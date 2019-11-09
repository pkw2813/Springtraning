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
						<table class="table table-default table-hover table-striped"" >
						<thead class="thead-dark">
							<tr>
								<td colspan="8">
								</td>
							</tr>
						    <tr>
						        <th colspan="9" style="font-size:25px;font-family:arial">수업평가보기</th><br/>
						     </tr>
					    </thead>
							<tr>
								<th rowspan="6" style="text-align:center"  width="200px">
								
								ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㄴㅁㅇㄻㄴㅇㄻㄴㅇㄹ
						</table>
						</div>
						<div class="card-footer" style="text-align : center;">
						<a class="btn btn-primary" href="${path }/student/studentInfoUpdate.hd">개인정보수정</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- 	<div class="row">
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
		 -->
		<!-- main panel end -->

		<!-- 테스트 -->
		<!-- <script>
		console.log('테스트');
		console.log('${path }');
			console.log('${student.stuImgRename}');
		
		</script> -->
		<script>
			$("#regStatus").val('${student.regStatus}');
			$("#gender").val('${student.gender}');
		</script>



		<jsp:include page="/WEB-INF/views/common/footer.jsp" />