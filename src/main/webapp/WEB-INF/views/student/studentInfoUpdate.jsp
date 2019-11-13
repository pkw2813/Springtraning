<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>
	
<!-- 카카오 주소 찾기 API -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<style>
	@import url('https://fonts.googleapis.com/css?family=Jua&display=swap');
	
		tr, td, th {
			text-align: left;
			font-size: 13px;
		
			cursor: auto;
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
	
	
		.modal fade{
			z-index: 1000;
		}
		.modal-header,.modal-body,.modal-footer{
			z-index:1001;
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
	<form method="post" action="${path }/student/studentInfoUpdateEnd.hd" enctype="multipart/form-data">
	<table class="table table-default table-hover table-striped">
	<thead class="thead-dark">
	<tr>
	<td colspan="8">
	</td>
	</tr>
      <tr>
        <th colspan="9" style="font-size:25px;font-family:arial">${student.stuName}님의 기본정보 변경</th><br/>
      </tr>
    </thead>
				<tr> 
					<th style="text-align:center;font-size:15px;" rowspan="6"  width="200px">
						
						<c:if test="${student.stuImgRename eq null }">
								<image id="LoadImg" height="200px" width="150px" src="${path }/resources/images/image/default.jpg"/>
								</c:if>
								<c:if test="${student.stuImgRename ne null }">
								<image id="LoadImg" height="200px" width="150px"  src="${path }/resources/images/image/${student.stuImgRename}"/>
								</c:if>
						<br><br>
							<input type="file" id="imgAttach"  name="imgAttach"/>
								<label for="imgAttach" class="btn btn-primary btn-xs" style="font-size:13px">사진 변경</label>
								<input type="hidden" name="LoadImgStat" id="LoadImgStat" value="false" />
								<br>
								<button type="button" id="pwChange"class="btn btn-primary btn-xs" style="font-size:13px">비밀번호변경</button>
								<br/>
								</tr>
			<th>학생번호</th>
			<td><input type="text" value="${student.stuNo}" style="width:130px" required disabled/>
				<input type="hidden" name="stuNo" value="${student.stuNo}"/>
			</td>
			<th>성명</th>
			<td><input type="text" value="${student.stuName}" required disabled/></td>
			<th>&nbsp;&nbsp;&nbsp;주민등록번호<br>(외국인등록번호)</th>
			<td><input type="text" value="${student.stuSsn}" style="width:130px" required disabled/></td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td><input type="text" name="stuTel" value="${student.stuTel}" style="width:120px" required/></td>
			<th>성별</th>
			<td>
			<select id="gender" name="gender" width="100px" disabled>
			  	<option value=>선택없음</option>
			    <option value="남">남</option>
			    <option value="여">여</option>
			</select></td>
			<th>메일주소</th>
			<td><input type="text" name="stuEmail"value="${student.stuEmail}" style="width:200px" style="width:200px" required/></td>
		</tr>
		<tr>
			<th>입학년월</th>
			<td><input type="text" value="<fmt:formatDate value="${student.enterDate}" pattern="yyyy-MM-dd"/>" required disabled/></td>
			<th>학적상태</th>
			<td>
				<select id="regStatus" name="regStatus" width="100px" disabled>
					<option value=>선택없음</option>
					<option value="재학">재학</option>
					<option value="휴학">휴학</option>
					<option value="졸업">졸업</option>
					<option value="제적">제적</option>
				</select>
			</td>
			<th>
				주소
			</th>
			
			<td>
			주소 &nbsp;<input type="text" id="stuAddr" name="stuAddr" value="${student.stuAddr}" style="width:200px" readonly/>
			<button  class="btn btn-outline-primary btn-sm" id="stuAddrButton" type="button" onclick="sample6_execDaumPostcode()" style="height:28px;margin-top:-6px"">주소변경</button><br>
			(우)&nbsp;&nbsp;&nbsp;<input type="text" id="stuPostCode" name="stuPostCode" value="222222" style="width:70px" readonly />
			<input type="text" id="stuAddrDt" name="stuAddr" style="width:130px" value=" " placeholder="상세주소입력" required/>
			<input type="hidden" class="totalAddress" name="totalAddress" id="totalAddress"/>
	
			</td>
			
		</tr>
			<tr>
			
				<th>지도교수</th>
				<td><input type="text" value="${student.profId}" required disabled/></td>
				<th>학과코드</th>
				<td><input type="text" value="${student.deptCode}" required disabled/></td>
				<th>계좌번호</th>
				<td><input type="text" name="stuAccount" value="${student.stuAccount}"  style="width:200px" required/></td>
			</tr>
			<tr>
				
				<th>학년학기</th>
				<td><input type="text" value="${student.stuYearSem}" required disabled/></td>
				<th>최대학점</th>
				<td><input type="text" value="${student.maxPsbCr}" required disabled/></td>
				<th>인정학기</th>
				<td><input type="text" value="${student.conSemester}" required disabled/></td>
			</tr>
	</table>
	 </form>
	
	
	<div class="card-footer" style="text-align : center;">
	 <input type="submit" id="submit" value="수정완료" class="btn btn-primary"/>
	 
	<!-- 비번교체 모달 -->
	 <div id="pwChangeModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content" style="width:400px">
      	<div id="topCloseBotton" style="text-align:right">
         <span class="close" id="closePw" Style="width:50px;">&times;</span>
  		</div>
        <form action="${path}/req.hd">
         <p style="font-family:jua;font-size:40px;">비밀번호변경</p>
         <div class="form-group">
         <hr>
         <p style="font-family:jua;font-size:15px;font-style: ">현재비밀번호</p>
         
         <input type="password" id="pwNow" name="pwNow"  style="font-family:jua" class="form-control" placeholder="현재비밀번호입력" required />
         <p id="pwTrue" style="font-family:jua;font-size:12px;color:green">비밀번호가 일치합니다</p>
         <p id="pwFalse" style="font-family:jua;font-size:12px;color:red">비밀번호가 일치하지 않습니다</p>
         <hr>
         <p style="font-family:jua;font-size:15px;">변경하실 비밀번호</p>
         <input type="password" class="form-control" id="pw-Change" name="toName" required/>
         <p id="pwChangeTrue" style="font-family:jua;font-size:12px;color:green">올바른 비밀번호입니다</p>
         <p id="pwChangeFalse" style="font-family:jua;font-size:12px;color:red"></p>
         <hr>
         <p style="font-family:jua;font-size:15px;">비밀번호 확인</p>
 		<input type="password" class="form-control" id="pw-checkChange" name="toName" required/>
 		<p id="pw-checkChangeTrue" style="font-family:jua;font-size:12px;color:green">새비밀번호와 일치합니다</p>
         <p id="pw-checkChangeFalse" style="font-family:jua;font-size:12px;color:red">새 비밀번호와 일치하지 않습니다</p>
         <hr>
         </div>
         <div style="text-align:center">
         <input type="button" class="btn btn-inverse-info btn-fw" id="closePw2" value="확인" style="float: right; margin: 7px;">
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
	var pwNow;
	var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

		 $("#pwTrue").hide();
		 $("#pwFalse").hide();
		 $("#pwChangeTrue").hide();
		 $("#pwChangeFalse").hide();
		 $("#pw-checkChangeTrue").hide();
		 $("#pw-checkChangeFalse").hide();
		

		
		
	
	
	 
	$("#pwNow").keyup(function(){
		pwNow=$("#pwNow").val();
		if(pwNow.length>3){
		$.post({
            url: "${path}/student/changePw.hd",
            type: "post",
            data: {"pwNow":pwNow},
            dataType:"json",
            success: function(data){
            	 
            	 
            	 if(data.pwck === "true"){
            	  $("#pwTrue").show();
            	   $("#pwFalse").hide();   
            	 }else{
            	  $("#pwFalse").show(); 
            	  $("#pwTrue").hide();
            	 }
                	
            		},
            error: function(){
                alert("에러처리");
             
                
            }
        });
		}else{$("#pwTrue").hide();
		$("#pwFalse").hide();}
		
		 
		
	});
	
	
	$("#pw-Change").keyup(function(){
		console.log(chkPwd($("#pw-Change").val()));

		$("#pwChangeFalse").show();
		$("#pwChangeFalse").text(chkPwd($("#pw-Change").val()));
		
		
		
		
		if(chkPwd($("#pw-Change").val())==true){
			 $("#pwChangeTrue").show();
			 $("#pwChangeFalse").hide()
			
		}
		
		
		$("#pw-checkChange").keyup(function(){
			
			
			
			
			if($("#pw-Change").val()===$("#pw-checkChange").val()){
				$("#pw-checkChangeTrue").show();
				$("#pw-checkChangeFalse").hide();					
			}else{
				$("#pw-checkChangeFalse").show();
				$("#pw-checkChangeTrue").hide();	
				
				
			}
			
		});
		
			
			
		
		
		
		
	})
	
	
	
	
	
	function chkPwd(str){
		var status="";
		 var pw = str;

		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 if(pw.length < 8 || pw.length > 20){	 
			status="8글자이상 20자이내로 가능합니다"
		  return status;
		 }

		 if(pw.search(/₩s/) != -1){
			status="공백은(spacebar) 사용할수 없습니다"
		  	return status;

		 } if(num < 0 || eng < 0 || spe < 0 ){
		
			status="영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요."
		  	return status;
		 }

			 return true;
		}
		

	
	
	
	var headerModal1 = document.getElementById('pwChangeModal');
	 
    // Get the button that opens the modal
    var headerBtn1 = document.getElementById("pwChange");

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
	
	
	$("#totalAddress").val($("#stuPostCode").val()+"PSTC"+$("#stuAddr").val());
	
		function LoadImg(value){ // 변경된 그림을 보여주는 함수
			console.log($("#LoadImgStat").val());
			$("#LoadImgStat").val("true");
			console.log($("#LoadImgStat").val());
			if(value.files && value.files[0]){
				var reader=new FileReader();
				reader.onload=function(e){
					$('#LoadImg').attr('src',e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	
		$("#imgAttach").change(function(){ // 첨부파일이 변경되면
			LoadImg(this); // 해당 이미지로 변경하기
			console.log("loadImg가 변경됨!!!!!");
		})
		
		
		$("#LoadImg").change(function(){ // 보류
			//$("#imgAttach").attr("value","true");
			console.log("loadImg가 변경됨");
		});
		
		
		
		// 카카오 주소검색 서비스
	
	     function sample6_execDaumPostcode() {
			$("#stuAddrDt").show();
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가 "로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        //document.getElementById("sample6_extraAddress ").value = extraAddr;

                    } else {
                        // document.getElementById("sample6_extraAddress ").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('stuPostCode').value = data.zonecode;
                    document.getElementById("stuAddr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    
                    document.getElementById("stuAddrDt").focus();
                    
                    $("#stuAddrDt").blur(function(){
                    	 $("#totalAddress").val($("#stuPostCode").val()+"PSTC"+$("#stuAddr").val()+" "+$("#stuAddrDt").val());
                    });
                    console.log($("#totalAddress").val())
                }
            }).open();
        }
		
		
	</script>
	
	
		 

	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>