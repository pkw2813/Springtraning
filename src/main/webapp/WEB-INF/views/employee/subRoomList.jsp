<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<div class="main-panel">
	<div class="content-wrapper">
	<div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Inline forms</h4>
                <div class="row">
                  <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year" name="subYear">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학기 선택</label>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input seme" name="subSemester" value="1">
                                1학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-3">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input seme" name="subSemester" value="2">
                                2학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                        </div>
                      </div>
                      </div>
                      <div class="row">
                     <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의관</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="roomTitle">
                            	<option id="roomTitlec">강의관 선택</option>
                            	<option value="A">A관</option>
                            	<option value="B">B관</option>
                            	<option value="C">C관</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의실</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="classRoom" name="subRoom">
                            </select>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-2">
                    <button class="btn btn-primary mb-2" id="roomUseBtn">조회</button>
                    </div>
                    </div>
                </div>
              </div>
            </div>
			

<div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Bordered table</h4>
                  <p class="card-description">
                    Add class <code>.table-bordered</code>
                  </p>
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered" id="roomTable">
                        <tr>
                        	<th>/</th>
	                        <th>월요일</th>
	                        <th>화요일</th>
	                        <th>수요일</th>
	                        <th>목요일</th>
	                        <th>금요일</th>
                        </tr>
                        <tr>
                        	<td>09:00~09:50 - (1교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<td>10:00~10:50 - (2교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                      	<tr>
                        	<td>11:00~11:50 - (3교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<td>12:00~12:50 - (4교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<td>13:00~13:50 - (5교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<td>14:00~14:50 - (6교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<td>15:00~15:50 - (7교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<td>16:00~16:50 - (8교시)</td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<td>17:00~17:50 - (9교시)</td>
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
			<script>
			$("#roomUseBtn").click(function(){
				var year=$("#year").val();
				var subSeme = $(":input:radio[name=subSemester]:checked").val();
				var classRoom=$("#classRoom").val();
				$.ajax({
					url:"${path}/subRoomUse.hd",
					data:{"subYear": year,"subSemester": subSeme,"subRoom": classRoom},
					success:function(data){
						var re=JSON.parse(data);
						var roomArr="";
						roomArr+="<tr><th>/</th><th>월요일</th><th>화요일</th><th>수요일</th><th>목요일</th><th>금요일</th></tr>";
						roomArr+="<tr><td>09:00~09:50 - (1교시)</td><td id='mon1'></td><td id='tue1'></td><td id='wed1'></td><td id='thu1'></td><td id='fri1'></td></tr>";
						roomArr+="<tr><td>10:00~10:50 - (2교시)</td><td id='mon2'></td><td id='tue2'></td><td id='wed2'></td><td id='thu1'></td><td id='fri2'></td></tr>";
						roomArr+="<tr><td>11:00~11:50 - (3교시)</td><td id='mon3'></td><td id='tue3'></td><td id='wed3'></td><td id='thu1'></td><td id='fri3'></td></tr>";
						roomArr+="<tr><td>12:00~12:50 - (4교시)</td><td id='mon4'></td><td id='tue4'></td><td id='wed4'></td><td id='thu1'></td><td id='fri4'></td></tr>";
						roomArr+="<tr><td>13:00~13:50 - (5교시)</td><td id='mon5'></td><td id='tue5'></td><td id='wed5'></td><td id='thu1'></td><td id='fri5'></td></tr>";
						roomArr+="<tr><td>14:00~14:50 - (6교시)</td><td id='mon6'></td><td id='tue6'></td><td id='wed6'></td><td id='thu1'></td><td id='fri6'></td></tr>";
						roomArr+="<tr><td>15:00~15:50 - (7교시)</td><td id='mon7'></td><td id='tue7'></td><td id='wed7'></td><td id='thu1'></td><td id='fri7'></td></tr>";
						roomArr+="<tr><td>16:00~16:50 - (8교시)</td><td id='mon8'></td><td id='tue8'></td><td id='wed8'></td><td id='thu1'></td><td id='fri8'></td></tr>";
						roomArr+="<tr><td>17:00~17:50 - (9교시)</td><td id='mon9'></td><td id='tue9'></td><td id='wed9'></td><td id='thu1'></td><td id='fri9'></td></tr>";
						$("#roomTable").html(roomArr);
						
						re.forEach(function(item){
						
							 var subDate=item["SUB_DATE"];
							 var subTime=item["SUB_TIME"];
							 var subName=item["SUB_NAME"];
							 var profName=item["PROF_NAME"];
							 var subRoom=item["DEPT_NAME"];
							 var completePt=item["COMPLETE_PT"];
							 
								console.log(subTime.substr(0,2));
							if(subDate=='월') {
								if(subTime.substr(0,2)=="09") {
									$("#mon1").html(subName+"<br>("+subRoom+", "+profName+")");
									if(completePt=='2'){
										$("#mon1").attr(rowspan='2');
									}else{
										$("#mon1").attr(rowspan='3');
									}
								}
								if(subTime.substr(0,2)=="10") {
									$("#mon2").html(subName+"<br>("+subRoom+", "+profName+")");
									if(completePt=='2'){
										$("#mon2").attr("rowspan",'2');
										$("#mon3").remove();
									}else{
										$("#mon2").attr("rowspan",'2');
										$("#fri3").not(":eq(0)").remove();
									}
								}
								if(subTime.substr(0,2)=="11") {
									$("#mon3").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.substr(0,2)=="12") {
									$("#mon4").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.substr(0,2)=="13") {
									$("#mon5").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.substr(0,2)=="14") {
									$("#mon6").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.substr(0,2)=="15") {
									$("#mon7").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.substr(0,2)=="16") {
									$("#mon8").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.substr(0,2)=="17") {
									$("#mon9").html(subName+"<br>("+subRoom+", "+profName+")");
								}
							}
							if(subDate=='화') {
								if(subTime.includes("09:00")) {
									$("#tue1").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("10:00")) {
									$("#tue2").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("11:00")) {
									$("#tue3").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("12:00")) {
									$("#tue4").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("13:00")) {
									$("#tue5").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("14:00")) {
									$("#tue6").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("15:00")) {
									$("#tue7").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("16:00")) {
									$("#tue8").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("17:00")) {
									$("#tue9").html(subName+"<br>("+subRoom+", "+profName+")");
								}
							}
							if(subDate=='수') {
								if(subTime.includes("09:00")) {
									$("#wed1").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("10:00")) {
									$("#wed2").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("11:00")) {
									$("#wed3").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("12:00")) {
									$("#wed4").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("13:00")) {
									$("#wed5").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("14:00")) {
									$("#wed6").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("15:00")) {
									$("#wed7").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("16:00")) {
									$("#wed8").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("17:00")) {
									$("#wed9").html(subName+"<br>("+subRoom+", "+profName+")");
								}
							}
							if(subDate=='목') {
								if(subTime.includes("09:00")) {
									$("#thu1").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("10:00")) {
									$("#thu2").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("11:00")) {
									$("#thu3").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("12:00")) {
									$("#thu4").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("13:00")) {
									$("#thu5").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("14:00")) {
									$("#thu6").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("15:00")) {
									$("#thu7").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("16:00")) {
									$("#thu8").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("17:00")) {
									$("#thu9").html(subName+"<br>("+subRoom+", "+profName+")");
								}
							}
							if(subDate=='금') {
								if(subTime.includes("09:00")) {
									$("#fri1").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("10:00")) {
									$("#fri2").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("11:00")) {
									$("#fri3").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("12:00")) {
									$("#fri4").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("13:00")) {
									$("#fri5").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("14:00")) {
									$("#fri6").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("15:00")) {
									$("#fri7").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("16:00")) {
									$("#fri8").html(subName+"<br>("+subRoom+", "+profName+")");
								}
								if(subTime.includes("17:00")) {
									$("#fri9").html(subName+"<br>("+subRoom+", "+profName+")");
								}
							}
						})
					}
				});
			});
			
			window.onload = function (){
			  	  appendYear();
			    }
				
				
				function appendYear(){
					var date = new Date();
					var year = date.getFullYear();
					var selectValue = document.getElementById("year");
					var optionIndex = 0;
			
					for(var i=year;i<=year+5;i++){
							selectValue.add(new Option(i,i),optionIndex++);
					}
				}
				
			$(function(){
	        	$("#roomTitle").change(function(){
	        		$.ajax({
	        			url:"${path}/selectRoom.hd",
	        			data:{"roomValue":$("#roomTitle").val()},
	        			success:function(data){
	        				let rooms=JSON.parse(data);
	        				let roomTitle = "<option value='select' id='selectDepartment'>강의실 선택</option>";
	        				for(let i = 0; i < rooms.length; i++) {
	        				roomTitle += "<option value='"+rooms[i]['SUB_ROOM']+"' id='selectRoom'>"+rooms[i]['SUB_ROOM']+"</option>";
	        				}
	        			
	        				$('#classRoom').html(roomTitle);
							$('#classRoom').change(function(){
								$("#selectDepartment").attr('disabled',true);
							});
	        			}
		            });
		        });
	        });
			
			$("#roomTitle").change(function(){
				$("#roomTitlec").attr('disabled',true);
			 });
			
			</script>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>
