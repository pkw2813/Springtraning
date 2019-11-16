<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
	.btnSize{
		width:30%;
		height:130%;
	}
	.modal-content{
		width:30%;
	}
	th, td{
		text-align:center;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
			<div class="card">
                <div class="card-body">
					<br>
                 		<div class="row">
                 			<div class="col-sm-12" style="text-align:center">
	                  		<button class="btn btn-outline-dark btn-icon-text btnSize" id="colBtn">
	                          <i class="ti-settings btn-icon-prepend" style="font-size:18px;"></i>
	                          <span class="d-inline-block text-left" style="font-size:18px;">
	                            	학부 개설
	                          </span><br>
	                            <small class="font-weight-light d-block" style="margin-top:10px; font-size:14px">현재 개설 학부 : ${colCount }</small>
	                        </button>
	                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	                        <button class="btn btn-outline-dark btn-icon-text btnSize" id="deptBtn">
	                          <i class="ti-settings btn-icon-prepend" style="font-size:18px;"></i>
	                          <span class="d-inline-block text-left" style="font-size:18px;">
	                            	학과 개설
	                          </span>
	                            <small class="font-weight-light d-block" style="margin-top:10px; font-size:14px" >현재 개설 학과 : ${deptCount }</small>
	                        </button>
	                        </div>
                        </div>
                </div><br><br>
              </div>
            <br><br>
            
          
          <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">학부 조회</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                       	  <th style="width:10%">번호</th>
                          <th style="width:50%">학부 명</th>
                          <th style="width:20%">학부명 수정</th>
                          <th style="width:20%">학부 폐설</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="c" items="${colList }" varStatus="v">
                        <tr>
                          <td>${v.count }</td>
                          <td>${c.colName }</td>
                          <td><button class="btn btn-inverse-info btn-fw">수정</button></td>
                          <td><button class="btn btn-inverse-info btn-fw">폐설</button></td>
                        </tr>
                       </c:forEach>
                      </tbody>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">학과 조회</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
	                       <tr>
	                         <th style="width:30%">학부명</th>
	                         <th style="width:30%">학과명</th>
	                         <th style="width:20%">학과명 수정</th>
	                         <th style="width:20%">학과 폐설</th>
	                       </tr>
                      </thead>
                      <tbody>
                       <c:forEach var="d" items="${deptList }" varStatus="v">
                        <tr>
                          <td>${d.COL_NAME }</td>
                          <td>${d.DEPT_NAME }</td>
                          <td><button class="btn btn-inverse-info btn-fw">수정</button></td>
                          <td><button class="btn btn-inverse-info btn-fw">폐설</button></td>
                        </tr>
                       </c:forEach>
                      </tbody>
                    </table>
                    ${pageBar }
                  </div>
                </div>
              </div>
            </div>
              </div>
            
           <div id="colModal" class="modal">
 
		      <div class="modal-content">
		      	<form>
				         <span class="close" id="colModalclose">&times;</span>
				         <p>학부개설</p>
				         <div class="form-group">
				         <input type="text" id="reqTitle" name="colName" placeholder="개설할 학부명을 입력해주세요" class="form-control" autocomplete="off"/>
				         </div>
				         <input type="button" class="btn btn-inverse-info btn-fw" id="colModalclose1" value="취소" style="float: right; margin: 7px;">
				         <input type="submit" class="btn btn-inverse-info btn-fw" value="저장" style="float: right; margin: 7px;">
				         <br>
				         <br>
		      	</form>	
		      </div>
		    </div>
		    
		    
		    <div id="deptModal" class="modal">
 
		      <div class="modal-content">
		      	<form>
				         <span class="close" id="deptModalclose">&times;</span>
				         <p>학부개설</p>
				         <div class="form-group">
                            <select class="form-control selectColleage">
                            </select><br>
				         <input type="text" id="reqTitle" name="colName" placeholder="개설할 학과명을 입력해주세요" class="form-control" autocomplete="off"/>
				         </div>
				         <input type="button" class="btn btn-inverse-info btn-fw" id="deptModalclose1" value="취소" style="float: right; margin: 7px;">
				         <input type="submit" class="btn btn-inverse-info btn-fw" value="저장" style="float: right; margin: 7px;">
				         <br>
				         <br>
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
        							$("#selColleage").attr('disabled',true);
        						})
        				}
        			})
        		})
        	});
		    
     // Get the modal
        var colModal = document.getElementById('colModal');
        var deptModal = document.getElementById('deptModal');
        // Get the button that opens the modal
        var colBtn = document.getElementById("colBtn");
        var deptBtn = document.getElementById("deptBtn");
        // Get the <span> element that closes the modal
        var colModalclose = document.getElementById("colModalclose");                                          
        var colModalclose1 = document.getElementById("colModalclose1"); 
        var deptModalclose = document.getElementById("deptModalclose");                                          
        var deptModalclose1 = document.getElementById("deptModalclose1"); 
        // When the user clicks on the button, open the modal 
        colBtn.onclick = function() {
        	colModal.style.display = "block";
        }
        deptBtn.onclick = function() {
        	deptModal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        colModalclose.onclick = function() {
        	colModal.style.display = "none";
        }
        colModalclose1.onclick = function() {
        	colModal.style.display = "none";
        }
        deptModalclose.onclick = function() {
        	deptModal.style.display = "none";
        }
        deptModalclose1.onclick = function() {
        	deptModal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        /* window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        } */

        </script>
      

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>
