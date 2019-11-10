<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

  
<c:set var="path" value="${pageContext.request.contextPath }" />



    
<style>
tr, td{
	text-align: left;
	font-size: 13px;
	cursor: auto;
border:1px solid lightgray;
}

	th{
		text-align:center;
		font-size: 13px;
		cursor: auto;
	border:1px solid lightgray;
		vertical-align: middle;
	}

input {
	width: 100px;
}

table {
	width: 100%;
}

.content-wrapper{
	
	padding:20px;
}
</style>


<div class="main-panel">
	<div class="content-wrapper">

		<!-- 시작 -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
						<table class="table table-default table-striped">
							
							
							    <tr >
							        <td class="thead-dark" colspan="5" style="font-size:25px;font-family:arial">수업평가보기</th><br/>
						    	<tr>
					    
					    <tr>
							<td colspan="5">
							<h6 style="color:red">*학생의 권익 보호를 위해 무기명 평가 처리 합니다</h6>
							</td>
						</tr>
							<tr>
								<td rowspan="5" style="width:130px;text-align: center;">
								<c:if test="${student.stuImgRename eq null }">
								<image height="150px" width="120px" src="${path }/resources/images/image/default.jpg"/>
								</c:if>
								<c:if test="${student.stuImgRename ne null }">
								<image height="150px" width="120px" src="${path }/resources/images/image/${student.stuImgRename}"/>
								</c:if>
								</td>
							
							<tr style="height:30px;text-align:center;">
								<th style="width:200px;">교수이름</th>
								<th style="width:300px;">학과</th>
								<th style="width:300px;">과목</th>
								<th style="width:300px;">성별</th>
							<tr>
								<th>${profInfo.PROF_NAME}</th>
								<th>${profInfo.T_DEPT}</th>
								<th>${profInfo.SUB_NAME}</th>
								<th>${profInfo.GENDER}</th>
							</tr>
							<tr style="height:30px;text-align:center;">
								
								<th>입교일</th>
								<th>평균평점</th>
								<th>이메일주소</th>
								<th>연락처</th>
							<tr>
								<th><fmt:formatDate value="${profInfo.PROF_ENROLL}" pattern="yyyy-MM-dd"/></th>
								<th><fmt:formatNumber value="${averPoint}" pattern="#.##"/></th>
								<th>${profInfo.EMAIL}</th>
								<th>${profInfo.PHONE}</th>
							</tr>
							
					</table>
					<br>
					<table class="table table-default table-hover table-striped">
						<tr>
							<th style="width:100px;">평가일</th>
							<th style="width:500px;">평가내용</th>
							<th style="width:70px">평가점수</th>
						</tr>
						<c:forEach items="${list}" var="e" varStatus="v">
						<tr>
						<td style="width:100px"><fmt:formatDate value="${e.EVAL_DATE}" pattern="yyyy-MM-dd일 hh:mm"/></td>
						<td>${e.EVAL_COMMENT}</td>
						<td id="point">${e.EVAL_POINT }</td>
						</tr>
						</c:forEach>
					</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





	