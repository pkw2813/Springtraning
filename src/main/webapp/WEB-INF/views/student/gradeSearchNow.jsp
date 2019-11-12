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
.form-control {
	margin-left: -150px !important;
	width: 150px;
	height: 52.4px;
}

th, td, .my-header {
	text-align: center;
}

pre {
	padding: 0px;
	background-color: white;
}
</style>
<div class="main-panel">
	<div class="content-wrapper">

		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="card">
					<div class="card-header" style="height:50px;">
						<h4>현재학기 성적</h4>
					</div>
					<div class="card-body">
						<!-- 부트스트랩에서는 화면 폭이 좁을 때(768px 이하) 하단에 스크롤바가 나타나며 수평으로 스크롤해서 테이블을 볼 수 있게 했습니다. 
						<table> 태그 외곽에 <div> 태그로 감싸서 .table-responsive 클래스를 추가하면 반응형 테이블로 사용할 수 있습니다. -->
						<div class="table-responsive">
							<pre class="pre-scrollable" style="max-height: 300px;">
							<table class="table table-striped table-bordered table-hover table-condensed">
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
									<c:forEach items="${list2}" var="l" varStatus="s">
											<c:set var="seme" value="${l.acaYearSem }" />
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
													<td><button type="button" class="btn btn-danger btn-xs" id="appealBtn" data-toggle="modal" data-target="#appealModal">이의 신청</button></td>
													<td><button type="button" class="btn btn-secondary btn-xs" id="answer">답변 보기</button></td>																										
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
		
	<div id="appealModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
			<span class="close" id="close3">&times;</span>
        <form action="${path}/studentAppeal.hd">
			<p>이의신청</p>
			<div class="form-group">
			<hr>
			<label class="control-label">제목</label>
			<input type="text" id="reqTitle" name="reqTitle" placeholder="건의 내용 제목을 입력하세요" class="" required />
			<hr>
			<input type="hidden" id="toName" name="toName" value="${userId }"/>
			<label class="control-label">받는사람</label>
			<input type="hidden" id="fromName" name="fromName" value="EA000000000"/>
			<input type="text" class="" value="관리자" readonly/>
			
			<hr>
			<label class="control-label">내용</label>
			<textarea name="reqContents" cols="40" rows="8" class="" placeholder="내용을 입력하세요" ></textarea>
			</div>
			<input type="button" class="btn btn-inverse-info btn-fw" id="close4" value="취소" style="float: right; margin: 7px;">
			<input type="submit" class="btn btn-inverse-info btn-fw" value="보내기" style="float: right; margin: 7px;">
			<br>
			<br>
		</form>
      </div>
 
    </div>
    <style>
    	.modal{
			z-index:9999;    		
    	}
    </style>
    
    <script>
    var appealModal = document.getElementById('appealModal');

    // Get the <span> element that closes the modal
    var close3 = document.getElementById("close3"); 
    var close4 = document.getElementById("close4"); 


    // When the user clicks on <span> (x), close the modal
    close3.onclick = function() {
    	appealModal.style.display = "none";
    	$(".modal-backdrop").css("display","none");
    }
    close4.onclick = function() {
    	appealModal.style.display = "none";
    	$(".modal-backdrop").css("display","none");
    	$("#appealModal").removeClass("show");
    }
    
    $("#appealBtn").click(function(){
    	 $("#appealModal").css("display","block");
    	 $("#appealModal").addClass("show");
    });
     
    </script>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />