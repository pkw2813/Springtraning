<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="card">
                <div class="card-body">
                  <form class="form-sample">
                    <h4 class="card-title">커리큘럼 등록</h4>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year">
                            </select>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학년 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year">
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
                                <input type="radio" class="form-check-input" name="membershipRadios" value="1">
                                1학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios" value="2">
                               	
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
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 목표</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">이수 구분</label>
                          <div class="col-sm-9">
                            <select class="form-control">
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
                            <select class="form-control">
                            	<option value="2">2점</option>
                            	<option value="3">3점</option>
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
                            <select class="form-control">
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
                            <select class="form-control">
                            	<option value="A101">A101</option>
                            	<option value="A102">A102</option>
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
                            <select class="form-control">
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
                          <label class="col-sm-3 col-form-label">강의 종료시간</label>
                          <div class="col-sm-9">
                            <select class="form-control">
                            	<option value="2">2점</option>
                            	<option value="3">3점</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    
                  </form>
                </div>
              </div>

	<script>
	
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
     				url: "${pageContext.request.contextPath}/selectColList.do",
     				success: function(data) {
     					let colListHtml = "";
     					colListHtml = "<option value='select' id='selColleage'>학부 선택</option>";
     					for(let i = 0; i < data.list.length; i++) {
     						let cols = data.list[i];
     						console.log(cols['COL_CODE']);
     						colListHtml += "<option value='"+cols['COL_CODE']+"'  class='colList'>"+cols['COL_NAME']+"</option>";
     					}
     					
     					$('.selectColleage').html(colListHtml);
     						$('.selectColleage').change(function(){
     							$("#selColleage").attr('disabled',true);
     						})
     				}
     			})
     		})
     	});
       
        $(function(){
     	 	$('.selectColleage').change(function(){
     	 		console.log($('.selectColleage').val());
     			$.ajax({
     				type : "post",
     				url: "${pageContext.request.contextPath}/selectDeptList.do",
     				data: {"result" : $('.selectColleage').val()},
     				success: function(data) {
     					console.log(data);
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
        	$("#roomTitle").change(function(){
        		$.ajxa({
        			url:"${path}/selectRoom.hd",
        			data:{"roomValue":$("#roomTitle").val()},
        			success:function(data){
        				
        			}
        		});
            	
            });
        });
        
	</script>

       





		<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>