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
                    <input type="submit" class="btn btn-primary mb-2" value="조회">
                    </div>
                  </form>
                    </div>
                </div>
              </div>
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
