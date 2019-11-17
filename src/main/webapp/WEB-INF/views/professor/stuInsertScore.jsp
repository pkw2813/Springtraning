<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="${path }/resources/js/jquery-3.4.1.min.js"></script>



  
<c:set var="path" value="${pageContext.request.contextPath }" />



    
<style>
tr, td{
	text-align: left;
	font-size: 16px;
	cursor: auto;
border:1px solid lightgray;
text-align:center;
}

	th{
		text-align:center;
		font-size: 13px;
		cursor: auto;
	border:1px solid lightgray;
		vertical-align: middle;
	}

input {
	width: 100px;
}

table {
	width: 100%;
}

.content-wrapper{
	
	padding:20px;
}

.form-control{

	width:70px;
	height:30px;
	display:inline:block;
	font-size:13px;
}


</style>


<div class="main-panel">
	<div class="content-wrapper">

		<!-- 시작 -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
						<table class="table table-default table-striped">
							
							
							    <tr >
							        <td class="thead-dark" colspan="5" style="font-size:25px;font-family:arial">학생성적입력</th><br/>
						    	<tr>
					    
					    <tr>
							
						</tr>
							
					   
								<td rowspan="5" style="width:130px;text-align: center;">
								<c:if test="${result.stuImgRename eq null }">
								<image height="150px" width="120px" src="${path }/resources/images/image/default.jpg"/>
							</c:if>
								<c:if test="${student.stuImgRename ne null }">
								<image height="150px" width="120px" src="${path }/resources/images/image/${student.stuImgRename}"/>
								</c:if>
								</td>
							
							<tr style="height:30px;text-align:center;">
								<th style="width:200px;">학생이름</th>
								<th style="width:300px;">학과</th>
								<th style="width:300px;">과목</th>
								<th style="width:300px;">성별</th>
							<tr>
								<td>${result.STU_NAME}</td>
								<td>${result.DEPT_NAME}</td>
								<td>${result.SUB_NAME}</td>
								<td>${result.GENDER}</td>
							</tr>
							<tr style="height:20px;text-align:center;">
								<th>학년</th>
								<th>학적상태</th>
								<th>이메일주소</th>
								<th>연락처</th>
							<tr>
								<td>${fn:substring(result.STU_YEAR_SEM,0,1)}학년</td>
								<td>${result.REG_STATUS }</td>
								<td>${result.STU_EMAIL}</td>
								<td>${result.STU_TEL}</td>
							</tr>
					</table>
					<table class="table table-default table-striped">
						<tr>
						<th>과제1</th>
						<th>과제2</th>
						<th>과제3</th>
						<th>과제4</th>
						</tr>
			
				<tr>
						
					<td>
						<c:if test="${result.ASSIGN_1_1 eq 0 }">
						평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_1_1 > 0 or result.ASSIGN_1_1 ne null }">
						<c:if test="${result.ASSIGN_1 ne null}">
						<input id="ASSIGN_1" value="${result.ASSIGN_1}" disabled> 평가완료
						</c:if>
						
						<c:if test="${result.ASSIGN_1 eq null}">
						<input id="ASSIGN_1" value="${result.ASSIGN_1}"> /배점 : ${result.ASSIGN_1_1}%
						<button class="btn btn-primary btn-sm" value="ASSIGN_1,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value,id)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
						<c:if test="${result.ASSIGN_2_1 eq 0 }">
						평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_2_1 > 0 or result.ASSIGN_2_1 ne null }">
						<c:if test="${result.ASSIGN_2 ne null}">
						<input id=ASSIGN_2 value="${result.ASSIGN_2}" disabled>  평가완료
						</c:if>
						
						<c:if test="${result.ASSIGN_2 eq null}">
						<input id=ASSIGN_2 value="${result.ASSIGN_2}"> /배점 : ${result.ASSIGN_2_1}%
						<button class="btn btn-primary btn-sm" value="ASSIGN_2,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
						<c:if test="${result.ASSIGN_3_1 eq 0 }">
						평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_3_1 > 0 or result.ASSIGN_3_1 ne null }">
						<c:if test="${result.ASSIGN_3 ne null}">
						<input id=ASSIGN_3 value="${result.ASSIGN_3}" disabled> 평가완료
						</c:if>
						
						<c:if test="${result.ASSIGN_3 eq null}">
						<input id=ASSIGN_3 value="${result.ASSIGN_3}"> /배점 : ${result.ASSIGN_3_1}%
						<button class="btn btn-primary btn-sm" value="ASSIGN_3,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
						<c:if test="${result.ASSIGN_4_1 eq 0 }">
						평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_4_1 > 0 or result.ASSIGN_4_1 ne null }">
						<c:if test="${result.ASSIGN_4 ne null}">
						<input id=ASSIGN_4 value="${result.ASSIGN_4}" disabled> 평가완료
						</c:if>
						
						<c:if test="${result.ASSIGN_4 eq null}">
						<input id=ASSIGN_4 value="${result.ASSIGN_4}"> /배점 : ${result.ASSIGN_4_1}%
						<button class="btn btn-primary btn-sm" value="ASSIGN_4,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
						
						<tr>
						<th>중간</th>
						<th>기말</th>
						<th>출석</th>
						<th>최종학점</th>
						</tr>
					<tr>
						<td>
						<c:if test="${result.MTERM_1 eq 0 }">
						평가없음
						</c:if>
						
						<c:if test="${result.MTERM_1 > 0 or result.MTERM_1 ne null }">
						<c:if test="${result.MTERM ne null}">
						<input id=MTERM value="${result.MTERM}" disabled> 평가완료
						</c:if>
						
						<c:if test="${result.MTERM eq null}">
						<input id=MTERM value="${result.MTERM}"> /배점 : ${result.MTERM_1}%
						<button class="btn btn-primary btn-sm" value="MTERM,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					<td>
						<c:if test="${result.FTERM_1 eq 0 }">
						평가없음
						</c:if>
						
						<c:if test="${result.FTERM_1 > 0 or result.FTERM_1 ne null }">
						<c:if test="${result.FTERM ne null}">
						<input id=FTERM value="${result.FTERM}" disabled> 평가완료
						</c:if>
						
						<c:if test="${result.FTERM eq null}">
						<input id=FTERM value="${result.FTERM}"> /배점 : ${result.FTERM_1}%
						<button class="btn btn-primary btn-sm" value="FTERM,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					<td>
						<c:if test="${result.STATUS_GRADE_1 eq 0 }">
						평가없음
						</c:if>
						
						<c:if test="${result.STATUS_GRADE_1 > 0 or result.STATUS_GRADE_1 ne null }">
						<c:if test="${result.STATUS_GRADE ne null}">
						<input id=STATUS_GRADE value="${result.STATUS_GRADE}" disabled> 평가완료
						</c:if>
						
						<c:if test="${result.STATUS_GRADE eq null}">
						<input id=STATUS_GRADE value="${result.STATUS_GRADE}"> / 배점 : ${result.STATUS_GRADE_1}%
						<button class="btn btn-primary btn-sm" value="STATUS_GRADE,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
					
						<c:if test="${result.GRADE eq 0}">
						<input id=GRADE value="${result.GRADE}"> 
						<button class="btn btn-primary btn-sm" value="GRADE,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						
						
						<c:if test="${result.GRADE ne 0}">
						<input id=GRADE value="${result.GRADE}" disabled> 평가완료 
						
						</c:if>
						
					
					</td>				
						</tr>
					</table>
					
					
	<div id="pwChangeModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content" style="width:400px">
      	<div id="topCloseBotton" style="text-align:right">
         <span class="close" id="closePw" Style="width:50px;">&times;</span>
  		</div>
        
         <p style="font-family:jua;font-size:40px;">비밀번호가 필요한페이지 입니다</p>
         <div class="form-group">
         <hr>
         <p style="font-family:jua;font-size:15px;font-style: ">현재비밀번호</p>
         
         <input type="password" id="pwNow" name="pwNow"  style="font-family:jua" class="form-control" placeholder="현재비밀번호입력" required />
         <p id="pwTrue" style="font-family:jua;font-size:12px;color:green">비밀번호가 일치합니다</p>
         <p id="pwFalse" style="font-family:jua;font-size:12px;color:red">비밀번호가 일치하지 않습니다</p>
         
       	</div>
         </div>
       
     </form>
      </div>
					
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


	







<script>

var headerModal1 = document.getElementById('pwChangeModal');

// Get the button that opens the modal
var headerBtn1 = document.getElementById("pwChange");

// Get the <span> element that closes the modal
var closePw = document.getElementById("closePw");                                          
// When the user clicks on the button, open the modal 
headerBtn1.onclick = function() {
   headerModal1.style.display = "block";
}


$(document).ready(function(){

	headerModal1.style.display = "block";

});




function updatePoint(value){
		var asdff = value.split(",");
		var id=asdff[0];
		value+=document.getElementById(id).value;

		if (confirm("한번입력된 점수는 수정이 불가합니다 입력하시겠습니까??") == true){    //확인
			
			 	$.post({
				 
		            url: "${path}/prof/updatePoint.hd",
		            type: "post",
		            data: {"value":value},
		            success: function(data){
		            		alert("성공")
		            		location.reload();
			               

		            },
		            error: function(){
		                alert("에러발생 관리자에게 문의하세요");
		            }
		        });
			
			
		 }else{   //취소

		     return false;

		 }
		
		
		
		
		
		
		$("#pwNow").keyup(function(){
		});
		
		
	
		
		
		

	    // When the user clicks on <span> (x), close the modal
	    closePw.onclick = function() {
	       headerModal1.style.display = "none";
	     	 $("#pwNow").val("");
		  	 $("#pw-Change").val("");
		  	 $("#pw-checkChange").val("");
		  	 $("#pwTrue").hide();
			 $("#pwFalse").hide();
			 $("#pwChangeTrue").hide();
			 $("#pwChangeFalse").hide();
			 $("#pw-checkChangeTrue").hide();
			 $("#pw-checkChangeFalse").hide();
	       
	    }
	    

		
		$("#stuAddrDt").hide(); 
		$("#regStatus").val('${student.regStatus}');
		$("#gender").val('${student.gender}');
		$("#imgAttach").hide();
		$("#submit").click(function(){
			 if (confirm("변경하시겠습니까?") == true){    //확인
			     document.removefrm.submit();
			 
			 }else{   //취소

			     return false;

			 }

		});
		
		
		
	
	
}

</script>




	