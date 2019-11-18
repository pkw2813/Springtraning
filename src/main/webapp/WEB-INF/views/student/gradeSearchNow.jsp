<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.finalProject.student.model.vo.Grade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
th, td, .my-header {
	text-align: center;
	cursor: auto;
}

pre {
	padding: 0px;
	background-color: white;
}
.row{
	margin:-1px 0;
}
</style>
<div class="main-panel">
	<div class="content-wrapper">

		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="card">
					<div class="card-header" style="height: 50px;">
						<h4>현재학기 성적</h4>
					</div>
					<div class="card-body">
						<!-- 부트스트랩에서는 화면 폭이 좁을 때(768px 이하) 하단에 스크롤바가 나타나며 수평으로 스크롤해서 테이블을 볼 수 있게 했습니다. 
						<table> 태그 외곽에 <div> 태그로 감싸서 .table-responsive 클래스를 추가하면 반응형 테이블로 사용할 수 있습니다. -->
						<div class="table-responsive">
							<pre class="pre-scrollable" style="max-height: 300px;">
							<table
									class="table table-striped table-bordered table-hover table-condensed">
								<thead class="thead-dark" style="position: fiexd">
									<tr class="my-header">
										<th scope="col">순번</th>
										<th scope="col">학년도</th>
										<th scope="col">학기</th>
										<th scope="col">교과목코드</th>
										<th scope="col">교과목명</th>
										<th scope="col">이수구분</th>
										<th scope="col">이수학점</th>
										<th scope="col">취득등급</th>
										<th scope="col">재수강여부</th>
										<th scope="col">이의신청</th>
										<th scope="col">답변</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${gradeNow}" var="l" varStatus="s">
											<c:set var="seme" value="${l.acaYearSem}" />
												<tr id="select">
													<td scope="row"><c:out value="${s.count}" /></td>
													<td><c:out value="${fn:substring(seme,0,4)}" /></td>
													<td><c:out value="${fn:substring(seme,5,6)}" /></td>
													<td><c:out value="${l.subCode}" /></td>
													<td><c:out value="${l.subName}" /></td>
													<td><c:out value="${l.subType}" /></td>
													<td><c:out value="${l.rcvCredits}" /></td>
												
												<c:if test="${Assess.evalPoint eq null}">
													<td colspan="4"><button type="button" id="profassess${s.count}" class="btn btn-warning btn-xs" style="font-size:13px">수강평가</button></td>
												</c:if>	
												<c:if test="${Assess.evalPoint ne null}">
													<td><c:out value="${l.grade}" /></td>
													<td><c:out value="${l.retake}" /></td>
													<c:if test="${l.reqDate eq null }">
														<td><button type="button" id="appeal${s.count}" class="btn btn-danger btn-xs" style="font-size:13px">이의신청</button></td>
														<td></td>
													</c:if>
													<c:if test="${l.reqDate ne null }">
														<td><button type="button" id="appeal${s.count}" class="btn btn-danger btn-xs" style="font-size:13px">이의신청중</button></td>
													</c:if>
													<c:if test="${l.reqDate ne null and l.reqAwswer eq null }">
														<td><button type="button" id="answer${s.count}" class="btn btn-primary btn-xs" style="font-size:13px">답변 대기중</button></td>
													</c:if>
													<c:if test="${l.reqDate ne null and l.reqAwswer ne null }">
														<td><button type="button" id="answer${s.count}" class="btn btn-primary btn-xs" style="font-size:13px">답변 확인</button></td>
													</c:if>
												</c:if>
												</tr>									
									</c:forEach>
								</tbody>
							</table>
							</pre>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 성적이의신청 모달 -->
		<div id="appealModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content" style="width: 800px">
				<div id="topCloseBotton" style="text-align: right">
					<span class="close" id="closeAppeal" Style="width: 50px;">&times;</span>
				</div>
				<form name="myAppealFrm" action="${path}/myAppeal.hd" method="post">
					<p style="font-family: jua; font-size: 30px; font-style:">성적이의신청</p>
					<p style="font-family: jua; font-size: 15px; color:red; font-style:">이의신청기간은 학기 종료 후 3일</p>
					<hr>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">교과목명 : </label>
								<div class="col-sm-10" style="width:10px;">
									<input type="text" class="form-control" name="subName" id="subName_s" readonly="readonly" />
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">담당교수 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="profName" id="profName_s" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">취득등급 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="grade" id="grade_s" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">신청일자 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="reqDate" id="reqDate_s" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						
						<p style="font-family: jua; font-size: 15px; font-style:">이의신청제목</p>
						<input type="text" name="reqTitle" id="reqTitle_s" class="form-control" required="required" placeholder="이의신청 제목을 작성하세요."/>
						<hr>
						<p style="font-family: jua; font-size: 15px; font-style:">이의신청내용</p>
						<textarea class="form-control" rows="5" cols="90" name="reqContent" id="reqContent_s" placeholder="이의신청 내용을 작성하세요." required="required"></textarea>
						<hr>
						
						<input type="hidden" name="stuNo" id="stuNo_s" value="${loginMember.stuNo}" readonly="readonly"/>
						<input type="hidden" name="acaYearSem" id="acaYearSem_s" value="acaYearSem" readonly="readonly"/>
						<input type="hidden" name="subCode" id="subCode_s" value="subCode" readonly="readonly"/>
						<input type="hidden" name="profId" id="profId_s" value="profId" readonly="readonly"/>
						
						
					</div>
					<div style="text-align: center">
						<input type="reset" class="btn btn-inverse-info btn-fw" id="closeAppeal3" value="취소" style="float: right; margin: 7px;">
						<input type="submit" class="btn btn-inverse-info btn-fw" id="closeAppeal2" value="제출" style="float: right; margin: 7px;">
					</div>
				</form>
			</div>
		</div>

		<!-- 답변보기 모달 -->
		<div id="answerModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content" style="width: 800px">
				<div id="topCloseAnswerBotton" style="text-align: right">
					<span class="close" id="closeAnswer" Style="width: 50px;">&times;</span>
				</div>
				<div>
					<p style="font-family: jua; font-size: 30px; font-style:">성적이의신청결과</p>
					<hr>
				</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">교과목명 : </label>
								<div class="col-sm-10" style="width:10px;">
									<input type="text" class="form-control" name="subName" id="subName_p" readonly="readonly" />
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">담당교수 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="profName" id="profName_p" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">취득등급 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="grade" id="grade_p" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">신청일자 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="reqDate" id="reqDate_p" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						
						<p style="font-family: jua; font-size: 15px;">이의신청제목</p>
						<input type="text" name="reqTitle" id="reqTitle_p" class="form-control" readonly="readonly"/>
						<hr>
						<p style="font-family: jua; font-size: 15px;">이의신청내용</p>
						<textarea class="form-control" rows="5" cols="90" name="reqContent" id="reqContent_p" readonly="readonly"></textarea>			
						<p style="font-family: jua; font-size: 15px;">이의신청결과</p>
						<textarea class="form-control" rows="5" cols="90" name="reqAnswer" id="reqAnswer_p" readonly="readonly"></textarea>
					</div>
			</div>
		</div>
<style>
.modal {
	z-index: 9999;
}
</style>

<script>

/* function taeyoug1(event) {
	console.log("taeyoung1");
	alert('Hello world, '+this.value);
	AppealModal.style.display = "block";
} */

	//이의신청 모달 script
	var AppealModal = document.getElementById('appealModal');
	//답변보기 모달
	var AnswerModal = document.getElementById('answerModal');

    // Get the <span> element that closes the modal
    var closeAppeal = document.getElementById("closeAppeal");                                          
    var closeAnswer = document.getElementById("closeAnswer");  
    
    var closeAppeal2 = document.getElementById("closeAppeal2");
    var closeAppeal3 = document.getElementById("closeAppeal3");
    
    // When the user clicks on <span> (x), close the modal
    closeAppeal.onclick = function() {
    	AppealModal.style.display = "none";
    }
    closeAnswer.onclick = function() {
    	AnswerModal.style.display = "none";
    }
    
    closeAppeal2.onclick = function() {
    	AppealModal.style.display = "none";
    }
    closeAppeal3.onclick = function() {
    	AppealModal.style.display = "none";
    }
    
    
 	//현재시간
 	var today = new Date();
 	var year = today.getFullYear();
 	var month = today.getMonth() + 1;
 	var date = today.getDate();
    
    <%
    	List<Grade> gradeList = null;
    	if(request.getAttribute("gradeNow")!=null) {
	    	gradeList = (ArrayList)request.getAttribute("gradeNow");
    	}
    %>
     <%if(gradeList!=null) { 
    	for(int i=0; i<gradeList.size(); i++) { %>
     	// Get the button that opens the modal
        var AppealheaderBtn<%=(i+1)%> = document.getElementById("appeal<%=(i+1)%>");
        var AnswerheaderBtn<%=(i+1)%> = document.getElementById("answer<%=(i+1)%>");
        
        
     	// When the user clicks on the button, open the modal 
        <%-- AppealheaderBtn<%=(i+1)%>.onclick = function() {
        	AppealModal.style.display = "block";
        } --%>
        AppealheaderBtn<%=(i+1)%>.addEventListener('click', function(e){
        	/* alert(this.id); */
        	<% if(gradeList.get(i).getReqDate()==null) { %>
        	alert("유의사항 : 시스템을 통한 성적이의신청 및 회신은 한 과목당 1회에 한합니다.");
            AppealModal.style.display = "block";
            $("#subName_s").val(""); // 초기화
            $("#subName_s").val("<%=gradeList.get(i).getSubName()%>");
            $("#profName_s").val("");
            $("#profName_s").val("<%=gradeList.get(i).getProfName()%>"+"교수");
            $("#grade_s").val("");
            $("#grade_s").val("<%=gradeList.get(i).getGrade()%>");
            $("#reqDate_s").val("");
            $("#reqDate_s").val(year+"/"+month+"/"+date);
            
            $("#acaYearSem_s").val("");
            $("#acaYearSem_s").val("<%=gradeList.get(i).getAcaYearSem()%>");
            $("#subCode_s").val("");
            $("#subCode_s").val("<%=gradeList.get(i).getSubCode()%>");
            $("#profId_s").val("");
            $("#profId_s").val("<%=gradeList.get(i).getProfId()%>");
            <% }else { %>
            	alert("이미 이의신청 되었습니다.");
            <% } %>
        });
        
        <% if(gradeList.get(i).getReqDate()==null) { %>
		$("AnswerheaderBtn<%=(i+1)%>").html("");
 		<%} else { %>
        AnswerheaderBtn<%=(i+1)%>.addEventListener('click', function(e){
        	/* alert(this.id); */
        	
        	<% if(gradeList.get(i).getReqAwswer()!=null) { %>
            AnswerModal.style.display = "block";
            $("#subName_p").val(""); // 초기화
            $("#subName_p").val("<%=gradeList.get(i).getSubName()%>");
            $("#profName_p").val("");
            $("#profName_p").val("<%=gradeList.get(i).getProfName()%>"+"교수");
            $("#grade_p").val("");
            $("#grade_p").val("<%=gradeList.get(i).getGrade()%>");
            $("#reqDate_p").val("");
            $("#reqDate_p").val(year+"/"+month+"/"+date);
			
            $("#reqTitle_p").val("");
	        $("#reqTitle_p").val("re: "+"<%=gradeList.get(i).getReqTitle()%>");
	        $("#reqContent_p").val("");
	        $("#reqContent_p").val("<%=gradeList.get(i).getReqContent()%>");
	        $("#reqAnswer_p").val("");
	        $("#reqAnswer_p").val("<%=gradeList.get(i).getReqAwswer()%>");
	        
			<% } else if(gradeList.get(i).getReqAwswer() == null){ %>
				alert("답변 대기중 입니다.");
			<% } %>
		   
        });
        <%}%>
   		<%
    	}%>
    <%}%>
    
    
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />