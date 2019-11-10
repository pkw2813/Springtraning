<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
	.form-control{
		margin-left:-150px !important;
		width:150px;
		height:52.4px;
	}
	.my-header{
		text-align: center;
	}
	pre{
		padding:0px;
		background-color:white;
	}
	
</style>
<div class="main-panel">
	<div class="content-wrapper">

		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="card">
					<div class="card-header" style="height:50px;">
						<h4>과목별 성적</h4>
					</div>
					<div class="card-body">
						<!-- 부트스트랩에서는 화면 폭이 좁을 때(768px 이하) 하단에 스크롤바가 나타나며 수평으로 스크롤해서 테이블을 볼 수 있게 했습니다. 
						<table> 태그 외곽에 <div> 태그로 감싸서 .table-responsive 클래스를 추가하면 반응형 테이블로 사용할 수 있습니다. -->
						<div class="table-responsive">
						<pre class="pre-scrollable" style="max-height:300px;">
							<table class="table table-bordered table-hover table-condensed">
								<thead class="thead-dark">
									<tr class="my-header">
										<th scope="col">순번</th>
										<th scope="col">학년도</th>
										<th scope="col">학기</th>
										<th scope="col">교과목코드</th>
										<th scope="col">교과목명</th>
										<th scope="col">학점</th>
										<th scope="col">취득등급</th>
										<th scope="col">이수구분</th>
										<th scope="col">성적입력구분</th>
										<th scope="col">성적상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">1</td>
										<td>2018</td>
										<td>2</td>
										<td>교과목코드</td>
										<td>웹프로그래밍</td>
										<td>3</td>
										<td>4.5</td>
										<td>이수구분</td>
										<td>성적입력구분</td>
										<td>성적상태</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터1</td>
										<td>데이터1</td>
										<td>데이터1</td>
									</tr>
									
								</tbody>
							</table>
							</pre>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />