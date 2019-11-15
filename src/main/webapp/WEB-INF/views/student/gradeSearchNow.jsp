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
													<td><c:out value="${l.grade}" /></td>
													<td><c:out value="${l.retake}" /></td>
													<td><button type="button" id="appeal${s.count }" class="btn btn-danger btn-xs" style="font-size:13px">이의신청</button></td>
													<td><button type="button" id="answer${s.count }" class="btn btn-primary btn-xs" style="font-size:13px">답변보기</button></td>
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
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">교과목명 : </label>
								<div class="col-sm-10" style="width:10px;">
									<input type="text" class="form-control" name="subName" id="subName" readonly="readonly" />
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">담당교수 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="profName" id="profName" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">취득등급 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="grade" id="grade" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">신청일자 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="reqDate" id="reqDate" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						
						<p style="font-family: jua; font-size: 15px; font-style:">건의제목</p>
						<input type="text" name="reqTitle" id="reqTitle" class="form-control" required="required" />
						<hr>
						<p style="font-family: jua; font-size: 15px; font-style:">이의신청내용</p>
						<textarea rows="10" cols="90" name="reqContent" id="reqContent" placeholder="이의신청 내용을 작성하세요." required="required"></textarea>
						<hr>
						<input type="hidden" name="stuNo" id="stuNo" value="${loginMember.stuNo}"/>
						
						
						
						<input type="hidden" name="acaYearSem" id="acaYearSem" value="acaYearSem"/>
						<input type="hidden" name="subCode" id="subCode" value="subCode"/>
						<input type="hidden" name="profId" id="profId" value="profId"/>
						
						
						
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
			<div class="modal-content" style="width: 400px">
				<div id="topCloseBotton" style="text-align: right">
					<span class="close" id="closePw" Style="width: 50px;">&times;</span>
				</div>
				<form action="${path}/req.hd">
					<p style="font-family: jua; font-size: 40px; font-style:">답변보기</p>
					<div class="form-group">
						<hr>
						<p style="font-family: jua; font-size: 15px; font-style:">현재비밀번호</p>
						<input type="text" id="reqTitle" name="pwNow" class="form-control" required />
						<hr>
						<p style="font-family: jua; font-size: 15px; font-style:">변경하실	비밀번호</p>
						<input type="text" class="form-control" id="pw-Change" name="toName" value="${userId }" />
						<hr>
						<p style="font-family: jua; font-size: 15px; font-style:">비밀번호 	확인</p>
						<input type="text" class="form-control" id="pw-checkChange" name="toName" value="${userId }" />
						<hr>
					</div>
					<div style="text-align: center">
						<input type="button" class="btn btn-inverse-info btn-fw" id="closePw2" value="확인" style="float: right; margin: 7px;">
					</div>
				</form>
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
    AppealheaderModal.style.display = "block";
} */

	//이의신청 모달 script
	var AppealheaderModal = document.getElementById('appealModal');

    // Get the <span> element that closes the modal
    var closeAppeal = document.getElementById("closeAppeal");                                          
    var closeAppeal2 = document.getElementById("closeAppeal2");
    var closeAppeal3 = document.getElementById("closeAppeal3");
    
    // When the user clicks on <span> (x), close the modal
    closeAppeal.onclick = function() {
    	AppealheaderModal.style.display = "none";
    }
    closeAppeal2.onclick = function() {
    	AppealheaderModal.style.display = "none";
    }
    closeAppeal3.onclick = function() {
    	AppealheaderModal.style.display = "none";
    }
    
 	//답변보기 모달 script
	var headerModal1 = document.getElementById('appealModal');
	 
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
        var headerBtn<%=(i+1)%> = document.getElementById("appeal<%=(i+1)%>");
     	// Get the button that opens the modal
        var AppealheaderBtn<%=(i+1)%> = document.getElementById("appeal<%=(i+1)%>");
        
     	// When the user clicks on the button, open the modal 
        <%-- AppealheaderBtn<%=(i+1)%>.onclick = function() {
        	AppealheaderModal.style.display = "block";
        } --%>
        AppealheaderBtn<%=(i+1)%>.addEventListener('click', function(e){
        	/* alert(this.id); */
            AppealheaderModal.style.display = "block";
            $("#subName").val(""); // 초기화
            $("#subName").val("<%=gradeList.get(i).getSubName()%>");
            $("#profName").val("");
            $("#profName").val("<%=gradeList.get(i).getProfName()%>"+"교수");
            $("#grade").val("");
            $("#grade").val("<%=gradeList.get(i).getGrade()%>");
            $("#reqDate").val("");
            $("#reqDate").val(year+"/"+month+"/"+date);
            
            $("#acaYearSem").val("");
            $("#acaYearSem").val("<%=gradeList.get(i).getAcaYearSem()%>");
            $("#subCode").val("");
            $("#subCode").val("<%=gradeList.get(i).getSubCode()%>");
            $("#profId").val("");
            $("#profId").val("<%=gradeList.get(i).getProfId()%>");
        });

    <%
    	}
    }	%>

    // Get the <span> element that closes the modal
    var closePw = document.getElementById("closePw");                                          
    var closePw2 = document.getElementById("closePw2");  
    // When the user clicks on the button, open the modal 
    headerBtn1.onclick = function() {
       headerModal1.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    closePw.onclick = function() {
       headerModal1.style.display = "none";
    }
    closePw2.onclick = function() {
       headerModal1.style.display = "none";
    }
    
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />