<%@page import="com.kh.finalProject.professor.model.vo.AssignmentRegister"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.finalProject.professor.model.vo.ProfSubject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%
List<AssignmentRegister> arList=null;
List<ProfSubject> profSubjectList=null;
	if(request.getAttribute("arList")!=null) {
		arList=(ArrayList)request.getAttribute("arList");
	}
	if(request.getAttribute("profSubjectList")!=null) { 
		profSubjectList=(ArrayList)request.getAttribute("profSubjectList");
	}
	
	String curSubSeq=(String)request.getAttribute("curSubSeq");
	
%>
<style>
	div {
		border: 1px solid black;
	}
	.table td {
		text-align:center;
	}
	th {
		text-align:center;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div id="assignmentTitle">
						<h3 class="font-weight-bold mb-0">
						<c:out value="${acaYear}"/>학년도 <c:out value="${acaSemester}"/>학기
						<% for(int i=0; i<profSubjectList.size(); i++) { 
							if(curSubSeq!=null) {
								if(profSubjectList.get(i).getSubSeq().equals(curSubSeq)) { %>
								<%=profSubjectList.get(i).getSubName() %>&nbsp;과제 게시판
						<% 		}
							}else { %>
								<%=profSubjectList.get(0).getSubName() %>&nbsp;과제 게시판
						<% 		break;
							}
						} %>
						</h3>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<!-- <form class="forms"> -->
					<div class="card-header">
						<div class="row">
							<div class="col-4" id="choiceClass">
							<label for="choiceClass" class="text-warning fontBlack" style="font-weight:bold;">강의 선택</label>
								<select class="form-control" style="color:black;" id="subjectName">
								<% 
								for(int i=0; i<profSubjectList.size(); i++) {
									if(curSubSeq!=null) { 
										if(profSubjectList.get(i).getSubSeq().equals(curSubSeq)) { // curSubSeq과 같으면 %>
										<option value="<%=profSubjectList.get(i).getSubSeq()%>" selected="selected"><%=profSubjectList.get(i).getSubName() %></option>
									<% 	}else { // curSubSeq과 같지 않으면 %>
										<option value="<%=profSubjectList.get(i).getSubSeq()%>"><%=profSubjectList.get(i).getSubName() %></option>
									<%	}
									}else { // curSubSeq가 null이면 %>
										<option value="<%=profSubjectList.get(i).getSubSeq()%>"><%=profSubjectList.get(i).getSubName() %></option>
								<% 	}
									%>
								<%	
								} %>
								</select>
							</div>
						</div>
					</div>
					<!-- </form> -->
					<!----------------------- 게시판 시작 --------------->
					<div class="card-body">
						<div class="row">
							<div class="col-12">
							<h5>총 ${totalCount }건의 과제가 있습니다.</h5>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>첨부파일</th>
										<th>조회수</th>
									</tr>
									<c:forEach items="${arList }" var="arL">
									<c:if test="${arL!=null }">
									<tr>
										<td style="width:80px;">${arL.asgmtNo}</td>
										<td style="width:100px;"><a href="${path }/prof/selectAssignment?subSeq=${arL.subSeq}&asgmtNo=${arL.asgmtNo}">${arL.asgmtRegdTitle}</a></td>
										<td style="width:100px;">${arL.profName}</td>
										<td style="width:70px;"><fmt:formatDate value="${arL.asgmtRegdDate }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
										<td style="width:100px;"><c:out value="${ arL.asgmtRegdOrifileName}"/></td>
										<td style="width:50px;"><c:out value="${ arL.readCount}"/></td>
									</tr>
									</c:if>
									</c:forEach>
									<c:if test="${empty arList}">
									<tr>
										<td colspan="6">등록한 과제가 아직 없습니다.</td>
									</tr>
									</c:if>
								</table>
								</div>
							<div style="height:25px;"></div>
							<div>${pageBar }</div>
							</div>
							<div class="col-6">
							<!-- <form action="" method="post">
							<input type='text' class='btn' style="border:0.5px solid black;"/>
							<input type='submit' class='btn btn-dark' value='검색'/>
							</form> -->
							</div>
							<div class="col-6">
							<button onclick="assignmentReg();" class="btn btn-dark" style="float:right;">과제 등록하기</button>
							</div>
						</div>
					</div>
					<!----------------------- 게시판  끝 --------------->
					
				</div>
			</div>
		</div>
	</div>

<script>
	$("#subjectName").change(function() {
		//alert($("#subjectName option:selected").text()+" 과목 게시판을 조회합니다."); 
		$("#assignmentTitle").html("<h3 class='font-weight-bold mb-0'><c:out value='${acaYear}'/>학년도 <c:out value='${acaSemester}'/>학기 "+$("#subjectName option:selected").text()+" 과제 게시판"+"</h3>");
		location.href="${path}/prof/assignmentBoard.hd?subSeq="+$(this).val();
	});
	
	
	function test() {
		alert("버튼이 눌림!");
	}
	
	function assignmentReg() {
		location.href="${path}/prof/assignmentRegister.hd";
	}

</script>


	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />