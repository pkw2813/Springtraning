<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/son_pro_header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>


<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">정보 수정</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<form action="${pageContext.request.contextPath }/professor/updateProfessorEnd?profId=${prof.profId}" method="post">
					<div class="row">
						<div class="col-10">
							<table class="table">
								<tr>
									<th>교번</th>
									<td><input name="profId" class="btn form-control" type="text" value="${prof.profId }" readonly/></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input name="profName" class="btn form-control" type="text" value="${prof.profName }" readonly/></td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><input name="profEnroll" class="btn form-control" type="text" value='<fmt:formatDate value="${prof.profEnroll }" pattern="yyyy년 MM월 dd일"/>' readonly/></td>
								</tr>
								<tr>
									<th>주민번호</th>
									<td><input name="profSsn" class="btn form-control" type="text" value="${prof.profSsn }" readonly/></td>
								</tr>
								<tr>
									<th>학과번호</th>
									<td><input name="deptCode" class="btn form-control" type="text" value="${prof.deptCode }" readonly/></td>
								</tr>	
								<tr>
									<th>이메일</th>
									<td><input name="email" class="btn form-control" type="email" value="${prof.email }"/></td>
								</tr>
								<tr>	
									<th>전화번호</th>
									<td><input name="phone" class="btn form-control" type="tel" value="${prof.phone }"/></td>
								</tr>
								<tr>	
									<th>주소</th>
									<td><input name="address" class="btn form-control" type="text" value="${prof.address }"/></td>
								</tr>
								<tr>	
									<th>성별</th>
									<td><input name="gender" class="btn form-control" type="text" value="${prof.gender }" readonly/></td>
								</tr>
								<!-- <tr>
									<th>주/야</th>
									<td><input class="btn form-control" type="text" value="주/야" readonly/></td>
								</tr> -->
							</table>
							<div class="row" style="height:20px;"></div>
							<div class="row">
								<div class="col-4"></div>
								<div class="col-4" style="text-align:center;">
									<input id="updateProf" style="width:100px;" class="btn btn-dark" type='submit' value="수정"/>
									&nbsp; &nbsp;
									<input id="back_" style="width:100px;" class="btn btn-dark" type='reset' value="취소"/>
								</div>
								<div class="col-4"></div>
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
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$("#updateProf").click(function(){
			if(confirm("수정하시겠습니까?")==true){
				document.from.submit();
			}else{
				return false;
			}
		});
	});
	$(function(){
		$("#back_").click(function(){
			history.back();
		})
	});
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

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>