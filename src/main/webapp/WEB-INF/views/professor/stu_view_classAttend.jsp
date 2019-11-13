<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript"
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="${path }/resources/js/datepicker-ko.js"></script>

<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<style>
/* .modal-dialog {
	overflow-y: initial !important
}

.modal-body {
	height: 100%;
	overflow-y: auto;
} */
.modal{
    		z-index:9999;
    	}
</style>


<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="display-4">학생 출결 관리</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row ">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<form action="${path }/prof/viewClassAttend.hd" method="post">
							<table class="table table-bordered table-hover col-md-10 table-condensed"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>강의명</th>
										<th>일자별</th>
										<th>이름</th>
										<th>학년</th>
										<th>학과</th>
										<th>검색하기</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><select name="subCode" class="form-control form-control-sm">
												<option value="" selected>과목선택</option>
												<c:forEach items="${subNameCodeList }" var="subList">
													<option value="${subList.subCode }">${subList.subName }</option>
												</c:forEach>
										</select></td>
										<td>
									        <input name="atDate" style="text-align : center;" id="dateInput" type="text" class="form-control form-control-sm "/>
										    <script type="text/javascript" >
												$("#dateInput").datepicker();
												$.datepicker.setDefaults($.datepicker.regional["ko"]);
												uiLibrary: 'bootstrap4';
										        /* $('#dateInput').datepicker({*/
										            
										    </script>
										</td>
										<td>
										<input type="text" name="stuName" class="form-control form-control-sm" id="inlineFormInputName2" placeholder="이름검색" />
											
										</td>
										<td><select name="grade" class="form-control form-control-sm">
												<option value="" selected>학년검색</option>
												<option value="1">1학년</option>
												<option value="2">2학년</option>
												<option value="3">3학년</option>
												<option value="4">4학년</option>
										</select></td>
										<td>
										<input type="text" class="form-control form-control-sm" id="inlineFormInputName2"
												name="deptName" placeholder="학과검색">											
											</td>
										<td><input type="submit" value="검색" class="btn btn-success"></td>
									</tr>
								</tbody>
							</table>
						</form>

					</div>

					<div class="card-body table-responsive">
						<div class="col-md-12">
							<table class="table table-bordered table-hover table-condensed"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>학과</th>
										<th>학년</th>
										<th>이름</th>
										<th>출석</th>
										<th>결석</th>
										<th>지각</th>
										<th>조퇴</th>
										<th>(금일 출결상태)${attendList[0].sysdate }</th>
										<th>
											금일출석입력
										</th>
										<th>
											전체출석조회
										</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${attendList }" var="list">
									<tr class="success">
										<td>${list.deptName }</td>
										<td>${list.grade }</td>
										<td>${list.stuName }</td>
										<td>${list.attend }</td>
										<td>${list.dismiss }</td>
										<td>${list.late }</td>
										<td>${list.ealryLeave}</td>
										<td>미입력</td>
										<td><select name="attendStatus" class="form-control form-control-sm">
												<option value="" selected>출결입력</option>
												<option value="출석">출석</option>
												<option value="결석">결석</option>
												<option value="지각">지각</option>
												<option value="조퇴">조퇴</option>
										</select></td>
										<td>
											<button type="button" class="btn btn-success btn-toggle"
												id='classViewBtn'>조회</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>


					      <!-- @@Modal content Start@@ -->

							<div id="classViewModal" class="modal">
						      <div class="modal-content">
						         <span class="close" id="closeClassView">&times;</span>
						        <!-- Modal body start -->
						        <div class="modal-header">
											<table class="table table-bordered table-hover table-condensed">
												<thead class="thead-dark">
													<tr>
														<th>철학 입문</th>
														<th>박성술</th>
														<th>영어과</th>
														<th>3학년</th>
													</tr>
												</thead>
											</table>
										</div>
										<div class="modal-body">
											<table class="table table-bordered table-hover table-condensed">
												<thead>
													<tr>
														<th>날짜</th>
														<th>출석</th>
														<th>지각</th>
														<th>조퇴</th>
														<th>결석</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2019/11/01</td>
														<td></td>
														<td></td>
														<td>O</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="modal-footer">
											${pageBar }
										</div>
						        <!-- Modal body end -->
						      </div>
						 
						    </div>
    					      <!-- @@Modal content End@@ -->
    
    <script>
     // Get the modal
        var classViewModal = document.getElementById('classViewModal');
 
        // Get the button that opens the modal
        var classViewBtn = document.getElementById("classViewBtn");
 
        // Get the <span> element that closes the modal
        var closeClassView = document.getElementById("closeClassView");                                          
        // When the user clicks on the button, open the modal 
        classViewBtn.onclick = function() {
           classViewModal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        closeClassView.onclick = function() {
        	classViewModal.style.display = "none";
        }

 
        // When the user clicks anywhere outside of the modal, close it
        /* window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        } */

        </script>
							
							
		<script type="text/javascript">
		/* $(document).ready(function(){
		$.datepicker.setDefaults($.datepicker.regional["ko"])
		$("#dateInput").datepicker();
			
		}); */
		</script>
							<!-- <script>
								$(document)
										.ready(
												function() {
													$('head')
															.append(
																	'<style type="text/css">.modal .modal-body {max-height: '
																			+ ($(
																					'body')
																					.height() * .7)
																			+ 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
												});

							/* 	$('#myModal').modal("toggle");
								// 반대로 모달상태를 전환함
								$('#myModal').modal("hide");
								// 모달창 열기
								$('#myModal').modal("show"); */
								// 모달창 닫음
							</script> -->
						</div>
					</div>

				<div class="card-footer" style="text-align : center;">
					<button class="btn btn-info">등록</button>
					<button class="btn btn-info">취소</button>
				</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main-content End -->



	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />