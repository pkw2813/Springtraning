<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header start -->

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/sool_header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<style>
.modal-dialog{ overflow-y: initial !important } .modal-body{ height: 100%; overflow-y: auto; }
</style>


<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<div class="container-fluid">
	<h3>학생 출결 관리</h3>
	<form action="${path }/prof/viewClassAttend.hd" method="post">
		<table class="table table-bordered table-hover col-md-10"
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
					<td><select name="subjectName">
							<option value="*" selected>과목선택</option>
							<option value="E1203">영어영문학</option>
							<option value="J123">자바프로그래밍</option>
							<option value="chul">철학입문1</option>
							<option value="Muyeok">무역영어</option>
					</select></td>
					<td>
						<div class="input-group date">
							<input type="text" class="form-control" name="attendDate"><span
								class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</td>
					<td><input type="text" placeholder="이름검색(미입력시 전체)" value=""
						name="studentName" /></td>
					<td><select name="grade">
							<option value="*" selected>학년검색</option>
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
					</select></td>
					<td><input type="text" placeholder="학과검색" value=""
						name="major" /></td>
					<td><input type="submit" value="검색"></td>
				</tr>
			</tbody>
		</table>
	</form>

	<!-- 출결 조건 검색창 끝 -->

	<h3>수강생 목록</h3>
	<!-- 수강생 출결 결과 출력 시작-->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered table-hover"
				style="text-align: center;">
				<thead class="thead-dark">
					<tr>
						<th>학번</th>
						<th>학과</th>
						<th>학년</th>
						<th>이름</th>
						<th>출석</th>
						<th>결석</th>
						<th>지각</th>
						<th>조퇴</th>
						<th>(금일 출결상태)2019-11-04</th>
						<th>
							<button type="button" class="btn btn-primary">금일 출석입력</button>
						</th>
						<th>
							<button type="button" class="btn btn-primary">전체 출석조회</button>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="success">
						<td>A2934</td>
						<td>영문학과</td>
						<td>4학년</td>
						<td>박성술</td>
						<td>12</td>
						<td>1</td>
						<td>2</td>
						<td>2</td>
						<td>미입력</td>
						<td><select name="attendStatus">
								<option value="*" selected>출결입력</option>
								<option value="출석">출석</option>
								<option value="결석">결석</option>
								<option value="지각">지각</option>
								<option value="조퇴">조퇴</option>
						</select></td>
						<td>
							<button type="button" class="btn btn-success btn-toggle" data-toggle="modal" data-target="#myModal">조회</button>
						</td>
					</tr>
				</tbody>
			</table>
							
				<div class="modal fade" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				      	<table class="table table-bordered table-hover">
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
				        <table class="table table-bordered table-hover">
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
				        		<tr>
				        			<td>2019/11/01</td>
				        			<td></td>
				        			<td></td>
				        			<td>O</td>
				        			<td></td>
				        		</tr>
				        		<tr>
				        			<td>2019/11/01</td>
				        			<td></td>
				        			<td></td>
				        			<td>O</td>
				        			<td></td>
				        		</tr>
				        		<tr>
				        			<td>2019/11/01</td>
				        			<td></td>
				        			<td></td>
				        			<td>O</td>
				        			<td></td>
				        		</tr>
				        		<tr>
				        			<td>2019/11/01</td>
				        			<td></td>
				        			<td></td>
				        			<td>O</td>
				        			<td></td>
				        		</tr>
				        		<tr>
				        			<td>2019/11/01</td>
				        			<td></td>
				        			<td></td>
				        			<td>O</td>
				        			<td></td>
				        		</tr>
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
				      <div class="modal-footer"></div>
				    </div>
				  </div>
				</div>
				<script>
				$(document).ready(function () { $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .7) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>'); });


				$('#myModal').modal("toggle");
				// 반대로 모달상태를 전환함
				$('#myModal').modal("hide");
				// 모달창 열기
				$('#myModal').modal("show");
				// 모달창 닫음
				</script>
		</div>
	</div>
	<div style="display: block; text-align : center ;">
		<button class="btn btn-info">등록</button>
		&nbsp;&nbsp;&nbsp;
		<button class="btn btn-info">취소</button>
	</div>
</div>

<!-- 달력 스크립트 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

<script type='text/javascript'>

	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy/mm/dd",
			language : "kr"
		});
	});
	(function($) {
		$.fn.datepicker.dates['kr'] = {
			days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일" ],
			daysShort : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
			daysMin : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
			months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ],
			monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ]
		};
	}(jQuery));
</script>


<jsp:include page="/WEB-INF/views/common/sool_footer.jsp" />