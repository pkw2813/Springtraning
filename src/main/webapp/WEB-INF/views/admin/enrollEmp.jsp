<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<script>
	function fn_updateProf(){
		location.href="${pageContext.request.contextPath}/professor/updateProf?profId=${loginMember.profId}";
	}
	function fn_pwdUpdate(){
		location.href="${pageContext.request.contextPath}/professor/updatePwd?profId=${loginMember.profId}";
	}
</script>

<style>
	.gap0{
		height:50px;
	}
	.gap1{
		height:100px;
	}
	.gap2{
		height:200px;
	}
	.gap3{
		height:300px;
	}
	div{
		border:0.3px solid coral;
	}
</style>

<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">교수 정보</h4>
					</div>
				</div>
			</div>
			</div>
			
			
		<div class="main-panel">
   		<div class="content-wrapper">
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
					<div class="row">
						<div class="col-10">
							<table class="table">
								<tr>
									<th>교번</th>
									<td><c:out value="${loginMember.profId }"/></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><c:out value="${loginMember.profName }"/></td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><fmt:formatDate value="${loginMember.profEnroll }" pattern="yyyy년 MM월 dd일"/></td>
								</tr>
								<tr>
									<th>주민번호</th>
									<td><c:out value="${loginMember.profSsn }"/></td>
								</tr>
								<tr>
									<th>학과번호</th>
									<td><c:out value="${loginMember.deptCode }"/></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><c:out value="${loginMember.email }"/></td>
								</tr>
								<tr>	
									<th>전화번호</th>
									<td><c:out value="${loginMember.phone }"/></td>
								</tr>
								<tr>	
									<th>주소</th>
									<td><c:out value="${loginMember.address }"/></td>
								</tr>
								<tr>	
									<th>성별</th>
									<td><c:out value="${loginMember.gender }"/></td>
								</tr>
								<%-- <tr>
									<th>주/야</th>
									<td><c:out value=""/></td>
								</tr> --%>
							</table>
							<div class="row"  style="height:100px;"></div>
							<div class="row"">
								<div class="col-3"></div>
								<div class="col-6" style="text-align:center;">
									<button style="border:1px solid lightgray;" class="btn btn-dark" onclick="fn_updateProf();">
									정보수정
									</button>
									&nbsp;
									<button style="border:1px solid lightgray;" class="btn btn-dark" onclick="fn_pwdUpdate();">
									비밀번호 변경
									</button>
								</div>
								<div class="col-3"></div>
							</div>
						</div>
						<div class="col-2">
							<div class="gap2">
								이미지 사진<img src=""/>
							</div>
							<div class="gap0"></div>
							<div class="gap3">
								현재 진행중인 과목
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>