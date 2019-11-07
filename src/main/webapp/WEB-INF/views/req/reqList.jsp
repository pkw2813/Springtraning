<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
	th{
		text-align:center !important;
	}
	td{
		heigth:20px !important;
		text-align:center !important;
	}
</style>
<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="main-panel">
	<div class="content-wrapper">
	
	 <div class="container">
      <div class="row">
        <div class="col">
          <p>Tab</p>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab">전체</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab">접수</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab">처리완료</a>
              </li>
            </ul>
            
            <div class="tab-content tab-pane fade show">
              <div class="card">
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호 </th>
                          <th>제목</th>
                          <th>보낸 사람</th>
                          <th>보낸 시간</th>
                          <th>처리</th>
                        </tr>
                      </thead>
                      <tbody id="tbody">
                      <c:forEach items="${allList }" var="l" varStatus="v">
                        <tr class="reqOne">
                          <td>${l.reqNo }<input type="hidden" value="${l.reqNo }" class="reqNo"/></td>
                          <td>${l.reqTitle }</td>
                          <td>${l.toName }</td>
                          <td>${l.toTime }</td>
                          <td><button class="btn btn-inverse-info btn-fw">${l.reqRead }</button></td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    <div id="pageConainer">
                    ${pageBar }
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

        </div>
      </div>
    </div>
			   <%-- <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Hoverable Table</h4>
                  <p class="card-description">
                    Add class <code>.table-hover</code>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호 </th>
                          <th>제목</th>
                          <th>보낸 사람</th>
                          <th>보낸 시간</th>
                          <th>처리</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${list }" var="l" varStatus="v">
                        <tr class="reqOne">
                          <td>${v.count }<input type="hidden" value="${l.reqNo }" class="reqNo"/></td>
                          <td>${l.reqTitle }</td>
                          <td>${l.toName }</td>
                          <td>${l.toTime }</td>
                          <td><button class="btn btn-inverse-info btn-fw">${l.reqRead }</button></td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div> --%>
       
              <script>
              
              
               
               
               $(function(){
            	   $(".nav-tabs>li").first().trigger("click");
               })
               
	             $(".nav-tabs>li").on("click",function(){ 
	            	 ajaxData($(this).index());
	             });
             
               function ajaxData(index,cPage){
	               $.ajax({
	          		 url:'${path}/ajax/reqList.hd',
	          		 data:{'index': index,cPage:cPage},
	          		 success:function(data){
	          			 var raw = JSON.parse(data);
	          			 var arr="";
	          			 for(var i=0;i<raw['allList'].length;i++){
	          				 console.log(raw['allList'][i].reqTitle);
	          				 arr+="<tr class='reqOne'>";
	          				 arr+="<td>"+ raw['allList'][i].reqNo +"<input type='hidden' value='' class='reqNo'/></td>";
	          				 arr+="<td>"+raw['allList'][i].reqTitle +"</td>";
	          				 arr+="<td>"+raw['allList'][i].toName +"</td>";
	          				 arr+="<td>"+raw['allList'][i].toTime +"</td>";
	          				 arr+="<td><button class='btn btn-inverse-info btn-fw'>"+raw['allList'][i].reqRead +"</button></td></tr>"; 
	          			 }
	          			 $("#tbody").html(arr);
	          			 $("#pageConainer").html(raw['pageBar']);
	          			 $(".reqOne").click(function(){
	                      	   console.log($($($(this).children())[0]).children().val());
	                      	   location.href="${path}/reqOne.hd?reqNo="+$($($(this).children())[0]).children().val();
	                         });
	          		 }
	          	 	});
               }
        </script>
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>