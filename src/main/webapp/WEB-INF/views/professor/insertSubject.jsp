<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>
	
<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">강의 개설</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row gap1">
					<div class="col-6">
						<table class="scrolltable" style="text-align:center;overflow-y:scroll;height:270px;">
							<tr style="background-color:lightgray;">
								<th style="text-align:center;">이수구분</th>
								<th style="text-align:center;">개설학기</th>
								<th style="text-align:center;">과목명</th>
								<th style="text-align:center;">강의시간</th>
								<th style="text-align:center;">학과코드</th>
								<th style="text-align:center;">수강학년</th>
								<th style="text-align:center;">수강학과</th>
								<th style="text-align:center;">정원</th>
								<th style="text-align:center;">개설여부</th>
							</tr>
							<%-- <c:forEach items="" var=""> --%>
							<tr style="height:30px;">
								<td>임시</td>
								<td>임시</td>
								<td><a href="#">임시</a></td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
							</tr>
							<%-- </c:forEach> --%>
						</table>
					</div>
					<div class="col-6">
						<table id="" class="scrolltable" style="text-align:center;overflow-y:scroll;height:270px;">
							<tr style="background-color:lightgray;">
								<th style="text-align:center;">이수구분</th>
								<th style="text-align:center;">개설학기</th>
								<th style="text-align:center;">과목명</th>
								<th style="text-align:center;">강의시간</th>
								<th style="text-align:center;">학과코드</th>
								<th style="text-align:center;">수강학년</th>
								<th style="text-align:center;">수강학과</th>
								<th style="text-align:center;">교수명</th>
								<th style="text-align:center;">정원</th>
							</tr>
							<%-- <c:forEach items="" var=""> --%>
							<tr style="height:30px;">
								<td>임시</td>
								<td>임시</td>
								<td><a href="#">임시</a></td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
								<td>임시</td>
							</tr>
							<%-- </c:forEach> --%>
						</table>
					</div>
				</div>
				
				<form action="" method="post" id="insertSubject">
				<input type='hidden' value="${profId }"/>
				<div class="row" style="height:7px;border-top:0.5px solid black;"></div>
				<div class="row">
					<div class="col-6">
						<button class="" style="background-color:skyblue;border:none;">개설강좌</button>
						<button class="" style="background-color:skyblue;border:none;">시간표</button>
					</div>
					<div class="col-6">
						<input id="insertButton" type='button' style="float:right;" value="강의 등록"/>
					</div>
				</div>
					<div class="row" style="height:5px;"></div>
					<div class="row" style="height:5px;"></div>
					<div class="row" style="">
						<div class="col-4">
							<table class="">
								<tr>
									<th>개설학기</th>
									<td><input name="classYear" id="fn_year" type='number' min="2019" max="2050" style="width:100px;"  value='<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy"/>' /> 년도 </td>
									<td><input type='text' id="tSemester" name="tSemester" style="width:15px;text-align:center;" readonly/> 학기</td>
								</tr>
								<tr>
									<th>교수명</th>
									<input type='hidden' name="profId" value="${loginMember.profId }"/>
									<td><input name="profName" type='text' value="${profName }" readonly/></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input name="phone" type='tel' value="${loginMember.phone }"/></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input name="email" type='email' value="${loginMember.email }"/></td>
								</tr>
								<tr>
									<th>과목명</th>
									<td><input id="subName" name="subName" type='text' readonly/></td>
									<td>
										<input id="fn_subjectCode" name="subCode" style="width:70px;text-align:center;" type='button' value="과목 코드" readonly/>
									</td>
								</tr>
								<tr>
									<th>수강학년</th>
									<td><input type='text' id="tGrade" name="tGrade" readonly/></td>
								</tr>
								<tr>
									<th>수강학과</th>
									<td><input id="tDept" name="tDept" type='text' readonly/></td>
								</tr>
							</table>
						</div>
						<div class="col-4">
							<table class="">
								<tr>
									<th>강의실</th>
									<td><input id="classRoom" name="classRoom" type='text' readonly/></td>
								</tr>
								<tr>
									<th>강의시간</th>
									<td><input id="classTime" name="classTime" type='text' readonly/></td>
								</tr>
								<tr>
									<th>강의요일</th>
									<td><input id="classDate" name="classDate" type="text" readonly/></td>
								</tr>
								<tr>
									<th>강의목표</th>
									<td><input id="tSubject" name="tSubject" type='text' readonly/></td>
								</tr>
								<tr>
									<th>학과코드</th>
									<td><input id="deptCode" name="deptCode" type='text' readonly/></td>
								</tr>
								<tr>
									<th>단위</th>
									<td><input id="completePt" name="completePt" style="width:60px;" type='number' readonly/> &nbsp; 학점</td>
								</tr>
								<tr>
									<th>이수구분</th>
									<td><input type='text' id="subType" name="subType" class="selectBox" readonly/></td>
								</tr>
							</table>
						</div>
						<div class="col-4">
							<table class="">
