<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="main-panel">
        <div class="content-wrapper">
        
         <div class="container">
          <div class="row">
            <div class="col">
                <ul class="nav nav-tabs">
                  <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab">학생</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab">교수</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab">교직원</a>
                  </li>
                </ul>
                
                <div class="tab-content tab-pane fade show">
                  <div class="card">
                    <div class="card-body">
                      <div class="table-responsive">
                        <table class="table table-hover">
                          <thead>
                                  <tr>
                                      <th>학과</th>
                                      <th>개인 번호</th>
                                      <th> 이름</th>
                                      <th>전화 번호</th>
                                      <th>이메일</th>
                                      <th> 주소</th>
                                  </tr>
                          </thead>
                          <tbody id="tbody">
                
                        </tbody>
                        </table>
                        <div id="pageConainer">

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
    
            </div>
          </div>
        </div>
                   


<script>


     $(function(){
            	   $(".nav-tabs>li").first().trigger("click");
               })
               
	             $(".nav-tabs>li").on("click",function(){ 
	            	 ajaxData($(this).index());
	             });

     function ajaxData(index,cPage){
	               $.ajax({
	          		 url:'${path}/col/changeColList.hd',
	          		 data:{'index': index,'cPage':cPage},
	          		 success:function(data){
                         var arr="";
	          			 for(var i=0;i<data['list'].length;i++){
	          				 arr+="<tr class='memList'>";
	          				 arr+="<td>" + data['list'][i].DEPT_NAME +"</td>";
	          				 arr+="<td>" + data['list'][i].PROF_ENROLL +"<input type='hidden' value='"+ data['list'][i].PROF_ENROLL +"' class='num'/></td>";
	          				 arr+="<td>" + data['list'][i].PROF_NAME +"</td>";
	          				 arr+="<td>" + data['list'][i].PHONE +"</td>";
	          				 arr+="<td>" + data['list'][i].EMAIL +"</td>";
	          				 arr+="<td>" + data['list'][i].ADDRESS +"</td></tr>";
	          			 }
                         $("#tbody").html(arr);
	          			 $("#pageConainer").html(data['pageBar']);
	          			//  $(".reqOne").click(function(){
                            //    location.href="${path}/reqOne.hd?reqNo="+$($($(this).children())[0]).children().val();
	                        //  });
	          		 }
	          	 	});
               }


$(function() {
	$(document).ready(function(){

		$.ajax({
			type : "post",
			url: "${pageContext.request.contextPath}/selectColList.do",
			success: function(data) {
	
				let colListHtml = "";
				
				colListHtml = "<option value='select' id='selCol'>대학 선택</option>";
				for(let i = 0; i < data.list.length; i++) {
					let cols = data.list[i];
					colListHtml += "<option value='"+cols['COL_CODE']+"'  class='colList'>"+cols['COL_NAME']+"</option>";
				}
				
				$('.selectCol').html(colListHtml);
					$('.selectCol').change(function(){
					$("#selCol").attr('disabled',true);
			
		
	})
			
			}

		})
	})
});



//대학이 선택 되었을때 해당 대학에 포함되어 있는 학과를 리스트로 가져옴
 $(function(){
 	$('.selectCol').change(function(){
 		let val = $('.selectCol').val();
		$.ajax({
			type : "post",
			url: "${pageContext.request.contextPath}/selectDeptList.do",
			data: {"result" : $('.selectCol').val()},
			success: function(data) {
				let deptListHtml = "<option value='select' id='selDept'>학과 선택</option>";
				for(let i = 0; i < data.list.length; i++) {
					let depts = data.list[i];

					deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
				}
				
				$('.selectdep').html(deptListHtml);
					$('.selectdep').change(function(){
					$("#selDept").attr('disabled',true);
		});
 	}
 });
	 });
 });



</script>

<style>
	.gap0{
		height:50px;
	}
	.gap1{
		height:100px;
	}
	.gap2{
		height:200px;
	}
	.gap3{
		height:300px;
	}
	.modal{
		display: none;
		position : fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height:100%;	
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
            
        ul.tabs{
        margin: 0px;
        padding: 0px;
        list-style: none;
        }
        ul.tabs li{
        background: none;
        color: #222;
        display: inline-block;
        padding: 10px 15px;
        cursor: pointer;
        }
        
        ul.tabs li.current{
        background: #ededed;
        color: #222;
        }
        
        .tab-content{
        
        background: #ededed;
        padding: 15px;
        }
        
        .tab-content.current{
        display: inherit;
        }

</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>