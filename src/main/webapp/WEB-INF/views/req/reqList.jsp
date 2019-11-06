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
			   <div class="card">
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
              </div>
       
              <script>
               $(".reqOne").click(function(){
            	   console.log($($($(this).children())[0]).children().val());
            	   location.href="${path}/reqOne.hd?reqNo="+$($($(this).children())[0]).children().val();
               });
              
        </script>
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>