<!-- 								<tr>
									<th>전공</th>
									<td><input name="deptName" type='text'/></td>
								</tr> -->
								<tr>
									<th>정원</th>
									<td><input name="capacity" type='number' style="width:60px;" min="25" max="30"/> 명 </td>
								</tr>
								<tr>
									<th>교재 사용</th>
									<td><select name="useBook" class="selectBox">
										<option value="사용">사용</option>
										<option value="미사용" selected="selected">미사용</option>
									</select></td>
								</tr>
								<tr>
									<th>교재 제목 입력</th>
									<td><input name="bookName" type='text'/></td>
								</tr>
								<tr>
									<th>평가 기준</th>
									<td><select name="evaStan" class="selectBox">
										<option value="상대" selected>상대</option>
										<option value="절대">절대</option>
									</select></td>
								</tr>
								<tr>
									<th>재수강여부</th>
									<td><select name="" class="selectBox">
										<option value="가능" selected>가능</option>
										<option value="불가능">불가능</option>
									</select></td>
								</tr>
								<tr>
									<th>타교생 허용</th>
									<td><select name="openOther" class="selectBox">
										<option value="가능">가능</option>
										<option value="불가능">불가능</option>
									</select></td>
								</tr>
								<tr>
									<th>개설여부</th>
									<td><select name="openYn" class="selectBox">
										<option value="Y" selected>Y</option>
										<option value="N">N</option>
									</select></td>
								</tr>
								<tr>
									<th style="width:150px;">강의계획서 첨부파일</th>
									<td><input name="upfile" type='file'/></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row" style="height:50px;border-bottom:0.5px solid black;">
						<div class="col-12">
							<table class="">
								<tr>
									<th>평가기준</th>
									<th style="width:50px;">중간</th><td><input name="mTerm" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;기말</th><td><input name="fTerm" style="width:70px;background-color:snow" type='text'/></td>
									<!-- <th style="width:50px;">&nbsp;&nbsp;과제</th><td><input name="assign" style="width:70px;background-color:snow" type='text'/></td> -->
									<th style="width:50px;">&nbsp;&nbsp;출석</th><td><input name="statusGrade" style="width:70px;background-color:snow" type='text'/></td>
								</tr>
								<tr>
									<th>과제기준</th>
									<th style="width:50px;">과제A</th><td><input name="assignA" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;과제B</th><td><input name="assignB" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;과제C</th><td><input name="assignC" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;과제D</th><td><input name="assignD" style="width:70px;background-color:snow" type='text'/></td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			</div>
		</div>
	</div>
</div>


<!-- <div class="container-fluid"> -->
	


<script>

$(function(){
	$("#fn_subjectCode").click(function(){
		var url="${pageContext.request.contextPath }/professor/subjectCodeView?profId=${loginMember.profId}";
    	var name="subject";
    	var option="width=1000,height=500,top=100,left=265,resizable=no";
    	window.open(url,name,option);
	});
});
function selectSubject(subCode){
	$.ajax({
		url:"${pageContext.request.contextPath}/professor/selectSubject",
		data:{"subCode":subCode},
		success:function(data){
			console.log("성공");
			console.log(data);
			//var subject = new Array();
			var subject = JSON.parse(data);
			console.log(subject.DEPT_CODE);
			console.log(subject.SUB_CODE);
			$("#deptCode").val(subject.DEPT_CODE);
			$("#fn_subjectCode").val(subject.SUB_CODE);
			$("#tDept").val(subject.T_DEPT);
			$("#tGrade").val(subject.T_GRADE);
			$("#completePt").val(subject.COMPLETE_PT);
			$("#tSemester").val(subject.T_SEMESTER);
			$("#subType").val(subject.SUB_TYPE);
			$("#subName").val(subject.SUB_NAME);
			$("#tSubject").val(subject.T_SUBJECT);
			$("#classDate").val(subject.SUB_DATE);
			$("#classTime").val(subject.SUB_TIME);
			$("#classRoom").val(subject.SUB_ROOM);
   	 	}
	});
	
}
//textarea 글자수 제한
$(function(){
	$('.textsize').on('keyup', function() {
		if($(this).val().length > 200) {
			alert("글자수는 200자로 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 200));
		}
	});
});

$(function(){
	$("#fn_year").on('blur', function(){
		if($(this).val()<'2019'){
			alert("이전 년도는 불가능합니다.");
			$(this).val('');
		}return;
	});
});

$(function(){
	$("#insertButton").click(function(){
		if(confirm("등록 하시겠습니까?")==true){
			console.log($("#insertSubject input,#insertSubject select"));
			var data=new FormData();
				$.each($("#insertSubject input,#insertSubject select"),function(i,item){
					var name=$(item).attr("name");
					var value=$(item).val();
					if(name=='upfile'){
						data.append(name,$(item)[0].files[0])
					}else{
						data.append(name,value);
					}
			});
			
		$.ajax({
			url:"${path}/professor/insertSubjectEnd",
			data:data,
			type:"post",
			processData:false,
			contentType:false,
			success:function(data){
				var d=JSON.parse(data);
				console.log(d);
				var tr= $("<tr>");
				var data="<td>"+d[0]["subCode"])"</td>";
				tr.append(data);
				
			}
		});
		}else{
			return false;
		}
	});
});
</script>
<style>
	.scrolltable {
	    display: block;
	    overflow: auto;
	}
	select{
		font-size:10px;
		width:auto;
	}
	input{
		width:150px;
		font-size:10px;
	}
	div{
		/* border:0.5px solid coral; */
		font-size:10px;
	}
	.gap1{
		height:300px;
	}
	table tr th{
		width:120px;
		text-align:left;
		padding:4px;
 		font-size:10px;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>