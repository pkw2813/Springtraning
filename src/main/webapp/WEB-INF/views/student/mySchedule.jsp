<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value="개인 시간표 조회"/>
	</jsp:include>


	<style>
		@import url('https://fonts.googleapis.com/css?family=Jua&display=swap');
		
		.nanumFont {
			font-family: 'Jua', sans-serif;
		}
		
		.topTable {
			background-color:#FAF4C0;
		}
		
		tr, td, th {
			text-align: center;
			font-size: 13px;
			border:1px solid lightgray;
			cursor: auto;
			font-family: 'Jua', sans-serif;
		}
		
		input{
			width:100px;
		}
	
		table {
			width: 100%;
		}

		.marginLeft {
			margin-left:10px;
		}
		.btn btn-outline-primary btn-sm{
			
		}
		#classInfo>tr{
			font-size:25px;
		}
		
		#classInfoTitle>th{
			border:1px solid Lightgray;
			font-size:16px;
			font-family:arial;
			text-align:center;
		}
		
		#classInfo>td{
			border:1px solid Lightgray;
			font-size:16px;
		}
		
	</style>
	
	
	<div class="main-panel">
	<div class="content-wrapper">
		<!-- 시작 -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
					<table class="table table-default table-striped nanumFont">
					<thead class="thead-dark">
					<tr>
					</tr>
				      <tr>
				        <th colspan="11" style="font-size:25px;" class="nanumFont">나의 수강신청 내역</th>
				      </tr>
				    </thead>
				<tr>
				<td style="background-color:#D4F4FA;"><h4>개설년도</h4>
				<select id="chk_year" name="chk_year" class="form-control form-control-sm" style="color:black;">
					<option value="">전체</option>
					<option id="thisYear" value=""></option>
					<option id="year2" value=""></option>
					<option id="year3" value=""></option>
					<option id="year4" value=""></option>
					<option id="year5" value=""></option>
				</select>
				</td>
				
				<td style="background-color:#CEFBC9;"><h4>개설학기</h4>
				<select id="chk_sem" name="chk_sem" class="form-control form-control-sm" style="color:black;">
					<option value="">전체</option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				</td>
				<td colspan="2" style="border:0px;">
				<button type="button" style="font-size:17px;" class="btn btn-outline-primary btn-icon-text">조회</button>
				</td>
				</tr>
				</table>
				<br><br>
				<table class="table table-default table-striped" >
					<tr>
					<td class="topTable">교시</td>
					<td class="topTable">월</td>
					<td class="topTable">화</td>
					<td class="topTable">수</td>
					<td class="topTable">목</td>
					<td class="topTable">금</td>
					</tr>
					<tr>
					<td>1교시<br>(09:00~09:50)</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
					<tr>
					<td>2교시<br>(10:00~10:50)</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
					<tr>
					<td>3교시<br>(11:00~11:50)</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
					<tr>
					<td>4교시<br>(12:00~12:50)</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
					<tr>
					<td>5교시<br>(13:00~13:50)</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
					<tr>
					<td>6교시<br>(14:00~14:50)</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
					<tr>
					<td>7교시<br>(14:00~14:50)</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>

	
	<script>

	/* 년도 띄워주기 */
		var today = new Date();
		var yyyy = today.getFullYear();
		console.log(yyyy);
		$("#thisYear").attr("value",yyyy);
		$("#thisYear").text(yyyy);
		$("#year2").attr("value",(yyyy-1));
		$("#year2").text((yyyy-1));
		
		$("#year3").attr("value",(yyyy-2));
		$("#year3").text((yyyy-2));
		
		$("#year4").attr("value",(yyyy-3));
		$("#year4").text((yyyy-3));
		
		$("#year5").attr("value",(yyyy-4));
		$("#year5").text((yyyy-4));
		

	</script>
	
	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>