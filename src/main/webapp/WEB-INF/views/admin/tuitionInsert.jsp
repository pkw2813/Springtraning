<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<style>
	.form-control{
		text-align:center;
	}
	.col-sm-9{
		margin-left:-30px;
	}
	option{
		text-align:center;
	}

</style>
<div class="main-panel">
	<div class="content-wrapper">
			   <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Horizontal Two column</h4>
                  <form class="form-sample">
                    <p class="card-description">
                      Personal info
                    </p>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-4 col-form-label">년도 선택</label>
                          <div class="col-sm-7">
                            <select class="form-control selectDepartment" id="year">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group row firstForm">
                          <label class="col-sm-4 col-form-label">학년 선택</label>
                          <div class="col-sm-7">
                            <select class="form-control selectDepartment">
                              <option>1 학년</option>
                              <option>2 학년</option>
                              <option>3 학년</option>
                              <option>4 학년</option>
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
                                <input type="radio" class="form-check-input" name="membershipRadios" value="1학기">
                                1학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-5">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios" value="2학기">
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
                              <option>Male</option>
                              <option>Female</option>
                              <option>Female</option>
                              <option>Female</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학과 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectDepartment">
                              <option>Category1</option>
                              <option>Category2</option>
                              <option>Category3</option>
                              <option>Category4</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">등록금 금액</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="tuition" placeholder="0,000,000" onkeyup="inputNumberFormat(this)">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">납부 기한</label>
                          <div class="col-sm-9">
                            <input class="form-control" placeholder="dd/mm/yyyy">
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>

		<script>
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
            						$("#selCol").attr('disabled',true);
            		});
            				}
            			});
            		});
            	});
              
              
              $(function(){
            	 	$('.selColleage').change(function(){
            	 		let val = $('.selColleage').val();
            			$.ajax({
            				type : "post",
            				url: "${pageContext.request.contextPath}/selectDeptList.do",
            				data: {"result" : $('.selColleage').val()},
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
              
              function inputNumberFormat(obj) {
              obj.value = comma(uncomma(obj.value));
	          }
	
	          function comma(str) {
	              str = String(str);
	              return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	          }
	
	          function uncomma(str) {
	              str = String(str);
	              return str.replace(/[^\d]+/g, '');
	          }
	          
	          window.onload = function (){
	        	  appendYear();
	          }
	          
		      function appendYear(){
		        		var date = new Date();
		        		var year = date.getFullYear();
		        		var selectValue = document.getElementById("year");
		        		var optionIndex = 0;
	
		        		for(var i=year;i<=year+20;i++){
		        				selectValue.add(new Option(i+"년",i),optionIndex++);
		        	}
		        		
		        		 
		        }
	          

              
              </script>










		<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>