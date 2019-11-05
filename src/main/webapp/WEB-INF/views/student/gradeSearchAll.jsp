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
	th, td, .my-header{
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
					<div class="card-header" style="height:100px;">
						<h4>과목별 성적</h4>
						<div class="form-group row">
	                      <label for="exampleInputUsername2" class="col-sm-3 col-form-label"><i class="ti-control-record"></i>&nbsp;정렬 순서</label>
	                      <div class="col-sm-9">
	                        <select class="form-control" id="exampleInputUsername2">
							<option>년도학기</option>
							<option>이수구분</option>
							<option>교과목명</option>
						</select>
	                      </div>
	                    </div>

					</div>
					<div class="card-body">
						<!-- 부트스트랩에서는 화면 폭이 좁을 때(768px 이하) 하단에 스크롤바가 나타나며 수평으로 스크롤해서 테이블을 볼 수 있게 했습니다. 
						<table> 태그 외곽에 <div> 태그로 감싸서 .table-responsive 클래스를 추가하면 반응형 테이블로 사용할 수 있습니다. -->
						<div class="table-responsive">
						<pre class="pre-scrollable" style="max-height:300px;">
							<table class="table table-striped table-bordered table-hover table-condensed">
								<thead class="thead-dark">
									<tr class="my-header">
										<th scope="col">순번</th>
										<th scope="col">학년도</th>
										<th scope="col">학기</th>
										<th scope="col">교과목코드</th>
										<th scope="col">교과목명</th>
										<th scope="col">이수구분</th>
										<th scope="col">이수학점</th>
										<th scope="col">취득등급</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach item="${list }" var="l" varStatus="s">
										<tr>
											<td scope="row">${s.count }</td>
											<td>${l.acaYearSem }2019</td>
											<td>${l.acaYearSem }1</td>
											<td>${l.subCode }A-001</td>
											<td>${l.subName }재미있는진로선택-내인생의네비게이션</td>
											<td>교양선택</td>
											<td>3학점</td>
											<td>B+</td>
										</tr>									
									</c:forEach>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
									</tr>
								</tbody>
							</table>
							</pre>
					</div>

					</div>
					<div class="card-footer">
						<!-- <button type="submit" class="btn btn-primary">검색</button> -->
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="card">
					<div class="card-header" style="height:50px;">
						<h4>이수구분별 성적</h4>
					</div>
					<div class="card-body">
						<!-- 부트스트랩에서는 화면 폭이 좁을 때(768px 이하) 하단에 스크롤바가 나타나며 수평으로 스크롤해서 테이블을 볼 수 있게 했습니다. 
						<table> 태그 외곽에 <div> 태그로 감싸서 .table-responsive 클래스를 추가하면 반응형 테이블로 사용할 수 있습니다. -->
						<div class="table-responsive">
						<pre class="pre-scrollable" style="max-height:300px;">
							<table class="table table-striped table-bordered table-hover table-condensed">
								<thead class="thead-dark">
									<tr class="my-header">
										<th scope="col">순번</th>
										<th scope="col">학년도</th>
										<th scope="col">학기</th>
										<th scope="col">교양필수</th>
										<th scope="col">교양선택</th>
										<th scope="col">전공필수</th>
										<th scope="col">전공선택</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">1</td>
										<td>2018</td>
										<td>2</td>
										<td>A001</td>
										<td>연습용과목</td>
										<td>교양선택</td>
										<td>3학점</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
										<td>데이터1</td>
									</tr>
									<tr>
										<td>데이터1</td>
										<td>데이터2</td>
										<td>데이터3</td>
										<td>데이터4</td>
										<td>데이터5</td>
										<td>데이터6</td>
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

		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="card">
					<div class="card-header" style="height:50px;">
						<h4>학기별 성적</h4>
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
										<th scope="col">신청학점</th>
										<th scope="col">취득학점</th>
										<th scope="col">평균펑점</th>
										<th scope="col">평균평점F</th>
										<th scope="col">석차</th>
										<th scope="col">인원</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">1</td>
										<td>2018</td>
										<td>2</td>
										<td>9</td>
										<td>9</td>
										<td>4.5</td>
										<td>4.5</td>
										<td>1</td>
										<td>9</td>
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