<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

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
						<h4 class="font-weight-bold mb-0">강의 자료 업로드</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<!-- <div class="row"><p style="font-size:25px;">글작성</p></div> -->
					<div class="row" style="margin:5px;">
						<div class="col-12">
							<table class="spacing">
								<tr>
									<th>글쓴이</th>
									<td><input class="btn btn-default" name="profName" style="text-align:left;" type='text' value="${loginMember.profName }" readonly/></td>
								</tr>
								<tr>
									<th>옵션</th>
									<td>
										<input id="selectContext" name="profBoardType" class="btn"/>
									</td>
								</tr>
								<tr>
									<th>입력일</th>
									<td><input class="btn btn-default" style="width:800px;text-align:left;" type='text' value='<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>' readonly/></td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input id="selectTitle" name="profBoardTitle" class="btn btn-default" style="width:800px;border:1px solid black;text-align:left;" type='text'/></td>
								</tr>
								<tr><td><br/></td></tr>
								<tr>
									<th>첨부파일</th>
									<td>
									</td>
								</tr>
								<tr><td><br/></td></tr>
								<tr>
									<th>내용</th>
									<td><textarea id="context" class="btn btn-default" name="profBoardContent" style="height:400px;width:800px;border:1px solid black;text-align:left;"></textarea></td>
								</tr>
							</table>
									  <c:forEach items="profAttachment" var="file" varStatus="vs">
										   <button type="button" class="btn btn-outline-success btn-block"
								                  onclick="fileDownload('${file.originalFileName}','${file.renamedFileName }');">
								             <c:out value="${file.originalFileName }"/>
								           </button>
							          </c:forEach>
						</div>
					</div><br/>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-3"></div>
						<div class="col-6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='button' id="updateBoard" class="btn btn-dark" value=" 글 수정 "/>
							<input class="btn btn-dark" type='button' value=" 글 삭제 "/>
							<input type='button' id="boardView" class="btn btn-dark" value=" 글 목록 "/>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>

<script>
	/* 파일 다운로드 */
	function fileDownload(oName, rName){
		oName = encodeURIComponent(oName);
		location.href="${pageContext.request.contextPath}/professor/fileDownload?oName="+oName+"rName="+rName;
	}
	$(function(){
		$("#creBtn").one("click",function(){
			var input=$("<input>").attr({"type":"file","name":"upFile"});
			$(this).prev().after(input);
		});
		$("#delBtn").one("click",function(){
			$("#upFile").remove();
			return false;
		});
	});
	
	$(function(){
		$("#selectContext").change(function(){
			console.log($("#selectContext").val());
			if($("#selectContext").val()=="강의 자료"){
				$("#context").text("${prof.profId}");
			}
		})
	});
	$(function(){
		$("#selectContext").change(function(){
			console.log($("#selectContext").val());
			if($("#selectContext").val()=="학과 자료"){
				$("#selectTitle").text("[학과자료]");
			}
			else if($("#selectContext").val()=="강의 자료"){
				$("#selectTitle").text("[강의자료]");
			}
			else if($("#selectContext").val()=="기타 자료"){
				$("#selectTitle").text("[기타자료]");
			}
		})
	});
	
	$(function(){
		$("#boardView").click(function(){
			history.back();
		});
	});

</script>

<style>
	.spacing{
		border-spacing:4px;
	    border-collapse: separate;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>