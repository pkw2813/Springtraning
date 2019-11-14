<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<style>
	.but{
		text-align:center;
	}
	th, td{
		text-align:center;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="card">
                <div class="card-body">
                  <form class="form-sample" action="${path }/subInsert.hd">
                    <h4 class="card-title">커리큘럼 등록</h4>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year" name="subYear">
                            </select>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학년 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" name="targetGrade">
                            	<option value="1">1학년</option>
                            	<option value="2">2학년</option>
                            	<option value="3">3학년</option>
                            	<option value="4">4학년</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-4">
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
                          <div class="col-sm-4">
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
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학부 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectColleage">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학과 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectDepartment" name="deptCode">
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">과목 명</label>
                          <div class="col-sm-9">
                          	<select class="form-control" name="subName" id="subName">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 목표</label>
                          <div class="col-sm-9">
                          	<select class="form-control" name="targetSubject" id="targetSubject">
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">이수 구분</label>
                          <div class="col-sm-9">
                            <select class="form-control" name="subType">
                            	<option value="전공필수">전공필수</option>
                            	<option value="전공선택">전공선택</option>
                            	<option value="교양필수">교양필수</option>
                            	<option value="교양선택">교양선택</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">이수 학점</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="comPt" name="completePt">
                            	<option value="2">2학점</option>
                            	<option value="3">3학점</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <h4 class="card-title">강의상세 등록</h4>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 요일</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="subDay" name="subDate">
                            	<option value="월">월</option>
                            	<option value="화">화</option>
                            	<option value="수">수</option>
                            	<option value="목">목</option>
                            	<option value="금">금</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4">
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
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의실</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="classRoom" name="subRoom">
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                      
                    
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 시작시간</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="roomTime">
                            	<option id="roomTimec">시간선택</option>
                            	<option value="09:00" class="roomT">09:00</option>
                            	<option value="10:00" class="roomT">10:00</option>
                            	<option value="11:00" class="roomT">11:00</option>
                            	<option value="12:00" class="roomT">12:00</option>
                            	<option value="13:00" class="roomT">13:00</option>
                            	<option value="14:00" class="roomT">14:00</option>
                            	<option value="15:00" class="roomT">15:00</option>
                            	<option value="16:00" class="roomT">16:00</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 종료시간</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="endTime" readonly>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div id="lastForm">
                    	
                    </div>
                    <div class="row">
                    	<div class="col-md-12 but">
                    		<input type="hidden" id="subTime" name="subTime"/>
	                    	<input type="submit" class="btn btn-inverse-info btn-fw" value="저장하기" id="submitBtn"/>&nbsp&nbsp&nbsp
	                    	<input type="reset" class="btn btn-inverse-info btn-fw" value="초기화"/>
	                    </div>
                    </div>
                  </form>
                </div>
              </div>
              <br/><br/>
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Basic Table</h4>
                  <p class="card-description">
                    Add class <code>.table</code>
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>년도</th>
                          <th>학년</th>
                          <th>학기</th>
                          <th>학부</th>
                          <th>요일</th>
                          <th>강의실</th>
                          <th>강의시간</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Jacob</td>
                          <td>53275531</td>
                          <td>12 May 2017</td>
                          <td><label class="badge badge-danger">Pending</label></td>
                          <td><label class="badge badge-danger">Pending</label></td>
                          <td><label class="badge badge-danger">Pending</label></td>
                          <td><label class="badge badge-danger">Pending</label></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

	<script>
	
		 $("#submitBtn").click(function(){
			var rt=$("#roomTime").val();
			var cp=$("#comPt").val();
			var intrt=parseInt(rt);
			
			if(cp==3){
				$("#subTime").val(rt+","+(intrt+1)+":00,"+(intrt+2)+":00");
			}
			else if(cp==2){
				$("#subTime").val(rt+","+(intrt+1)+":00");
			}
			
			
		}); 
	
		window.onload = function (){
	  	  appendYear();
	    }
		
		
		function appendYear(){
			var date = new Date();
			var year = date.getFullYear();
			var selectValue = document.getElementById("year");
			var optionIndex = 0;
	
			for(var i=year;i<=year+10;i++){
					selectValue.add(new Option(i,i),optionIndex++);
			}
		}
		
		 $(function() {
     		$(document).ready(function(){
     			$.ajax({
     				type : "post",
     				url : "${pageContext.request.contextPath}/selectColList.do",
     				success: function(data) {
     					let colListHtml = "";
     					colListHtml = "<option value='select' id='selColleage'>학부 선택</option>";
     					for(let i = 0; i < data.list.length; i++) {
     						let cols = data.list[i];
     						colListHtml += "<option value='"+cols['COL_CODE']+"' class='colList'>"+cols['COL_NAME']+"</option>";
     					}
     					
     					$('.selectColleage').html(colListHtml);
     						$('.selectColleage').change(function(){
     							$("#selColleage").attr('disabled',true);
     						})
     				}
     			})
     		})
     	});
		 
		 $("#roomTitle").change(function(){
			$("#roomTitlec").attr('disabled',true);
		 });
		 

		 $("#comPt").change(function(){
			 timePlue();
		 });
		 
		 
		 
			 $("#roomTime").change(function(){
					$("#roomTimec").attr('disabled',true);
					timePlue();
			 });
		 function timePlue(){
				var comPt=$("#comPt").val();
				var roomTime=$("#roomTime").val();

				var intcom=parseInt(comPt);
				var introomt=parseInt(roomTime);
				
				$("#endTime").val(intcom+introomt+":50");
				if($("#endTime").val()=="NaN:50"){
					$("#endTime").val("강의 시작시간 선택");
				}
		 }
		 
       
        $(function(){
     	 	$('.selectColleage').change(function(){
     			$.ajax({
     				type : "post",
     				url: "${pageContext.request.contextPath}/selectDeptList.do",
     				data: {"result" : $('.selectColleage').val()},
     				success: function(data) {
     					let deptListHtml = "<option value='select' id='selectDepartment'>학과 선택</option>";
     					for(let i = 0; i < data.list.length; i++) {
     						let depts = data.list[i];

     						deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
     					}
     					
     					$('.selectDepartment').html(deptListHtml);
     						$('.selectDepartment').change(function(){
     						$("#selectDepartment").attr('disabled',true);
     					
     			});
     	 	}
     	 });
     		 });
     	 }); 
        
        $(function(){
        	$(".selectDepartment").change(function(){
        		var dep=$(".selectDepartment").val();
        		$.ajax({
        			url:"${path}/selectCurri.hd",
        			data:{"deptCode":dep},
        			success:function(data){
        			var subNameArr="<option id='selectSubName'>과목명 선택</option>";
        			var targetSubjectArr="<option id='selecttargetSubject'>강의목표 선택</option>";
        			var subCodeArr="";
        					console.log(data);
        					let re=JSON.parse(data);
        				for(let i = 0; i < re.length; i++) {
        					console.log(re.length);
        					var dataDept=re[i];
	        				subNameArr+="<option value='"+dataDept['SUB_NAME']+"'  class='subName'>"+dataDept['SUB_NAME']+"</option>";
	        				targetSubjectArr+="<option value='"+dataDept['TARGET_SUBJECT']+"'  class='targetSubject'>"+dataDept['TARGET_SUBJECT']+"</option>";
	        				subCodeArr="<input type='hidden' name='subCode' value='"+dataDept["SUB_CODE"]+"'>";
        				}
        				$('#subName').html(subNameArr);
            			$("#targetSubject").html(targetSubjectArr);
    						$('#subName').change(function(){
    							$("#selectSubName").attr('disabled',true);
            				});
    						$('#targetSubject').change(function(){
    							$("#selecttargetSubject").attr('disabled',true);
            				});
    					$("#lastForm").html(subCodeArr);
        			}
	        	});
	        });
        });
        
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
        

	        $(function(){
	        	$("#classRoom").change(function(){
	        		 var day=$("#subDay").val();
	        		 var room=$("#classRoom").val();
	        		 var semester=$('input[name="subSemester"]:checked').val();
	        		 var year=$("#year").val();
	
	        		 $.ajax({
	        			 url:"${path}/selectTime.hd",
	        			 data:{"subYear":year,"subSemester":semester,"subDate":day,"subRoom":room},
	        			 success:function(data){
	        				 let re=JSON.parse(data);
	        				 
	        				 var arr = new Array;
	     			        $("#roomTime option").each ( function() {
	     			            arr.push ( $(this).val() );
	     			        });
	     			        
	     			        for(var i=0; i<arr.length; i++){
	     			        	var arrs=arr[i];
	     			        }
	     			        
	         				$("#roomTime option").prop("disabled", false); // 초기화
	        				 for(var i=0; i<re.length;i++){
	     			       		 var res = [];
	        					 var res=re[i]["subTime"].split(",");
	        					 console.log(res);
	       						// roomTime 하위의 옵션 중 res에 있는것들을 disable
	        					for(var k=0; k < res.length; k++){
	          						// disable
	          						$("#roomTime option").each(function(){
	          							 if ( res[k] == $(this).val() ) {
	          								 console.log($(this).val(), res[k]==$(this).val());
	          								 $(this).attr("disabled", true);
	          								 var et=$("#endTime").val();
	          								 
	          							 }
	          						 });
	        					 }
	        				 }
	        			 }
	        		 });
	        	});
	        });
       
        
	</script>

       





		<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>
